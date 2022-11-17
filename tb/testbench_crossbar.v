typedef struct packed {
  logic [5:0] ctrl ;
  logic [0:0] predicate ;
  logic [3:0][2:0] fu_in ;
  logic [7:0][2:0] outport ;
  logic [5:0][0:0] predicate_in ;
} CGRAConfig_6_4_6_8;

// PyMTL BitStruct CGRAData_32_1_1 Definition
// At BitStruct CGRAData_32_1_1
typedef struct packed {
  logic [31:0] payload ;
  logic [0:0] predicate ;
  logic [0:0] bypass ;
} CGRAData_32_1_1;

// PyMTL BitStruct CGRAData_1_1 Definition
// At BitStruct CGRAData_1_1
typedef struct packed {
  logic [0:0] payload ;
  logic [0:0] predicate ;
} CGRAData_1_1;

module tb_crossbar;

  logic [0:0] clk;
  logic [0:0] reset;
  logic [0:0] recv_data__en [0:5];
  CGRAData_32_1_1 recv_data__msg [0:5];
  logic [0:0] recv_data__rdy [0:5];
  logic [0:0] recv_opt__en;
  CGRAConfig_6_4_6_8 recv_opt__msg;
  logic [0:0] recv_opt__rdy;
  logic [0:0] send_data__en [0:7];
  CGRAData_32_1_1 send_data__msg [0:7];
  logic [0:0] send_data__rdy [0:7];
  logic [0:0] send_predicate__en;
  CGRAData_1_1 send_predicate__msg;
  logic [0:0] send_predicate__rdy;

  CrossbarRTL__20918f721d5f331c dut (
    .clk(clk),
    .reset(reset),
    .recv_data__en(recv_data__en),
    .recv_data__msg(recv_data__msg),
    .recv_data__rdy(recv_data__rdy),
    .recv_opt__en(recv_opt__en),
    .recv_opt__msg(recv_opt__msg),
    .recv_opt__rdy(recv_opt__rdy),
    .send_data__en(send_data__en),
    .send_data__msg(send_data__msg),
    .send_data__rdy(send_data__rdy),
    .send_predicate__en(send_predicate__en),
    .send_predicate__msg(send_predicate__msg),
    .send_predicate__rdy(send_predicate__rdy)
  );

  initial begin
    reset <= 1; #10;
    reset <= 0; #10;
    reset <= 1;

    recv_data__en = {1'd0,1'd0,1'd0,1'd0,1'd1,1'd0};
    recv_data__msg = {
      {32'haaaaaaaa, 1'd1,1'd1},
      {32'hbbbbbbbb, 1'd1,1'd1},
      {32'hcccccccc, 1'd1,1'd1},
      {32'hdddddddd, 1'd1,1'd1},
      {32'heeeeeeee, 1'd1,1'd1},
      {32'hffffffff, 1'd1,1'd1}};

    recv_opt__msg.ctrl=6'h20;
    recv_opt__msg.predicate=1'd1;
    recv_opt__msg.fu_in[0]=3'd1;
    recv_opt__msg.fu_in[1]=3'd2;
    recv_opt__msg.fu_in[2]=3'd0;
    recv_opt__msg.fu_in[3]=3'd0;
    recv_opt__msg.outport[0]=3'd0;
    recv_opt__msg.outport[1]=3'd0;
    recv_opt__msg.outport[2]=3'd5;
    recv_opt__msg.outport[3]=3'd0;
    recv_opt__msg.outport[4]=3'd5;
    recv_opt__msg.outport[5]=3'd0;
    recv_opt__msg.outport[6]=3'd0;
    recv_opt__msg.outport[7]=3'd0;
    recv_opt__msg.predicate_in=6'd0;
    recv_opt__en = 1'b1;

    send_data__rdy = {1'd0,1'd0,1'd1,1'd0,1'd1,1'd0,1'd0,1'd0};
    send_predicate__rdy = 1'b1;
  end

  always
    begin
      clk <= 1; #5;
      clk <= 0; #5;
    end

endmodule : tb_crossbar