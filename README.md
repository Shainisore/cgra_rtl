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

### `software/6.15_kernel_modification/`

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

### `software/cmmu_driver_csr/`

This directory contains the kernel modules that implement `cxl_cmmu_map()` and `cxl_cmmu_unmap()` as well as interrupt handler

### `software/cmmu_csr_op/`

Small user-space utilities for direct CSR access.

- `cxl_cmmu_csr.c`
  A simple CSR read/write tool.
- `status.c`
  A live terminal monitor for partition-level counters, usage, watermarks, trigger state, interrupt bits, and global freelist/zspage information.

### `software/set_partition`

A helper executable that sets the current task's compression domain and then `exec`s a target command.

Usage:

```bash
./software/set_partition -n <partition_id> <command> [args...]
```

### `software/wp_setup.sh`

A sample setup script.

### `example.sh`

A sample launcher used with SPEC CPU2017.

## Notes

- BAR2 is hard-coded at `0x22feffa00000` in both CSR utilities and the kernel module. It should be set to your local fpga's function 1 bar2 address.
