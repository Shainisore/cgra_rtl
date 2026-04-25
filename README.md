## Repository layout

```text
software/
├── 6.15_kernel_modification/
├── cmmu_csr_op/
├── cmmu_driver_csr/
├── set_partition
└── wp_setup.sh
example.sh
```

## What each component does

### `software/6.15_kernel_modification/`

These files are patches/snippets against a Linux 6.15 kernel tree.

They add the software hooks needed for the CMMU-aware page allocator flow:

- `cxl_cmmu.h`
  Exposes the kernel callback pointers `cxl_cmmu_map()` and `cxl_cmmu_unmap()`.
- `page_alloc.c`
  Calls the exported hooks when pages from the CXL NUMA node are allocated or freed.
- `sched.h`
  Adds a per-task `cxl_partition` field.
- `init_task.c`
  Initializes `cxl_partition` for the boot task.
- `syscalls.c`
  Adds two syscalls:
  - `getcxl_partition(pid)`
  - `setcxl_partition(index)`
- `syscall_64.tbl`
  Registers syscall numbers `468` and `469` for the new partition syscalls.

These files are examples of the required kernel modifications; they are not a complete kernel tree. You need to merge them into your own Linux 6.15 source tree and rebuild the kernel.

### `software/cmmu_driver_csr/`

This directory contains the kernel modules that talk to the FPGA CSRs.

- `cmmu_map.c`
  Maps BAR2 at `0x22feffa00000`, exports the `cxl_cmmu_map` / `cxl_cmmu_unmap` callbacks, and translates page allocator events into CMMU map/unmap commands.
- `cmmu_interrupt.c`
  Registers an interrupt handler for the FPGA PCIe function (`8086:0x0ddb`), monitors partition usage, and uses cgroup control files to freeze/reclaim memory when a partition interrupt fires.
- `cmmu.h`
  Shared declarations.
- `Makefile`
  Builds `cmmu_map.ko` and `cmmu_interrupt.ko` against an external kernel tree.

### `software/cmmu_csr_op/`

Small user-space utilities for direct CSR access through `/dev/mem`.

- `cxl_cmmu_csr.c`
  A simple CSR read/write tool. In write mode it emits control commands to CSR offset `0x100`; in read mode it reads back a CSR at a given offset.
- `status.c`
  A live terminal monitor for partition-level counters, usage, watermarks, trigger state, interrupt bits, and global freelist/zspage information.

These tools require root because they map BAR2 through `/dev/mem`.

### `software/set_partition`

A prebuilt helper executable that sets the current task's CXL partition and then `exec`s a target command.

Usage:

```bash
./software/set_partition -n <partition_id> <command> [args...]
```

This depends on the custom `setcxl_partition` syscall added in the modified kernel.

### `software/wp_setup.sh`

A sample setup script showing how the author programmed watermark / trigger-related CSRs, adjusted `vm.swappiness`, loaded the two kernel modules, and created the `cmmu0`-`cmmu3` cgroups.

It is a workflow example, not a generic installer. The hard-coded paths such as `CMMU_kernel/...` will likely need to be updated for your environment.

### `example.sh`

A sample launcher used with SPEC CPU2017. It:

1. moves the shell into `/sys/fs/cgroup/cmmu<partition_id>/cgroup.procs`
2. uses `numactl -m 1 -C <core>` to bind the benchmark
3. wraps the run with `set_partition -n <partition_id>`

It assumes a local CPU2017 installation at `/home/kevin/cpu2017` and a config named `my.cfg`.

## Typical software stack

The intended software flow is:

1. Boot a Linux 6.15 kernel containing the modifications in `software/6.15_kernel_modification/`.
2. Build and load the modules in `software/cmmu_driver_csr/`.
3. Program the FPGA-side CSRs with `software/cmmu_csr_op/cxl_cmmu_csr`.
4. Create one cgroup per CMMU partition.
5. Launch workloads through `software/set_partition` so the kernel allocator tags pages with the desired partition ID.
6. Monitor state with `software/cmmu_csr_op/status` and `dmesg`.

## Building

### Build the user-space CSR tools

```bash
cd software/cmmu_csr_op
gcc -O2 -o cxl_cmmu_csr cxl_cmmu_csr.c
gcc -O2 -o status status.c
```

### Build the kernel modules

The provided `Makefile` expects the kernel source tree at `../linux` relative to `software/cmmu_driver_csr/`:

```make
KDIR := ../linux
```

Adjust `KDIR` if your kernel source tree lives elsewhere, then build with:

```bash
cd software/cmmu_driver_csr
make
```

## Example setup sequence

A minimal version of the intended setup looks like this:

```bash
# program per-partition trigger / watermark CSRs
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x2 1 0x60000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x2 2 0x60000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x2 3 0x60000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x2 4 0x60000

sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x1 1 0x40000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x1 2 0x40000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x1 3 0x40000
sudo software/cmmu_csr_op/cxl_cmmu_csr 1 0x1 4 0x40000

# OS tuning
echo 100 | sudo tee /proc/sys/vm/swappiness

# load kernel modules
sudo insmod software/cmmu_driver_csr/cmmu_map.ko
sudo insmod software/cmmu_driver_csr/cmmu_interrupt.ko

# create cgroups
sudo mkdir -p /sys/fs/cgroup/cmmu0
sudo mkdir -p /sys/fs/cgroup/cmmu1
sudo mkdir -p /sys/fs/cgroup/cmmu2
sudo mkdir -p /sys/fs/cgroup/cmmu3

# monitor kernel log / interrupts
sudo dmesg -w
```

## Running a workload in a partition

For a generic command:

```bash
./software/set_partition -n 1 <your command> [args...]
```

For the SPEC-based example script:

```bash
./example.sh <core> <partition_id> <benchmark>
```

For example:

```bash
./example.sh 0 1 554.roms_r
```

## Monitoring

Run the status monitor as root:

```bash
sudo software/cmmu_csr_op/status
```

The monitor prints, per partition:

- total usage
- uncompressed usage
- compressed usage
- incompressible usage
- watermark values (`wp0`, `wp1`, `wp2`)
- raw trigger state
- interrupt bits

and also shows global freelist / zspage counters.

## Notes and assumptions

- BAR2 is hard-coded at `0x22feffa00000` in both CSR utilities and the kernel module.
- `cmmu_interrupt.c` assumes cgroup v2 files such as `memory.high`, `memory.reclaim`, and `cgroup.freeze` exist under `/sys/fs/cgroup/cmmu<id>/`.
- `example.sh` and `wp_setup.sh` contain machine-specific paths and should be treated as templates.
- `software/set_partition` is provided as a binary; its source is not included in this artifact.
- The kernel modifications and modules are coupled: the kernel exports the hook pointers, and `cmmu_map.ko` supplies the implementation.
