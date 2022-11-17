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

module tb_channel;

logic [0:0] clk;
logic [1:0] count;
logic [0:0] reset;
logic [0:0] recv__en;
CGRAData_32_1_1 recv__msg;
logic [0:0] recv__rdy;
logic [0:0] send__en;
CGRAData_32_1_1 send__msg;
logic [0:0] send__rdy;

  ChannelRTL__DataType_CGRAData_32_1_1__latency_1 dut (
    .clk(clk),
    .count(count),
    .reset(reset),
    .recv__en(recv__en),
    .recv__msg(recv__msg),
    .recv__rdy(recv__rdy),
    .send__en(send__en),
    .send__msg(send__msg),
    .send__rdy(send__rdy)
  );

  initial begin
    reset <= 1; #10;
    reset <= 0; #10;
    reset <= 1;

    recv__en = 1'd1;
    recv__msg = {32'hECEBECEB, 1'd1,1'd1};
    send__rdy = 1'd1;

    #10;
    recv__en = 1'd1;
    recv__msg = {32'hAAAAAAAA, 1'd1,1'd1};
    send__rdy = 1'd1;
  end

  always
    begin
      clk <= 1; #5;
      clk <= 0; #5;
    end

endmodule : tb_channel