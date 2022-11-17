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


// PyMTL Component AdderRTL Definition
// Full name: AdderRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/AdderRTL.py

module AdderRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam CGRAData_32_1_1 const_one = { 32'd1, 1'd1, 1'd0 };
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_ADD = 6'd2;
  localparam logic [5:0] __const__OPT_ADD_CONST = 6'd25;
  localparam logic [5:0] __const__OPT_INC = 6'd3;
  localparam logic [5:0] __const__OPT_SUB = 6'd4;
  localparam logic [5:0] __const__OPT_PAS = 6'd31;
  logic [2:0] __tmpvar__comb_logic_in0 ;
  logic [2:0] __tmpvar__comb_logic_in1 ;
  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    __tmpvar__comb_logic_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__comb_logic_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate && recv_in__msg[__tmpvar__comb_logic_in1].predicate;
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = recv_opt__en;
    if ( recv_opt__msg.ctrl == __const__OPT_ADD ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload + recv_in__msg[__tmpvar__comb_logic_in1].payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate && recv_in__msg[__tmpvar__comb_logic_in1].predicate;
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_ADD_CONST ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload + recv_const__msg.payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_INC ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload + const_one.payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_SUB ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload - recv_in__msg[__tmpvar__comb_logic_in1].payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_PAS ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
    end
    else
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
        send_out__en[j] = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
    end
  end
  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 7'd0;
    to_mem_raddr__msg = 7'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end
  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

endmodule


// PyMTL Component PhiRTL Definition
// Full name: PhiRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/PhiRTL.py

module PhiRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_PHI = 6'd17;
  localparam logic [5:0] __const__OPT_PHI_CONST = 6'd32;
  logic [2:0] __tmpvar__comb_logic_in0 ;
  logic [2:0] __tmpvar__comb_logic_in1 ;
  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    __tmpvar__comb_logic_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 ) begin
      recv_in__rdy[i] = 1'd0;
    end
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__comb_logic_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 ) begin
      send_out__en[j] = recv_opt__en;
    end
    if ( recv_opt__msg.ctrl == __const__OPT_PHI ) begin
      if ( recv_in__msg[__tmpvar__comb_logic_in0].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
        send_out__msg[0].predicate = 1'd1;
      end
      else if ( recv_in__msg[__tmpvar__comb_logic_in1].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in1].payload;
        send_out__msg[0].predicate = 1'd1;
      end
      else begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
        send_out__msg[0].predicate = 1'd0;
      end
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        recv_predicate__rdy = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
      if ( ( recv_opt__msg.predicate == 1'd1 ) && ( recv_predicate__msg.payload == 1'd0 ) ) begin
        recv_predicate__rdy = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_PHI_CONST ) begin
      send_out__msg[0].predicate = 1'd1;
      if ( recv_in__msg[__tmpvar__comb_logic_in0].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
        send_out__msg[0].predicate = 1'd1;
      end
      else begin
        // send_out__msg[0].payload = 32'hec;
        // send_out__msg[0].predicate = 1'd1;
        send_out__msg[0] = {32'h0, 1'd1, 1'd1};
      end
      if ( ( recv_opt__msg.predicate == 1'd1 ) && ( recv_predicate__msg.payload == 1'd0 ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
      end
    end
    else begin
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 ) begin
        send_out__en[j] = 1'd0;
      end
    end
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      //send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
      if ( recv_opt__msg.ctrl == __const__OPT_PHI_CONST ) begin
        if ( recv_predicate__msg.payload == 1'd0 ) begin
          send_out__msg[0].predicate = 1'd1;
        end
      end
      else begin
        send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
      end
    end
  end

  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 7'd0;
    to_mem_raddr__msg = 7'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

endmodule


// PyMTL Component MemUnitRTL Definition
// Full name: MemUnitRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/MemUnitRTL.py

module MemUnitRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_LD = 6'd12;
  localparam logic [5:0] __const__OPT_LD_CONST = 6'd28;
  localparam logic [5:0] __const__OPT_STR = 6'd13;
  logic [2:0] __tmpvar__comb_logic_in0 ;
  logic [2:0] __tmpvar__comb_logic_in1 ;
  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    __tmpvar__comb_logic_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__comb_logic_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 ) begin
      for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
        send_out__en[j] = recv_in__en[i] || send_out__en[j];
      send_out__en[j] = send_out__en[j] && recv_opt__en;
    end
    send_out__msg[0] = from_mem_rdata__msg;
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    if ( recv_opt__msg.ctrl == __const__OPT_LD ) begin
      recv_in__rdy[__tmpvar__comb_logic_in0] = to_mem_raddr__rdy;
      recv_in__rdy[__tmpvar__comb_logic_in1] = from_mem_rdata__rdy;
      to_mem_raddr__msg = 7'( recv_in__msg[__tmpvar__comb_logic_in0].payload );
      to_mem_raddr__en = recv_in__en[__tmpvar__comb_logic_in0];
      from_mem_rdata__rdy = send_out__rdy[0];
      send_out__msg[0] = from_mem_rdata__msg;
      send_out__en[0] = recv_opt__en;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_LD_CONST ) begin
      for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
        recv_in__rdy[i] = 1'd0;
      recv_const__rdy = to_mem_raddr__rdy;
      to_mem_raddr__msg = 7'( recv_const__msg.payload );
      to_mem_raddr__en = recv_const__en;
      from_mem_rdata__rdy = send_out__rdy[0];
      send_out__msg[0] = from_mem_rdata__msg;
      send_out__en[0] = recv_opt__en;
      send_out__msg[0].predicate = 1'd1;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_STR ) begin
      send_out__en[0] = from_mem_rdata__en && recv_in__en[__tmpvar__comb_logic_in0] && recv_in__en[__tmpvar__comb_logic_in1];
      recv_in__rdy[__tmpvar__comb_logic_in0] = to_mem_waddr__rdy;
      recv_in__rdy[__tmpvar__comb_logic_in1] = to_mem_wdata__rdy;
      to_mem_waddr__msg = 7'( recv_in__msg[0].payload );
      to_mem_waddr__en = recv_in__en[__tmpvar__comb_logic_in0];
      to_mem_wdata__msg = recv_in__msg[__tmpvar__comb_logic_in1];
      to_mem_wdata__en = recv_in__en[__tmpvar__comb_logic_in1];
      send_out__en[0] = 1'd0;
      send_out__msg[0] = from_mem_rdata__msg;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate && recv_in__msg[__tmpvar__comb_logic_in1].predicate;
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
        send_out__en[j] = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
    end
  end

endmodule


// PyMTL Component CompRTL Definition
// Full name: CompRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/CompRTL.py

module CompRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam CGRAData_32_1_1 const_one = { 32'd1, 1'd0, 1'd0 };
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_read_reg = 32'd4;
  localparam logic [31:0] __const__num_outports_at_read_reg = 32'd2;
  localparam logic [5:0] __const__OPT_EQ = 6'd14;
  localparam logic [5:0] __const__OPT_EQ_CONST = 6'd33;
  localparam logic [5:0] __const__OPT_LE = 6'd15;
  logic [2:0] __tmpvar__read_reg_in0 ;
  logic [2:0] __tmpvar__read_reg_in1 ;
  logic [0:0] __tmpvar__read_reg_predicate ;


  
  always_comb begin : read_reg
    __tmpvar__read_reg_in0 = 3'd0;
    __tmpvar__read_reg_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_read_reg; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__read_reg_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__read_reg_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__read_reg_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__read_reg_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    __tmpvar__read_reg_predicate = recv_in__msg[__tmpvar__read_reg_in0].predicate & recv_in__msg[__tmpvar__read_reg_in1].predicate;
    send_out__msg[0] = const_one;
    for ( int j = 0; j < __const__num_outports_at_read_reg; j += 1 )
      send_out__en[j] = recv_opt__en;
    if ( recv_opt__msg.ctrl == __const__OPT_EQ ) begin
      if ( recv_in__msg[__tmpvar__read_reg_in0].payload == recv_in__msg[__tmpvar__read_reg_in1].payload ) begin
        send_out__msg[0] = const_one;
        send_out__msg[0].predicate = __tmpvar__read_reg_predicate;
      end
      else begin
        send_out__msg[0] = const_zero;
        send_out__msg[0].predicate = __tmpvar__read_reg_predicate;
      end
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__read_reg_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__read_reg_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__read_reg_in0] = 1'd0;
        recv_in__rdy[__tmpvar__read_reg_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_EQ_CONST ) begin
      if ( recv_in__msg[__tmpvar__read_reg_in0].payload == const_zero.payload ) begin
        send_out__msg[0] = const_one;
        send_out__msg[0].predicate = 1'd1;
      end
      else begin
        send_out__msg[0] = const_zero;
        send_out__msg[0].predicate = 1'd1;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_LE ) begin
      if ( recv_in__msg[__tmpvar__read_reg_in0].payload < recv_in__msg[__tmpvar__read_reg_in1].payload ) begin
        send_out__msg[0] = const_one;
        send_out__msg[0].predicate = __tmpvar__read_reg_predicate;
      end
      else begin
        send_out__msg[0] = const_zero;
        send_out__msg[0].predicate = __tmpvar__read_reg_predicate;
      end
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__read_reg_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__read_reg_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__read_reg_in0] = 1'd0;
        recv_in__rdy[__tmpvar__read_reg_in1] = 1'd0;
      end
    end
    else
      for ( int j = 0; j < __const__num_outports_at_read_reg; j += 1 )
        send_out__en[j] = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
    end
  end
  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 7'd0;
    to_mem_raddr__msg = 7'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

endmodule


// PyMTL Component MulRTL Definition
// Full name: MulRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/MulRTL.py

module MulRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_MUL = 6'd7;
  localparam logic [5:0] __const__OPT_MUL_CONST = 6'd29;
  localparam logic [5:0] __const__OPT_DIV = 6'd26;
  logic [2:0] __tmpvar__comb_logic_in0 ;
  logic [2:0] __tmpvar__comb_logic_in1 ;


  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    __tmpvar__comb_logic_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__comb_logic_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate && recv_in__msg[__tmpvar__comb_logic_in1].predicate;
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = recv_opt__en;
    if ( recv_opt__msg.ctrl == __const__OPT_MUL ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload * recv_in__msg[__tmpvar__comb_logic_in1].payload;
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_MUL_CONST ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload * recv_const__msg.payload;
      send_out__msg[0].predicate = recv_in__msg[__tmpvar__comb_logic_in0].predicate;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_DIV ) begin
      send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload / recv_in__msg[__tmpvar__comb_logic_in1].payload;
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
    end
    else
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
        send_out__en[j] = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
    end
  end

  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 7'd0;
    to_mem_raddr__msg = 7'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

endmodule


// PyMTL Component BranchRTL Definition
// Full name: BranchRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100
// At /home/kevin/Desktop/final_test/fu/single/BranchRTL.py

module BranchRTL__c0679c011d3d3150
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
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
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_BRH = 6'd16;
  localparam logic [5:0] __const__OPT_BRH_START = 6'd34;
  logic [0:0] first ;
  logic [2:0] __tmpvar__comb_logic_in0 ;


  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = recv_opt__en;
    if ( recv_opt__msg.ctrl == __const__OPT_BRH ) begin
      send_out__msg[0] = { 0, 1'd0, 1'd0 };
      send_out__msg[1] = { 0, 1'd0, 1'd0 };
      if ( recv_in__msg[__tmpvar__comb_logic_in0].payload == const_zero.payload ) begin
        send_out__msg[0].predicate = 1'd1;
        send_out__msg[1].predicate = 1'd0;
      end
      else begin
        send_out__msg[0].predicate = 1'd0;
        send_out__msg[1].predicate = 1'd1;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_BRH_START ) begin
      send_out__msg[0] = { 0, 1'd0, 1'd0 };
      send_out__msg[1] = { 0, 1'd0, 1'd0 };
      if ( first == 1'd1 ) begin
        send_out__msg[0].predicate = 1'd1;
        send_out__msg[1].predicate = 1'd0;
      end
      else begin
        send_out__msg[0].predicate = 1'd0;
        send_out__msg[1].predicate = 1'd1;
      end
    end
    else
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
        send_out__en[j] = 1'd0;
    if ( ( recv_opt__msg.predicate == 1'd1 ) && ( recv_opt__msg.ctrl != __const__OPT_BRH_START ) ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
      send_out__msg[1].predicate = send_out__msg[1].predicate && recv_predicate__msg.predicate;
    end
  end

  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 7'd0;
    to_mem_raddr__msg = 7'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

  
  always_ff @(posedge clk) begin : br_start_once
    if ( reset ) begin
      first <= 1'd1;
    end
    if ( recv_opt__msg.ctrl == __const__OPT_BRH_START ) begin
      first <= 1'd0;
    end
  end

endmodule


// PyMTL Component FlexibleFuRTL Definition
// Full name: FlexibleFuRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_4__num_outports_2__data_mem_size_100__FuList_[<class 'final_test.fu.single.AdderRTL.AdderRTL'>, <class 'final_test.fu.single.PhiRTL.PhiRTL'>, <class 'final_test.fu.single.MemUnitRTL.MemUnitRTL'>, <class 'final_test.fu.single.CompRTL.CompRTL'>, <class 'final_test.fu.single.MulRTL.MulRTL'>, <class 'final_test.fu.single.BranchRTL.BranchRTL'>]
// At /home/kevin/Desktop/final_test/fu/flexible/FlexibleFuRTL.py

module FlexibleFuRTL__4b859bce6db41c85
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en [0:5],
  input CGRAData_32_1_1 from_mem_rdata__msg [0:5],
  output logic [0:0] from_mem_rdata__rdy [0:5],
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
  output logic [0:0] to_mem_raddr__en [0:5],
  output logic [6:0] to_mem_raddr__msg [0:5],
  input logic [0:0] to_mem_raddr__rdy [0:5],
  output logic [0:0] to_mem_waddr__en [0:5],
  output logic [6:0] to_mem_waddr__msg [0:5],
  input logic [0:0] to_mem_waddr__rdy [0:5],
  output logic [0:0] to_mem_wdata__en [0:5],
  output CGRAData_32_1_1 to_mem_wdata__msg [0:5],
  input logic [0:0] to_mem_wdata__rdy [0:5]
);
  localparam logic [31:0] fu_list_size = 32'd6;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  //-------------------------------------------------------------
  // Component fu[0:5]
  //-------------------------------------------------------------

  logic [0:0] fu__clk [0:5] ;
  logic [1:0] fu__recv_in_count [0:5][0:3] ;
  logic [0:0] fu__reset [0:5] ;
  logic [0:0] fu__from_mem_rdata__en [0:5] ;
  CGRAData_32_1_1 fu__from_mem_rdata__msg [0:5] ;
  logic [0:0] fu__from_mem_rdata__rdy [0:5] ;
  logic [0:0] fu__recv_const__en [0:5] ;
  CGRAData_32_1_1 fu__recv_const__msg [0:5] ;
  logic [0:0] fu__recv_const__rdy [0:5] ;
  logic [0:0] fu__recv_in__en [0:5][0:3] ;
  CGRAData_32_1_1 fu__recv_in__msg [0:5][0:3] ;
  logic [0:0] fu__recv_in__rdy [0:5][0:3] ;
  logic [0:0] fu__recv_opt__en [0:5] ;
  CGRAConfig_6_4_6_8 fu__recv_opt__msg [0:5] ;
  logic [0:0] fu__recv_opt__rdy [0:5] ;
  logic [0:0] fu__recv_predicate__en [0:5] ;
  CGRAData_1_1 fu__recv_predicate__msg [0:5] ;
  logic [0:0] fu__recv_predicate__rdy [0:5] ;
  logic [0:0] fu__send_out__en [0:5][0:1] ;
  CGRAData_32_1_1 fu__send_out__msg [0:5][0:1] ;
  logic [0:0] fu__send_out__rdy [0:5][0:1] ;
  logic [0:0] fu__to_mem_raddr__en [0:5] ;
  logic [6:0] fu__to_mem_raddr__msg [0:5] ;
  logic [0:0] fu__to_mem_raddr__rdy [0:5] ;
  logic [0:0] fu__to_mem_waddr__en [0:5] ;
  logic [6:0] fu__to_mem_waddr__msg [0:5] ;
  logic [0:0] fu__to_mem_waddr__rdy [0:5] ;
  logic [0:0] fu__to_mem_wdata__en [0:5] ;
  CGRAData_32_1_1 fu__to_mem_wdata__msg [0:5] ;
  logic [0:0] fu__to_mem_wdata__rdy [0:5] ;

  AdderRTL__c0679c011d3d3150 fu__0
  (
    .clk( fu__clk[0] ),
    .recv_in_count( fu__recv_in_count[0] ),
    .reset( fu__reset[0] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[0] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[0] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[0] ),
    .recv_const__en( fu__recv_const__en[0] ),
    .recv_const__msg( fu__recv_const__msg[0] ),
    .recv_const__rdy( fu__recv_const__rdy[0] ),
    .recv_in__en( fu__recv_in__en[0] ),
    .recv_in__msg( fu__recv_in__msg[0] ),
    .recv_in__rdy( fu__recv_in__rdy[0] ),
    .recv_opt__en( fu__recv_opt__en[0] ),
    .recv_opt__msg( fu__recv_opt__msg[0] ),
    .recv_opt__rdy( fu__recv_opt__rdy[0] ),
    .recv_predicate__en( fu__recv_predicate__en[0] ),
    .recv_predicate__msg( fu__recv_predicate__msg[0] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[0] ),
    .send_out__en( fu__send_out__en[0] ),
    .send_out__msg( fu__send_out__msg[0] ),
    .send_out__rdy( fu__send_out__rdy[0] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[0] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[0] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[0] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[0] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[0] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[0] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[0] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[0] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[0] )
  );

  PhiRTL__c0679c011d3d3150 fu__1
  (
    .clk( fu__clk[1] ),
    .recv_in_count( fu__recv_in_count[1] ),
    .reset( fu__reset[1] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[1] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[1] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[1] ),
    .recv_const__en( fu__recv_const__en[1] ),
    .recv_const__msg( fu__recv_const__msg[1] ),
    .recv_const__rdy( fu__recv_const__rdy[1] ),
    .recv_in__en( fu__recv_in__en[1] ),
    .recv_in__msg( fu__recv_in__msg[1] ),
    .recv_in__rdy( fu__recv_in__rdy[1] ),
    .recv_opt__en( fu__recv_opt__en[1] ),
    .recv_opt__msg( fu__recv_opt__msg[1] ),
    .recv_opt__rdy( fu__recv_opt__rdy[1] ),
    .recv_predicate__en( fu__recv_predicate__en[1] ),
    .recv_predicate__msg( fu__recv_predicate__msg[1] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[1] ),
    .send_out__en( fu__send_out__en[1] ),
    .send_out__msg( fu__send_out__msg[1] ),
    .send_out__rdy( fu__send_out__rdy[1] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[1] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[1] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[1] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[1] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[1] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[1] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[1] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[1] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[1] )
  );

  MemUnitRTL__c0679c011d3d3150 fu__2
  (
    .clk( fu__clk[2] ),
    .recv_in_count( fu__recv_in_count[2] ),
    .reset( fu__reset[2] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[2] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[2] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[2] ),
    .recv_const__en( fu__recv_const__en[2] ),
    .recv_const__msg( fu__recv_const__msg[2] ),
    .recv_const__rdy( fu__recv_const__rdy[2] ),
    .recv_in__en( fu__recv_in__en[2] ),
    .recv_in__msg( fu__recv_in__msg[2] ),
    .recv_in__rdy( fu__recv_in__rdy[2] ),
    .recv_opt__en( fu__recv_opt__en[2] ),
    .recv_opt__msg( fu__recv_opt__msg[2] ),
    .recv_opt__rdy( fu__recv_opt__rdy[2] ),
    .recv_predicate__en( fu__recv_predicate__en[2] ),
    .recv_predicate__msg( fu__recv_predicate__msg[2] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[2] ),
    .send_out__en( fu__send_out__en[2] ),
    .send_out__msg( fu__send_out__msg[2] ),
    .send_out__rdy( fu__send_out__rdy[2] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[2] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[2] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[2] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[2] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[2] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[2] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[2] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[2] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[2] )
  );

  CompRTL__c0679c011d3d3150 fu__3
  (
    .clk( fu__clk[3] ),
    .recv_in_count( fu__recv_in_count[3] ),
    .reset( fu__reset[3] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[3] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[3] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[3] ),
    .recv_const__en( fu__recv_const__en[3] ),
    .recv_const__msg( fu__recv_const__msg[3] ),
    .recv_const__rdy( fu__recv_const__rdy[3] ),
    .recv_in__en( fu__recv_in__en[3] ),
    .recv_in__msg( fu__recv_in__msg[3] ),
    .recv_in__rdy( fu__recv_in__rdy[3] ),
    .recv_opt__en( fu__recv_opt__en[3] ),
    .recv_opt__msg( fu__recv_opt__msg[3] ),
    .recv_opt__rdy( fu__recv_opt__rdy[3] ),
    .recv_predicate__en( fu__recv_predicate__en[3] ),
    .recv_predicate__msg( fu__recv_predicate__msg[3] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[3] ),
    .send_out__en( fu__send_out__en[3] ),
    .send_out__msg( fu__send_out__msg[3] ),
    .send_out__rdy( fu__send_out__rdy[3] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[3] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[3] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[3] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[3] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[3] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[3] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[3] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[3] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[3] )
  );

  MulRTL__c0679c011d3d3150 fu__4
  (
    .clk( fu__clk[4] ),
    .recv_in_count( fu__recv_in_count[4] ),
    .reset( fu__reset[4] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[4] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[4] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[4] ),
    .recv_const__en( fu__recv_const__en[4] ),
    .recv_const__msg( fu__recv_const__msg[4] ),
    .recv_const__rdy( fu__recv_const__rdy[4] ),
    .recv_in__en( fu__recv_in__en[4] ),
    .recv_in__msg( fu__recv_in__msg[4] ),
    .recv_in__rdy( fu__recv_in__rdy[4] ),
    .recv_opt__en( fu__recv_opt__en[4] ),
    .recv_opt__msg( fu__recv_opt__msg[4] ),
    .recv_opt__rdy( fu__recv_opt__rdy[4] ),
    .recv_predicate__en( fu__recv_predicate__en[4] ),
    .recv_predicate__msg( fu__recv_predicate__msg[4] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[4] ),
    .send_out__en( fu__send_out__en[4] ),
    .send_out__msg( fu__send_out__msg[4] ),
    .send_out__rdy( fu__send_out__rdy[4] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[4] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[4] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[4] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[4] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[4] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[4] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[4] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[4] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[4] )
  );

  BranchRTL__c0679c011d3d3150 fu__5
  (
    .clk( fu__clk[5] ),
    .recv_in_count( fu__recv_in_count[5] ),
    .reset( fu__reset[5] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[5] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[5] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[5] ),
    .recv_const__en( fu__recv_const__en[5] ),
    .recv_const__msg( fu__recv_const__msg[5] ),
    .recv_const__rdy( fu__recv_const__rdy[5] ),
    .recv_in__en( fu__recv_in__en[5] ),
    .recv_in__msg( fu__recv_in__msg[5] ),
    .recv_in__rdy( fu__recv_in__rdy[5] ),
    .recv_opt__en( fu__recv_opt__en[5] ),
    .recv_opt__msg( fu__recv_opt__msg[5] ),
    .recv_opt__rdy( fu__recv_opt__rdy[5] ),
    .recv_predicate__en( fu__recv_predicate__en[5] ),
    .recv_predicate__msg( fu__recv_predicate__msg[5] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[5] ),
    .send_out__en( fu__send_out__en[5] ),
    .send_out__msg( fu__send_out__msg[5] ),
    .send_out__rdy( fu__send_out__rdy[5] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[5] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[5] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[5] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[5] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[5] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[5] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[5] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[5] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[5] )
  );

  //-------------------------------------------------------------
  // End of component fu[0:5]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /home/kevin/Desktop/final_test/fu/flexible/FlexibleFuRTL.py:53
  // @s.update
  // def comb_logic():
  // 
  //   for j in range( num_outports ):
  //     s.send_out[j].en  = b1( 0 )
  // 
  //   for i in range( s.fu_list_size ):
  // 
  //     # const connection
  //     s.fu[i].recv_const.msg = s.recv_const.msg
  //     s.fu[i].recv_const.en  = s.recv_const.en
  //     s.recv_const.rdy       = s.recv_const.rdy or s.fu[i].recv_const.rdy
  // 
  //     for j in range( num_inports):
  //       s.fu[i].recv_in_count[j] = s.recv_in_count[j]
  // 
  //     # opt connection
  //     s.fu[i].recv_opt.msg = s.recv_opt.msg
  //     s.fu[i].recv_opt.en  = s.recv_opt.en
  //     s.recv_opt.rdy       = s.fu[i].recv_opt.rdy or s.recv_opt.rdy
  // 
  //     # Note that the predication for a combined FU should be identical/shareable,
  //     # which means the computation in different basic block cannot be combined.
  //     s.fu[i].recv_opt.msg.predicate = s.recv_opt.msg.predicate
  //     s.fu[i].recv_predicate.en      = s.recv_predicate.en
  //     s.recv_predicate.rdy           = s.fu[i].recv_predicate.rdy or s.recv_predicate.rdy
  //     s.fu[i].recv_predicate.msg     = s.recv_predicate.msg
  // 
  //     # send_out connection
  //     for j in range( num_outports ):
  //       if s.fu[i].send_out[j].en:
  //         s.send_out[j].msg     = s.fu[i].send_out[j].msg
  //         s.send_out[j].en      = s.fu[i].send_out[j].en
  //       s.fu[i].send_out[j].rdy = s.send_out[j].rdy
  // 
  // 
  //   for j in range( num_inports ):
  //     s.recv_in[j].rdy = b1( 0 )
  // 
  //   for i in range( s.fu_list_size ):
  //     # recv_in connection
  //     for j in range( num_inports ):
  //       s.fu[i].recv_in[j].msg = s.recv_in[j].msg
  //       s.fu[i].recv_in[j].en  = s.recv_in[j].en
  //       s.recv_in[j].rdy       = s.fu[i].recv_in[j].rdy or s.recv_in[j].rdy
  
  always_comb begin : comb_logic
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = 1'd0;
    for ( int i = 0; i < fu_list_size; i += 1 ) begin
      fu__recv_const__msg[i] = recv_const__msg;
      fu__recv_const__en[i] = recv_const__en;
      recv_const__rdy = recv_const__rdy || fu__recv_const__rdy[i];
      for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 )
        fu__recv_in_count[i][j] = recv_in_count[j];
      fu__recv_opt__msg[i] = recv_opt__msg;
      fu__recv_opt__en[i] = recv_opt__en;
      recv_opt__rdy = fu__recv_opt__rdy[i] || recv_opt__rdy;
      fu__recv_opt__msg[i].predicate = recv_opt__msg.predicate;
      fu__recv_predicate__en[i] = recv_predicate__en;
      recv_predicate__rdy = fu__recv_predicate__rdy[i] || recv_predicate__rdy;
      fu__recv_predicate__msg[i] = recv_predicate__msg;
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 ) begin
        if ( fu__send_out__en[i][j] ) begin
          send_out__msg[j] = fu__send_out__msg[i][j];
          send_out__en[j] = fu__send_out__en[i][j];
        end
        fu__send_out__rdy[i][j] = send_out__rdy[j];
      end
    end
    for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 )
      recv_in__rdy[j] = 1'd0;
    for ( int i = 0; i < fu_list_size; i += 1 )
      for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 ) begin
        fu__recv_in__msg[i][j] = recv_in__msg[j];
        fu__recv_in__en[i][j] = recv_in__en[j];
        recv_in__rdy[j] = fu__recv_in__rdy[i][j] || recv_in__rdy[j];
      end
  end

  assign fu__clk[0] = clk;
  assign fu__reset[0] = reset;
  assign fu__clk[1] = clk;
  assign fu__reset[1] = reset;
  assign fu__clk[2] = clk;
  assign fu__reset[2] = reset;
  assign fu__clk[3] = clk;
  assign fu__reset[3] = reset;
  assign fu__clk[4] = clk;
  assign fu__reset[4] = reset;
  assign fu__clk[5] = clk;
  assign fu__reset[5] = reset;
  assign to_mem_raddr__en[0] = fu__to_mem_raddr__en[0];
  assign to_mem_raddr__msg[0] = fu__to_mem_raddr__msg[0];
  assign fu__to_mem_raddr__rdy[0] = to_mem_raddr__rdy[0];
  assign fu__from_mem_rdata__en[0] = from_mem_rdata__en[0];
  assign fu__from_mem_rdata__msg[0] = from_mem_rdata__msg[0];
  assign from_mem_rdata__rdy[0] = fu__from_mem_rdata__rdy[0];
  assign to_mem_waddr__en[0] = fu__to_mem_waddr__en[0];
  assign to_mem_waddr__msg[0] = fu__to_mem_waddr__msg[0];
  assign fu__to_mem_waddr__rdy[0] = to_mem_waddr__rdy[0];
  assign to_mem_wdata__en[0] = fu__to_mem_wdata__en[0];
  assign to_mem_wdata__msg[0] = fu__to_mem_wdata__msg[0];
  assign fu__to_mem_wdata__rdy[0] = to_mem_wdata__rdy[0];
  assign to_mem_raddr__en[1] = fu__to_mem_raddr__en[1];
  assign to_mem_raddr__msg[1] = fu__to_mem_raddr__msg[1];
  assign fu__to_mem_raddr__rdy[1] = to_mem_raddr__rdy[1];
  assign fu__from_mem_rdata__en[1] = from_mem_rdata__en[1];
  assign fu__from_mem_rdata__msg[1] = from_mem_rdata__msg[1];
  assign from_mem_rdata__rdy[1] = fu__from_mem_rdata__rdy[1];
  assign to_mem_waddr__en[1] = fu__to_mem_waddr__en[1];
  assign to_mem_waddr__msg[1] = fu__to_mem_waddr__msg[1];
  assign fu__to_mem_waddr__rdy[1] = to_mem_waddr__rdy[1];
  assign to_mem_wdata__en[1] = fu__to_mem_wdata__en[1];
  assign to_mem_wdata__msg[1] = fu__to_mem_wdata__msg[1];
  assign fu__to_mem_wdata__rdy[1] = to_mem_wdata__rdy[1];
  assign to_mem_raddr__en[2] = fu__to_mem_raddr__en[2];
  assign to_mem_raddr__msg[2] = fu__to_mem_raddr__msg[2];
  assign fu__to_mem_raddr__rdy[2] = to_mem_raddr__rdy[2];
  assign fu__from_mem_rdata__en[2] = from_mem_rdata__en[2];
  assign fu__from_mem_rdata__msg[2] = from_mem_rdata__msg[2];
  assign from_mem_rdata__rdy[2] = fu__from_mem_rdata__rdy[2];
  assign to_mem_waddr__en[2] = fu__to_mem_waddr__en[2];
  assign to_mem_waddr__msg[2] = fu__to_mem_waddr__msg[2];
  assign fu__to_mem_waddr__rdy[2] = to_mem_waddr__rdy[2];
  assign to_mem_wdata__en[2] = fu__to_mem_wdata__en[2];
  assign to_mem_wdata__msg[2] = fu__to_mem_wdata__msg[2];
  assign fu__to_mem_wdata__rdy[2] = to_mem_wdata__rdy[2];
  assign to_mem_raddr__en[3] = fu__to_mem_raddr__en[3];
  assign to_mem_raddr__msg[3] = fu__to_mem_raddr__msg[3];
  assign fu__to_mem_raddr__rdy[3] = to_mem_raddr__rdy[3];
  assign fu__from_mem_rdata__en[3] = from_mem_rdata__en[3];
  assign fu__from_mem_rdata__msg[3] = from_mem_rdata__msg[3];
  assign from_mem_rdata__rdy[3] = fu__from_mem_rdata__rdy[3];
  assign to_mem_waddr__en[3] = fu__to_mem_waddr__en[3];
  assign to_mem_waddr__msg[3] = fu__to_mem_waddr__msg[3];
  assign fu__to_mem_waddr__rdy[3] = to_mem_waddr__rdy[3];
  assign to_mem_wdata__en[3] = fu__to_mem_wdata__en[3];
  assign to_mem_wdata__msg[3] = fu__to_mem_wdata__msg[3];
  assign fu__to_mem_wdata__rdy[3] = to_mem_wdata__rdy[3];
  assign to_mem_raddr__en[4] = fu__to_mem_raddr__en[4];
  assign to_mem_raddr__msg[4] = fu__to_mem_raddr__msg[4];
  assign fu__to_mem_raddr__rdy[4] = to_mem_raddr__rdy[4];
  assign fu__from_mem_rdata__en[4] = from_mem_rdata__en[4];
  assign fu__from_mem_rdata__msg[4] = from_mem_rdata__msg[4];
  assign from_mem_rdata__rdy[4] = fu__from_mem_rdata__rdy[4];
  assign to_mem_waddr__en[4] = fu__to_mem_waddr__en[4];
  assign to_mem_waddr__msg[4] = fu__to_mem_waddr__msg[4];
  assign fu__to_mem_waddr__rdy[4] = to_mem_waddr__rdy[4];
  assign to_mem_wdata__en[4] = fu__to_mem_wdata__en[4];
  assign to_mem_wdata__msg[4] = fu__to_mem_wdata__msg[4];
  assign fu__to_mem_wdata__rdy[4] = to_mem_wdata__rdy[4];
  assign to_mem_raddr__en[5] = fu__to_mem_raddr__en[5];
  assign to_mem_raddr__msg[5] = fu__to_mem_raddr__msg[5];
  assign fu__to_mem_raddr__rdy[5] = to_mem_raddr__rdy[5];
  assign fu__from_mem_rdata__en[5] = from_mem_rdata__en[5];
  assign fu__from_mem_rdata__msg[5] = from_mem_rdata__msg[5];
  assign from_mem_rdata__rdy[5] = fu__from_mem_rdata__rdy[5];
  assign to_mem_waddr__en[5] = fu__to_mem_waddr__en[5];
  assign to_mem_waddr__msg[5] = fu__to_mem_waddr__msg[5];
  assign fu__to_mem_waddr__rdy[5] = to_mem_waddr__rdy[5];
  assign to_mem_wdata__en[5] = fu__to_mem_wdata__en[5];
  assign to_mem_wdata__msg[5] = fu__to_mem_wdata__msg[5];
  assign fu__to_mem_wdata__rdy[5] = to_mem_wdata__rdy[5];

endmodule