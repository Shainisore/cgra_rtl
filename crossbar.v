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

// PyMTL Component CrossbarRTL Definition
// Full name: CrossbarRTL__DataType_CGRAData_32_1_1__PredicateType_CGRAData_1_1__CtrlType_CGRAConfig_6_4_6_8__num_inports_6__num_outports_8__bypass_point_4__id_0
// At /home/kevin/Desktop/final_test/noc/CrossbarRTL.py

module CrossbarRTL__20918f721d5f331c
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv_data__en [0:5],
  input CGRAData_32_1_1 recv_data__msg [0:5],
  output logic [0:0] recv_data__rdy [0:5],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_6_8 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  output logic [0:0] send_data__en [0:7],
  output CGRAData_32_1_1 send_data__msg [0:7],
  input logic [0:0] send_data__rdy [0:7],
  output logic [0:0] send_predicate__en,
  output CGRAData_1_1 send_predicate__msg,
  input logic [0:0] send_predicate__rdy
);
  localparam logic [31:0] bypass_point = 32'd4;
  localparam logic [5:0] __const__OPT_START = 6'd0;
  localparam logic [31:0] __const__num_inports_at_update_signal = 32'd6;
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd8;
  logic [0:0] __tmpvar__update_signal_out_rdy ;
  logic [2:0] __tmpvar__update_signal_in_dir;//[7:0] ;

  always_comb begin : update_signal
    __tmpvar__update_signal_out_rdy = 1'd0;
    send_predicate__en = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_predicate__msg = { 1'd0, 1'd0 };
    end
    if ( recv_opt__msg.ctrl != __const__OPT_START ) begin
      for ( int i = 0; i < __const__num_inports_at_update_signal; i += 1 )
        if ( ( recv_opt__msg.predicate_in[i] == 1'd1 ) && ( recv_data__en[i] == 1'd1 ) ) begin
          send_predicate__en = 1'd1;
          send_predicate__msg.payload = 1'd1;
          send_predicate__msg.predicate = send_predicate__msg.predicate | recv_data__msg[i].predicate;
        end
      for ( int i = 0; i < __const__num_outports_at_update_signal; i += 1 ) begin
        __tmpvar__update_signal_in_dir = recv_opt__msg.outport[i];
        __tmpvar__update_signal_out_rdy = __tmpvar__update_signal_out_rdy | send_data__rdy[i];
        if ( ( __tmpvar__update_signal_in_dir > 3'd0 ) && send_data__rdy[i] ) begin
          __tmpvar__update_signal_in_dir = __tmpvar__update_signal_in_dir - 3'd1;
          recv_data__rdy[__tmpvar__update_signal_in_dir] = send_data__rdy[i];
          send_data__en[i] = recv_data__en[__tmpvar__update_signal_in_dir];
          if ( send_data__en[i] && recv_data__rdy[__tmpvar__update_signal_in_dir] ) begin
            send_data__msg[i].payload = recv_data__msg[__tmpvar__update_signal_in_dir].payload;
            send_data__msg[i].predicate = recv_data__msg[__tmpvar__update_signal_in_dir].predicate;
            send_data__msg[i].bypass = recv_data__msg[__tmpvar__update_signal_in_dir].bypass;
          end
          if ( ( __tmpvar__update_signal_in_dir >= 3'( bypass_point ) ) && ( i < bypass_point ) ) begin
            send_data__msg[i].bypass = 1'd1;
          end
          else
            send_data__msg[i].bypass = 1'd0;
        end
        else
          send_data__en[i] = 1'd0;
      end
    end
    else
      for ( int i = 0; i < __const__num_outports_at_update_signal; i += 1 )
        send_data__en[i] = 1'd0;
    recv_opt__rdy = __tmpvar__update_signal_out_rdy;
  end

endmodule