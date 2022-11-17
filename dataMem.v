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

// PyMTL Component DataMemRTL Definition
// Full name: DataMemRTL__DataType_CGRAData_32_1_1__data_mem_size_100__rd_ports_4__wr_ports_4
// At /home/kevin/Desktop/final_test/mem/data/DataMemRTL.py

module DataMemRTL__2aacae905ddf1f6e
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv_raddr__en [0:3],
  input logic [6:0] recv_raddr__msg [0:3],
  output logic [0:0] recv_raddr__rdy [0:3],
  input logic [0:0] recv_waddr__en [0:3],
  input logic [6:0] recv_waddr__msg [0:3],
  output logic [0:0] recv_waddr__rdy [0:3],
  input logic [0:0] recv_wdata__en [0:3],
  input CGRAData_32_1_1 recv_wdata__msg [0:3],
  output logic [0:0] recv_wdata__rdy [0:3],
  output logic [0:0] send_rdata__en [0:3],
  output CGRAData_32_1_1 send_rdata__msg [0:3],
  input logic [0:0] send_rdata__rdy [0:3]
);
  localparam logic [31:0] __const__rd_ports_at_update_signal = 32'd4;
  localparam logic [31:0] __const__wr_ports_at_update_signal = 32'd4;
  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk ;
  logic [6:0] reg_file__raddr [0:3] ;
  CGRAData_32_1_1 reg_file__rdata [0:3] ;
  logic [0:0] reg_file__reset ;
  logic [6:0] reg_file__waddr [0:3] ;
  CGRAData_32_1_1 reg_file__wdata [0:3] ;
  logic [0:0] reg_file__wen [0:3] ;

  RegisterFile__456f3cd7314c3c2b reg_file
  (
    .clk( reg_file__clk ),
    .raddr( reg_file__raddr ),
    .rdata( reg_file__rdata ),
    .reset( reg_file__reset ),
    .waddr( reg_file__waddr ),
    .wdata( reg_file__wdata ),
    .wen( reg_file__wen )
  );

  //-------------------------------------------------------------
  // End of component reg_file
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /home/kevin/Desktop/final_test/mem/data/DataMemRTL.py:47
  // @s.update
  // def update_signal():
  //   for i in range( rd_ports ):
  //     s.recv_raddr[i].rdy = s.send_rdata[i].rdy
  //                           # b1( 1 ) # s.send_rdata[i].rdy
  //     s.send_rdata[i].en  = s.recv_raddr[i].en
  //                           # s.send_rdata[i].rdy # s.recv_raddr[i].en
  //   for i in range( wr_ports ):
  //     s.recv_waddr[i].rdy = Bits1( 1 )
  //     s.recv_wdata[i].rdy = Bits1( 1 )
  
  always_comb begin : update_signal
    for ( int i = 0; i < __const__rd_ports_at_update_signal; i += 1 ) begin
      recv_raddr__rdy[i] = send_rdata__rdy[i];
      send_rdata__en[i] = recv_raddr__en[i];
    end
    for ( int i = 0; i < __const__wr_ports_at_update_signal; i += 1 ) begin
      recv_waddr__rdy[i] = 1'd1;
      recv_wdata__rdy[i] = 1'd1;
    end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;
  assign reg_file__raddr[0] = recv_raddr__msg[0];
  assign send_rdata__msg[0] = reg_file__rdata[0];
  assign reg_file__raddr[1] = recv_raddr__msg[1];
  assign send_rdata__msg[1] = reg_file__rdata[1];
  assign reg_file__raddr[2] = recv_raddr__msg[2];
  assign send_rdata__msg[2] = reg_file__rdata[2];
  assign reg_file__raddr[3] = recv_raddr__msg[3];
  assign send_rdata__msg[3] = reg_file__rdata[3];
  assign reg_file__waddr[0] = recv_waddr__msg[0];
  assign reg_file__wdata[0] = recv_wdata__msg[0];
  assign reg_file__wen[0] = recv_waddr__en[0];
  assign reg_file__waddr[1] = recv_waddr__msg[1];
  assign reg_file__wdata[1] = recv_wdata__msg[1];
  assign reg_file__wen[1] = recv_waddr__en[1];
  assign reg_file__waddr[2] = recv_waddr__msg[2];
  assign reg_file__wdata[2] = recv_wdata__msg[2];
  assign reg_file__wen[2] = recv_waddr__en[2];
  assign reg_file__waddr[3] = recv_waddr__msg[3];
  assign reg_file__wdata[3] = recv_wdata__msg[3];
  assign reg_file__wen[3] = recv_waddr__en[3];

endmodule