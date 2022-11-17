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


module TileRTL__97e625cd3d6bdc66
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_data__en [0:3],
  input CGRAData_32_1_1 recv_data__msg [0:3],
  output logic [0:0] recv_data__rdy [0:3],
  input logic [0:0] recv_waddr__en,
  input logic [1:0] recv_waddr__msg,
  output logic [0:0] recv_waddr__rdy,
  input logic [0:0] recv_wopt__en,
  input CGRAConfig_6_4_6_8 recv_wopt__msg,
  output logic [0:0] recv_wopt__rdy,
  output logic [0:0] send_data__en [0:3],
  output CGRAData_32_1_1 send_data__msg [0:3],
  input logic [0:0] send_data__rdy [0:3],
  output logic [0:0] to_mem_raddr__en,
  output logic [6:0] to_mem_raddr__msg,
  input logic [0:0] to_mem_raddr__rdy,
  output logic [0:0] to_mem_waddr__en,
  output logic [6:0] to_mem_waddr__msg,
  input logic [0:0] to_mem_waddr__rdy,
  output logic [0:0] to_mem_wdata__en,
  output CGRAData_32_1_1 to_mem_wdata__msg,
  input logic [0:0] to_mem_wdata__rdy
);
  //-------------------------------------------------------------
  // Component channel[0:7]
  //-------------------------------------------------------------

  logic [0:0] channel__clk [0:7] ;
  logic [1:0] channel__count [0:7] ;
  logic [0:0] channel__reset [0:7] ;
  logic [0:0] channel__recv__en [0:7] ;
  CGRAData_32_1_1 channel__recv__msg [0:7] ;
  logic [0:0] channel__recv__rdy [0:7] ;
  logic [0:0] channel__send__en [0:7] ;
  CGRAData_32_1_1 channel__send__msg [0:7] ;
  logic [0:0] channel__send__rdy [0:7] ;

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__0
  (
    .clk( channel__clk[0] ),
    .count( channel__count[0] ),
    .reset( channel__reset[0] ),
    .recv__en( channel__recv__en[0] ),
    .recv__msg( channel__recv__msg[0] ),
    .recv__rdy( channel__recv__rdy[0] ),
    .send__en( channel__send__en[0] ),
    .send__msg( channel__send__msg[0] ),
    .send__rdy( channel__send__rdy[0] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__1
  (
    .clk( channel__clk[1] ),
    .count( channel__count[1] ),
    .reset( channel__reset[1] ),
    .recv__en( channel__recv__en[1] ),
    .recv__msg( channel__recv__msg[1] ),
    .recv__rdy( channel__recv__rdy[1] ),
    .send__en( channel__send__en[1] ),
    .send__msg( channel__send__msg[1] ),
    .send__rdy( channel__send__rdy[1] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__2
  (
    .clk( channel__clk[2] ),
    .count( channel__count[2] ),
    .reset( channel__reset[2] ),
    .recv__en( channel__recv__en[2] ),
    .recv__msg( channel__recv__msg[2] ),
    .recv__rdy( channel__recv__rdy[2] ),
    .send__en( channel__send__en[2] ),
    .send__msg( channel__send__msg[2] ),
    .send__rdy( channel__send__rdy[2] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__3
  (
    .clk( channel__clk[3] ),
    .count( channel__count[3] ),
    .reset( channel__reset[3] ),
    .recv__en( channel__recv__en[3] ),
    .recv__msg( channel__recv__msg[3] ),
    .recv__rdy( channel__recv__rdy[3] ),
    .send__en( channel__send__en[3] ),
    .send__msg( channel__send__msg[3] ),
    .send__rdy( channel__send__rdy[3] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__4
  (
    .clk( channel__clk[4] ),
    .count( channel__count[4] ),
    .reset( channel__reset[4] ),
    .recv__en( channel__recv__en[4] ),
    .recv__msg( channel__recv__msg[4] ),
    .recv__rdy( channel__recv__rdy[4] ),
    .send__en( channel__send__en[4] ),
    .send__msg( channel__send__msg[4] ),
    .send__rdy( channel__send__rdy[4] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__5
  (
    .clk( channel__clk[5] ),
    .count( channel__count[5] ),
    .reset( channel__reset[5] ),
    .recv__en( channel__recv__en[5] ),
    .recv__msg( channel__recv__msg[5] ),
    .recv__rdy( channel__recv__rdy[5] ),
    .send__en( channel__send__en[5] ),
    .send__msg( channel__send__msg[5] ),
    .send__rdy( channel__send__rdy[5] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__6
  (
    .clk( channel__clk[6] ),
    .count( channel__count[6] ),
    .reset( channel__reset[6] ),
    .recv__en( channel__recv__en[6] ),
    .recv__msg( channel__recv__msg[6] ),
    .recv__rdy( channel__recv__rdy[6] ),
    .send__en( channel__send__en[6] ),
    .send__msg( channel__send__msg[6] ),
    .send__rdy( channel__send__rdy[6] )
  );

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 channel__7
  (
    .clk( channel__clk[7] ),
    .count( channel__count[7] ),
    .reset( channel__reset[7] ),
    .recv__en( channel__recv__en[7] ),
    .recv__msg( channel__recv__msg[7] ),
    .recv__rdy( channel__recv__rdy[7] ),
    .send__en( channel__send__en[7] ),
    .send__msg( channel__send__msg[7] ),
    .send__rdy( channel__send__rdy[7] )
  );

  //-------------------------------------------------------------
  // End of component channel[0:7]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component crossbar
  //-------------------------------------------------------------

  logic [0:0] crossbar__clk ;
  logic [0:0] crossbar__reset ;
  logic [0:0] crossbar__recv_data__en [0:5] ;
  CGRAData_32_1_1 crossbar__recv_data__msg [0:5] ;
  logic [0:0] crossbar__recv_data__rdy [0:5] ;
  logic [0:0] crossbar__recv_opt__en ;
  CGRAConfig_6_4_6_8 crossbar__recv_opt__msg ;
  logic [0:0] crossbar__recv_opt__rdy ;
  logic [0:0] crossbar__send_data__en [0:7] ;
  CGRAData_32_1_1 crossbar__send_data__msg [0:7] ;
  logic [0:0] crossbar__send_data__rdy [0:7] ;
  logic [0:0] crossbar__send_predicate__en ;
  CGRAData_1_1 crossbar__send_predicate__msg ;
  logic [0:0] crossbar__send_predicate__rdy ;

  CrossbarRTL__20918f721d5f331c crossbar
  (
    .clk( crossbar__clk ),
    .reset( crossbar__reset ),
    .recv_data__en( crossbar__recv_data__en ),
    .recv_data__msg( crossbar__recv_data__msg ),
    .recv_data__rdy( crossbar__recv_data__rdy ),
    .recv_opt__en( crossbar__recv_opt__en ),
    .recv_opt__msg( crossbar__recv_opt__msg ),
    .recv_opt__rdy( crossbar__recv_opt__rdy ),
    .send_data__en( crossbar__send_data__en ),
    .send_data__msg( crossbar__send_data__msg ),
    .send_data__rdy( crossbar__send_data__rdy ),
    .send_predicate__en( crossbar__send_predicate__en ),
    .send_predicate__msg( crossbar__send_predicate__msg ),
    .send_predicate__rdy( crossbar__send_predicate__rdy )
  );

  //-------------------------------------------------------------
  // End of component crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component ctrl_mem
  //-------------------------------------------------------------

  logic [0:0] ctrl_mem__clk ;
  logic [0:0] ctrl_mem__reset ;
  logic [0:0] ctrl_mem__recv_ctrl__en ;
  CGRAConfig_6_4_6_8 ctrl_mem__recv_ctrl__msg ;
  logic [0:0] ctrl_mem__recv_ctrl__rdy ;
  logic [0:0] ctrl_mem__recv_waddr__en ;
  logic [1:0] ctrl_mem__recv_waddr__msg ;
  logic [0:0] ctrl_mem__recv_waddr__rdy ;
  logic [0:0] ctrl_mem__send_ctrl__en ;
  CGRAConfig_6_4_6_8 ctrl_mem__send_ctrl__msg ;
  logic [0:0] ctrl_mem__send_ctrl__rdy ;

  CtrlMemRTL__8f82e3200c54bfd5 ctrl_mem
  (
    .clk( ctrl_mem__clk ),
    .reset( ctrl_mem__reset ),
    .recv_ctrl__en( ctrl_mem__recv_ctrl__en ),
    .recv_ctrl__msg( ctrl_mem__recv_ctrl__msg ),
    .recv_ctrl__rdy( ctrl_mem__recv_ctrl__rdy ),
    .recv_waddr__en( ctrl_mem__recv_waddr__en ),
    .recv_waddr__msg( ctrl_mem__recv_waddr__msg ),
    .recv_waddr__rdy( ctrl_mem__recv_waddr__rdy ),
    .send_ctrl__en( ctrl_mem__send_ctrl__en ),
    .send_ctrl__msg( ctrl_mem__send_ctrl__msg ),
    .send_ctrl__rdy( ctrl_mem__send_ctrl__rdy )
  );

  //-------------------------------------------------------------
  // End of component ctrl_mem
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component element
  //-------------------------------------------------------------

  logic [0:0] element__clk ;
  logic [1:0] element__recv_in_count [0:3] ;
  logic [0:0] element__reset ;
  logic [0:0] element__from_mem_rdata__en [0:5] ;
  CGRAData_32_1_1 element__from_mem_rdata__msg [0:5] ;
  logic [0:0] element__from_mem_rdata__rdy [0:5] ;
  logic [0:0] element__recv_const__en ;
  CGRAData_32_1_1 element__recv_const__msg ;
  logic [0:0] element__recv_const__rdy ;
  logic [0:0] element__recv_in__en [0:3] ;
  CGRAData_32_1_1 element__recv_in__msg [0:3] ;
  logic [0:0] element__recv_in__rdy [0:3] ;
  logic [0:0] element__recv_opt__en ;
  CGRAConfig_6_4_6_8 element__recv_opt__msg ;
  logic [0:0] element__recv_opt__rdy ;
  logic [0:0] element__recv_predicate__en ;
  CGRAData_1_1 element__recv_predicate__msg ;
  logic [0:0] element__recv_predicate__rdy ;
  logic [0:0] element__send_out__en [0:1] ;
  CGRAData_32_1_1 element__send_out__msg [0:1] ;
  logic [0:0] element__send_out__rdy [0:1] ;
  logic [0:0] element__to_mem_raddr__en [0:5] ;
  logic [6:0] element__to_mem_raddr__msg [0:5] ;
  logic [0:0] element__to_mem_raddr__rdy [0:5] ;
  logic [0:0] element__to_mem_waddr__en [0:5] ;
  logic [6:0] element__to_mem_waddr__msg [0:5] ;
  logic [0:0] element__to_mem_waddr__rdy [0:5] ;
  logic [0:0] element__to_mem_wdata__en [0:5] ;
  CGRAData_32_1_1 element__to_mem_wdata__msg [0:5] ;
  logic [0:0] element__to_mem_wdata__rdy [0:5] ;

  FlexibleFuRTL__4b859bce6db41c85 element
  (
    .clk( element__clk ),
    .recv_in_count( element__recv_in_count ),
    .reset( element__reset ),
    .from_mem_rdata__en( element__from_mem_rdata__en ),
    .from_mem_rdata__msg( element__from_mem_rdata__msg ),
    .from_mem_rdata__rdy( element__from_mem_rdata__rdy ),
    .recv_const__en( element__recv_const__en ),
    .recv_const__msg( element__recv_const__msg ),
    .recv_const__rdy( element__recv_const__rdy ),
    .recv_in__en( element__recv_in__en ),
    .recv_in__msg( element__recv_in__msg ),
    .recv_in__rdy( element__recv_in__rdy ),
    .recv_opt__en( element__recv_opt__en ),
    .recv_opt__msg( element__recv_opt__msg ),
    .recv_opt__rdy( element__recv_opt__rdy ),
    .recv_predicate__en( element__recv_predicate__en ),
    .recv_predicate__msg( element__recv_predicate__msg ),
    .recv_predicate__rdy( element__recv_predicate__rdy ),
    .send_out__en( element__send_out__en ),
    .send_out__msg( element__send_out__msg ),
    .send_out__rdy( element__send_out__rdy ),
    .to_mem_raddr__en( element__to_mem_raddr__en ),
    .to_mem_raddr__msg( element__to_mem_raddr__msg ),
    .to_mem_raddr__rdy( element__to_mem_raddr__rdy ),
    .to_mem_waddr__en( element__to_mem_waddr__en ),
    .to_mem_waddr__msg( element__to_mem_waddr__msg ),
    .to_mem_waddr__rdy( element__to_mem_waddr__rdy ),
    .to_mem_wdata__en( element__to_mem_wdata__en ),
    .to_mem_wdata__msg( element__to_mem_wdata__msg ),
    .to_mem_wdata__rdy( element__to_mem_wdata__rdy )
  );

  //-------------------------------------------------------------
  // End of component element
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component reg_predicate
  //-------------------------------------------------------------

  logic [0:0] reg_predicate__clk ;
  logic [0:0] reg_predicate__reset ;
  logic [0:0] reg_predicate__recv__en ;
  CGRAData_1_1 reg_predicate__recv__msg ;
  logic [0:0] reg_predicate__recv__rdy ;
  logic [0:0] reg_predicate__send__en ;
  CGRAData_1_1 reg_predicate__send__msg ;
  logic [0:0] reg_predicate__send__rdy ;

  RegisterRTL__DataType_CGRAData_1_1__latency_1 reg_predicate
  (
    .clk( reg_predicate__clk ),
    .reset( reg_predicate__reset ),
    .recv__en( reg_predicate__recv__en ),
    .recv__msg( reg_predicate__recv__msg ),
    .recv__rdy( reg_predicate__recv__rdy ),
    .send__en( reg_predicate__send__en ),
    .send__msg( reg_predicate__send__msg ),
    .send__rdy( reg_predicate__send__rdy )
  );

  //-------------------------------------------------------------
  // End of component reg_predicate
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /home/kevin/Desktop/final_test/tile/TileRTL.py:101
  // @s.update
  // def update_opt():
  //   s.element.recv_opt.msg  = s.ctrl_mem.send_ctrl.msg
  //   s.crossbar.recv_opt.msg = s.ctrl_mem.send_ctrl.msg
  //   s.element.recv_opt.en  = s.ctrl_mem.send_ctrl.en
  //   s.crossbar.recv_opt.en = s.ctrl_mem.send_ctrl.en
  //   s.ctrl_mem.send_ctrl.rdy = s.element.recv_opt.rdy and s.crossbar.recv_opt.rdy
  
  always_comb begin : update_opt
    element__recv_opt__msg = ctrl_mem__send_ctrl__msg;
    crossbar__recv_opt__msg = ctrl_mem__send_ctrl__msg;
    element__recv_opt__en = ctrl_mem__send_ctrl__en;
    crossbar__recv_opt__en = ctrl_mem__send_ctrl__en;
    ctrl_mem__send_ctrl__rdy = element__recv_opt__rdy && crossbar__recv_opt__rdy;
  end

  assign element__clk = clk;
  assign element__reset = reset;
  assign crossbar__clk = clk;
  assign crossbar__reset = reset;
  assign ctrl_mem__clk = clk;
  assign ctrl_mem__reset = reset;
  assign channel__clk[0] = clk;
  assign channel__reset[0] = reset;
  assign channel__clk[1] = clk;
  assign channel__reset[1] = reset;
  assign channel__clk[2] = clk;
  assign channel__reset[2] = reset;
  assign channel__clk[3] = clk;
  assign channel__reset[3] = reset;
  assign channel__clk[4] = clk;
  assign channel__reset[4] = reset;
  assign channel__clk[5] = clk;
  assign channel__reset[5] = reset;
  assign channel__clk[6] = clk;
  assign channel__reset[6] = reset;
  assign channel__clk[7] = clk;
  assign channel__reset[7] = reset;
  assign reg_predicate__clk = clk;
  assign reg_predicate__reset = reset;
  assign ctrl_mem__recv_waddr__en = recv_waddr__en;
  assign ctrl_mem__recv_waddr__msg = recv_waddr__msg;
  assign recv_waddr__rdy = ctrl_mem__recv_waddr__rdy;
  assign ctrl_mem__recv_ctrl__en = recv_wopt__en;
  assign ctrl_mem__recv_ctrl__msg = recv_wopt__msg;
  assign recv_wopt__rdy = ctrl_mem__recv_ctrl__rdy;
  assign element__to_mem_raddr__rdy[0] = 1'd0;
  assign element__from_mem_rdata__en[0] = 1'd0;
  assign element__from_mem_rdata__msg[0] = { 32'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[0] = 1'd0;
  assign element__to_mem_wdata__rdy[0] = 1'd0;
  assign element__to_mem_raddr__rdy[1] = 1'd0;
  assign element__from_mem_rdata__en[1] = 1'd0;
  assign element__from_mem_rdata__msg[1] = { 32'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[1] = 1'd0;
  assign element__to_mem_wdata__rdy[1] = 1'd0;
  assign to_mem_raddr__en = element__to_mem_raddr__en[2];
  assign to_mem_raddr__msg = element__to_mem_raddr__msg[2];
  assign element__to_mem_raddr__rdy[2] = to_mem_raddr__rdy;
  assign element__from_mem_rdata__en[2] = from_mem_rdata__en;
  assign element__from_mem_rdata__msg[2] = from_mem_rdata__msg;
  assign from_mem_rdata__rdy = element__from_mem_rdata__rdy[2];
  assign to_mem_waddr__en = element__to_mem_waddr__en[2];
  assign to_mem_waddr__msg = element__to_mem_waddr__msg[2];
  assign element__to_mem_waddr__rdy[2] = to_mem_waddr__rdy;
  assign to_mem_wdata__en = element__to_mem_wdata__en[2];
  assign to_mem_wdata__msg = element__to_mem_wdata__msg[2];
  assign element__to_mem_wdata__rdy[2] = to_mem_wdata__rdy;
  assign element__to_mem_raddr__rdy[3] = 1'd0;
  assign element__from_mem_rdata__en[3] = 1'd0;
  assign element__from_mem_rdata__msg[3] = { 32'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[3] = 1'd0;
  assign element__to_mem_wdata__rdy[3] = 1'd0;
  assign element__to_mem_raddr__rdy[4] = 1'd0;
  assign element__from_mem_rdata__en[4] = 1'd0;
  assign element__from_mem_rdata__msg[4] = { 32'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[4] = 1'd0;
  assign element__to_mem_wdata__rdy[4] = 1'd0;
  assign element__to_mem_raddr__rdy[5] = 1'd0;
  assign element__from_mem_rdata__en[5] = 1'd0;
  assign element__from_mem_rdata__msg[5] = { 32'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[5] = 1'd0;
  assign element__to_mem_wdata__rdy[5] = 1'd0;
  assign crossbar__recv_data__en[0] = recv_data__en[0];
  assign crossbar__recv_data__msg[0] = recv_data__msg[0];
  assign recv_data__rdy[0] = crossbar__recv_data__rdy[0];
  assign crossbar__recv_data__en[1] = recv_data__en[1];
  assign crossbar__recv_data__msg[1] = recv_data__msg[1];
  assign recv_data__rdy[1] = crossbar__recv_data__rdy[1];
  assign crossbar__recv_data__en[2] = recv_data__en[2];
  assign crossbar__recv_data__msg[2] = recv_data__msg[2];
  assign recv_data__rdy[2] = crossbar__recv_data__rdy[2];
  assign crossbar__recv_data__en[3] = recv_data__en[3];
  assign crossbar__recv_data__msg[3] = recv_data__msg[3];
  assign recv_data__rdy[3] = crossbar__recv_data__rdy[3];
  assign channel__recv__en[0] = crossbar__send_data__en[0];
  assign channel__recv__msg[0] = crossbar__send_data__msg[0];
  assign crossbar__send_data__rdy[0] = channel__recv__rdy[0];
  assign channel__recv__en[1] = crossbar__send_data__en[1];
  assign channel__recv__msg[1] = crossbar__send_data__msg[1];
  assign crossbar__send_data__rdy[1] = channel__recv__rdy[1];
  assign channel__recv__en[2] = crossbar__send_data__en[2];
  assign channel__recv__msg[2] = crossbar__send_data__msg[2];
  assign crossbar__send_data__rdy[2] = channel__recv__rdy[2];
  assign channel__recv__en[3] = crossbar__send_data__en[3];
  assign channel__recv__msg[3] = crossbar__send_data__msg[3];
  assign crossbar__send_data__rdy[3] = channel__recv__rdy[3];
  assign channel__recv__en[4] = crossbar__send_data__en[4];
  assign channel__recv__msg[4] = crossbar__send_data__msg[4];
  assign crossbar__send_data__rdy[4] = channel__recv__rdy[4];
  assign channel__recv__en[5] = crossbar__send_data__en[5];
  assign channel__recv__msg[5] = crossbar__send_data__msg[5];
  assign crossbar__send_data__rdy[5] = channel__recv__rdy[5];
  assign channel__recv__en[6] = crossbar__send_data__en[6];
  assign channel__recv__msg[6] = crossbar__send_data__msg[6];
  assign crossbar__send_data__rdy[6] = channel__recv__rdy[6];
  assign channel__recv__en[7] = crossbar__send_data__en[7];
  assign channel__recv__msg[7] = crossbar__send_data__msg[7];
  assign crossbar__send_data__rdy[7] = channel__recv__rdy[7];
  assign reg_predicate__recv__en = crossbar__send_predicate__en;
  assign reg_predicate__recv__msg = crossbar__send_predicate__msg;
  assign crossbar__send_predicate__rdy = reg_predicate__recv__rdy;
  assign element__recv_predicate__en = reg_predicate__send__en;
  assign element__recv_predicate__msg = reg_predicate__send__msg;
  assign reg_predicate__send__rdy = element__recv_predicate__rdy;
  assign send_data__en[0] = channel__send__en[0];
  assign send_data__msg[0] = channel__send__msg[0];
  assign channel__send__rdy[0] = send_data__rdy[0];
  assign send_data__en[1] = channel__send__en[1];
  assign send_data__msg[1] = channel__send__msg[1];
  assign channel__send__rdy[1] = send_data__rdy[1];
  assign send_data__en[2] = channel__send__en[2];
  assign send_data__msg[2] = channel__send__msg[2];
  assign channel__send__rdy[2] = send_data__rdy[2];
  assign send_data__en[3] = channel__send__en[3];
  assign send_data__msg[3] = channel__send__msg[3];
  assign channel__send__rdy[3] = send_data__rdy[3];
  assign element__recv_in__en[0] = channel__send__en[4];
  assign element__recv_in__msg[0] = channel__send__msg[4];
  assign channel__send__rdy[4] = element__recv_in__rdy[0];
  assign element__recv_in_count[0] = channel__count[4];
  assign element__recv_in__en[1] = channel__send__en[5];
  assign element__recv_in__msg[1] = channel__send__msg[5];
  assign channel__send__rdy[5] = element__recv_in__rdy[1];
  assign element__recv_in_count[1] = channel__count[5];
  assign element__recv_in__en[2] = channel__send__en[6];
  assign element__recv_in__msg[2] = channel__send__msg[6];
  assign channel__send__rdy[6] = element__recv_in__rdy[2];
  assign element__recv_in_count[2] = channel__count[6];
  assign element__recv_in__en[3] = channel__send__en[7];
  assign element__recv_in__msg[3] = channel__send__msg[7];
  assign channel__send__rdy[7] = element__recv_in__rdy[3];
  assign element__recv_in_count[3] = channel__count[7];
  assign crossbar__recv_data__en[4] = element__send_out__en[0];
  assign crossbar__recv_data__msg[4] = element__send_out__msg[0];
  assign element__send_out__rdy[0] = crossbar__recv_data__rdy[4];
  assign crossbar__recv_data__en[5] = element__send_out__en[1];
  assign crossbar__recv_data__msg[5] = element__send_out__msg[1];
  assign element__send_out__rdy[1] = crossbar__recv_data__rdy[5];

endmodule