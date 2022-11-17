typedef struct packed {
  logic [5:0] ctrl ;
  logic [0:0] predicate ;
  logic [3:0][2:0] fu_in ;
  logic [7:0][2:0] outport ;
  logic [5:0][0:0] predicate_in ;
} CGRAConfig_6_4_6_8;

typedef struct packed {
  logic [31:0] payload ;
  logic [0:0] predicate ;
  logic [0:0] bypass ;
} CGRAData_32_1_1;

typedef struct packed {
  logic [0:0] payload ;
  logic [0:0] predicate ;
} CGRAData_1_1;

// PyMTL Component RegisterFile Definition
// Full name: RegisterFile__Type_CGRAData_32_1_1__nregs_100__rd_ports_4__wr_ports_4__const_zero_False
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py

module RegisterFile__456f3cd7314c3c2b
(
  input logic [0:0] clk,
  input logic [6:0] raddr [0:3],
  output CGRAData_32_1_1 rdata [0:3],
  input logic [0:0] reset,
  input logic [6:0] waddr [0:3],
  input CGRAData_32_1_1 wdata [0:3],
  input logic [0:0] wen [0:3]
);
  localparam logic [31:0] __const__rd_ports_at_up_rf_read = 32'd4;
  localparam logic [31:0] __const__wr_ports_at_up_rf_write = 32'd4;
  CGRAData_32_1_1 regs [0:99] ;

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:20
  // @s.update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] = s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int i = 0; i < __const__rd_ports_at_up_rf_read; i += 1 )
      rdata[i] = regs[raddr[i]];
  end

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:32
  // @s.update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int i = 0; i < __const__wr_ports_at_up_rf_write; i += 1 )
      if ( wen[i] ) begin
        regs[waddr[i]] <= wdata[i];
      end
  end

endmodule

// PyMTL Component RegisterFile Definition
// Full name: RegisterFile__Type_CGRAData_32_1_1__nregs_2__rd_ports_1__wr_ports_1__const_zero_False
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py

module RegisterFile__e355018d318c7c45
(
  input logic [0:0] clk,
  input logic [0:0] raddr [0:0],
  output CGRAData_32_1_1 rdata [0:0],
  input logic [0:0] reset,
  input logic [0:0] waddr [0:0],
  input CGRAData_32_1_1 wdata [0:0],
  input logic [0:0] wen [0:0]
);
  localparam logic [31:0] __const__rd_ports_at_up_rf_read = 32'd1;
  localparam logic [31:0] __const__wr_ports_at_up_rf_write = 32'd1;
  CGRAData_32_1_1 regs [0:1] ;

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:20
  // @s.update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] = s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int i = 0; i < __const__rd_ports_at_up_rf_read; i += 1 )
      rdata[i] = regs[raddr[i]];
  end

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:32
  // @s.update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int i = 0; i < __const__wr_ports_at_up_rf_write; i += 1 )
      if ( wen[i] ) begin
        regs[waddr[i]] <= wdata[i];
      end
  end

endmodule

// PyMTL Component RegisterFile Definition
// Full name: RegisterFile__Type_CGRAConfig_6_4_6_8__nregs_4__rd_ports_1__wr_ports_1__const_zero_False
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py

module RegisterFile__f6acff09b3a5d026
(
  input logic [0:0] clk,
  input logic [1:0] raddr [0:0],
  output CGRAConfig_6_4_6_8 rdata [0:0],
  input logic [0:0] reset,
  input logic [1:0] waddr [0:0],
  input CGRAConfig_6_4_6_8 wdata [0:0],
  input logic [0:0] wen [0:0]
);
  localparam logic [31:0] __const__rd_ports_at_up_rf_read = 32'd1;
  localparam logic [31:0] __const__wr_ports_at_up_rf_write = 32'd1;
  CGRAConfig_6_4_6_8 regs [0:3] ;

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:20
  // @s.update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] = s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int i = 0; i < __const__rd_ports_at_up_rf_read; i += 1 )
      rdata[i] = regs[raddr[i]];
  end

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:32
  // @s.update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int i = 0; i < __const__wr_ports_at_up_rf_write; i += 1 )
      if ( wen[i] ) begin
        regs[waddr[i]] <= wdata[i];
      end
  end

endmodule



// PyMTL Component RegisterFile Definition
// Full name: RegisterFile__Type_CGRAData_1_1__nregs_2__rd_ports_1__wr_ports_1__const_zero_False
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py

module RegisterFile__b2651f5e70154f41
(
  input logic [0:0] clk,
  input logic [0:0] raddr [0:0],
  output CGRAData_1_1 rdata [0:0],
  input logic [0:0] reset,
  input logic [0:0] waddr [0:0],
  input CGRAData_1_1 wdata [0:0],
  input logic [0:0] wen [0:0]
);
  localparam logic [31:0] __const__rd_ports_at_up_rf_read = 32'd1;
  localparam logic [31:0] __const__wr_ports_at_up_rf_write = 32'd1;
  CGRAData_1_1 regs [0:1] ;

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:20
  // @s.update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] = s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int i = 0; i < __const__rd_ports_at_up_rf_read; i += 1 )
      rdata[i] = regs[raddr[i]];
  end

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:32
  // @s.update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int i = 0; i < __const__wr_ports_at_up_rf_write; i += 1 )
      if ( wen[i] ) begin
        regs[waddr[i]] <= wdata[i];
      end
  end

endmodule