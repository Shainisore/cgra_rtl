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
module tb_cgra;
  
  logic [0:0] clk;
  logic [0:0] reset;
  logic [0:0] recv_waddr__en [0:15];
  logic [1:0] recv_waddr__msg [0:15];
  logic [0:0] recv_waddr__rdy [0:15];
  logic [0:0] recv_wopt__en [0:15];
  CGRAConfig_6_4_6_8 recv_wopt__msg [0:15];
  logic [0:0] recv_wopt__rdy [0:15];

  top dut (
	  .clk(clk),
	  .reset(reset),
	  .recv_waddr__en(recv_waddr__en),
	  .recv_waddr__msg(recv_waddr__msg),
	  .recv_waddr__rdy(recv_waddr__rdy),
	  .recv_wopt__en(recv_wopt__en),
	  .recv_wopt__msg(recv_wopt__msg),
	  .recv_wopt__rdy(recv_wopt__rdy)
  );

  localparam logic [5:0] __const__OPT_LD = 6'd12;
  localparam logic [5:0] __const__OPT_LD_CONST = 6'd28;
  localparam logic [5:0] __const__OPT_STR = 6'd13;

  localparam logic [5:0] __const__OPT_ADD = 6'd2;
  localparam logic [5:0] __const__OPT_ADD_CONST = 6'd25;
  localparam logic [5:0] __const__OPT_INC = 6'd3;
  localparam logic [5:0] __const__OPT_SUB = 6'd4;
  localparam logic [5:0] __const__OPT_PAS = 6'd31;

  // assign dut.tile__5.element__recv_const__msg = {32'd10, 1'd1, 1'd0};
  // assign dut.tile__9.element__recv_const__msg = {32'd0, 1'd1, 1'd0};

  // assign dut.tile__6.element__recv_const__msg = {32'd1, 1'd1, 1'd0};
  // assign dut.tile__10.element__recv_const__msg = {32'd3, 1'd1, 1'd0};

  assign dut.tile__0.element__recv_const__msg = {32'd8, 1'd1, 1'd0};
  assign dut.tile__4.element__recv_const__msg = {32'd6, 1'd1, 1'd0};

  initial begin
    reset <= 1; #10;
    reset <= 0; #10;
    reset <= 1;


    for ( int i = 0; i < 100; i += 1 ) begin
      dut.data_mem.reg_file.regs[i].payload = 32'd5;
      dut.data_mem.reg_file.regs[i].predicate = 1'd1;
      dut.data_mem.reg_file.regs[i].bypass = 1'd0;
    end


    for ( int i = 0; i < 16; i += 1 ) begin
      recv_waddr__en[i] = 1'd1;
      recv_waddr__msg[i] = 2'd0;
      recv_wopt__en[i] = 1'd1;
    end

    recv_wopt__msg[0].ctrl=__const__OPT_LD_CONST;
    recv_wopt__msg[0].predicate=1'd0;
    recv_wopt__msg[0].fu_in={3'd0, 3'd0, 3'd0, 3'd0};
    recv_wopt__msg[0].outport={3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5};
    recv_wopt__msg[0].predicate_in=6'd0;
 
    recv_wopt__msg[4].ctrl=__const__OPT_LD_CONST;
    recv_wopt__msg[4].predicate=1'd0;
    recv_wopt__msg[4].fu_in={3'd0, 3'd0, 3'd0, 3'd0};
    recv_wopt__msg[4].outport={3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5};
    recv_wopt__msg[4].predicate_in=6'd0;

    // #10;
    // for ( int i = 0; i < 16; i += 1 ) begin
    //   recv_waddr__en[i] = 1'd1;
    //   recv_waddr__msg[i] = 2'd1;
    // end
    recv_wopt__msg[1].ctrl=__const__OPT_ADD;
    recv_wopt__msg[1].predicate=1'd0;
    recv_wopt__msg[1].fu_in={3'd3, 3'd3, 3'd3, 3'd3};
    recv_wopt__msg[1].outport={3'd3, 3'd3, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5, 3'd5};
    recv_wopt__msg[1].predicate_in=6'd0;
//--------------------FIR---------------------

    // recv_wopt__msg[0].ctrl=6'd1;
    // recv_wopt__msg[0].predicate=1'd0;
    // recv_wopt__msg[0].fu_in[0]=3'd0;
    // recv_wopt__msg[0].fu_in[1]=3'd0;
    // recv_wopt__msg[0].fu_in[2]=3'd0;
    // recv_wopt__msg[0].fu_in[3]=3'd0;
    // recv_wopt__msg[0].outport[0]=3'd0;
    // recv_wopt__msg[0].outport[1]=3'd0;
    // recv_wopt__msg[0].outport[2]=3'd0;
    // recv_wopt__msg[0].outport[3]=3'd0;
    // recv_wopt__msg[0].outport[4]=3'd0;
    // recv_wopt__msg[0].outport[5]=3'd0;
    // recv_wopt__msg[0].outport[6]=3'd0;
    // recv_wopt__msg[0].outport[7]=3'd0;
    // recv_wopt__msg[0].predicate_in=6'd0;

    // recv_wopt__msg[1].ctrl=6'd1;
    // recv_wopt__msg[1].predicate=1'd0;
    // recv_wopt__msg[1].fu_in[0]=3'd0;
    // recv_wopt__msg[1].fu_in[1]=3'd0;
    // recv_wopt__msg[1].fu_in[2]=3'd0;
    // recv_wopt__msg[1].fu_in[3]=3'd0;
    // recv_wopt__msg[1].outport[0]=3'd0;
    // recv_wopt__msg[1].outport[1]=3'd0;
    // recv_wopt__msg[1].outport[2]=3'd0;
    // recv_wopt__msg[1].outport[3]=3'd0;
    // recv_wopt__msg[1].outport[4]=3'd0;
    // recv_wopt__msg[1].outport[5]=3'd0;
    // recv_wopt__msg[1].outport[6]=3'd0;
    // recv_wopt__msg[1].outport[7]=3'd0;
    // recv_wopt__msg[1].predicate_in=6'd0;    

    // recv_wopt__msg[2].ctrl=6'd1;
    // recv_wopt__msg[2].predicate=1'd0;
    // recv_wopt__msg[2].fu_in[0]=3'd0;
    // recv_wopt__msg[2].fu_in[1]=3'd0;
    // recv_wopt__msg[2].fu_in[2]=3'd0;
    // recv_wopt__msg[2].fu_in[3]=3'd0;
    // recv_wopt__msg[2].outport[0]=3'd0;
    // recv_wopt__msg[2].outport[1]=3'd0;
    // recv_wopt__msg[2].outport[2]=3'd0;
    // recv_wopt__msg[2].outport[3]=3'd0;
    // recv_wopt__msg[2].outport[4]=3'd0;
    // recv_wopt__msg[2].outport[5]=3'd0;
    // recv_wopt__msg[2].outport[6]=3'd0;
    // recv_wopt__msg[2].outport[7]=3'd0;
    // recv_wopt__msg[2].predicate_in=6'd0;

    // recv_wopt__msg[3].ctrl=6'd1;
    // recv_wopt__msg[3].predicate=1'd0;
    // recv_wopt__msg[3].fu_in[0]=3'd0;
    // recv_wopt__msg[3].fu_in[1]=3'd0;
    // recv_wopt__msg[3].fu_in[2]=3'd0;
    // recv_wopt__msg[3].fu_in[3]=3'd0;
    // recv_wopt__msg[3].outport[0]=3'd0;
    // recv_wopt__msg[3].outport[1]=3'd0;
    // recv_wopt__msg[3].outport[2]=3'd0;
    // recv_wopt__msg[3].outport[3]=3'd0;
    // recv_wopt__msg[3].outport[4]=3'd0;
    // recv_wopt__msg[3].outport[5]=3'd0;
    // recv_wopt__msg[3].outport[6]=3'd0;
    // recv_wopt__msg[3].outport[7]=3'd0;
    // recv_wopt__msg[3].predicate_in=6'd0;   

    // recv_wopt__msg[4].ctrl=6'd1;
    // recv_wopt__msg[4].predicate=1'd0;
    // recv_wopt__msg[4].fu_in[0]=3'd0;
    // recv_wopt__msg[4].fu_in[1]=3'd0;
    // recv_wopt__msg[4].fu_in[2]=3'd0;
    // recv_wopt__msg[4].fu_in[3]=3'd0;
    // recv_wopt__msg[4].outport[0]=3'd0;
    // recv_wopt__msg[4].outport[1]=3'd0;
    // recv_wopt__msg[4].outport[2]=3'd0;
    // recv_wopt__msg[4].outport[3]=3'd0;
    // recv_wopt__msg[4].outport[4]=3'd0;
    // recv_wopt__msg[4].outport[5]=3'd0;
    // recv_wopt__msg[4].outport[6]=3'd0;
    // recv_wopt__msg[4].outport[7]=3'd0;
    // recv_wopt__msg[4].predicate_in=6'd0;

    // recv_wopt__msg[5].ctrl=6'd1;
    // recv_wopt__msg[5].predicate=1'd0;
    // recv_wopt__msg[5].fu_in[0]=3'd0;
    // recv_wopt__msg[5].fu_in[1]=3'd0;
    // recv_wopt__msg[5].fu_in[2]=3'd0;
    // recv_wopt__msg[5].fu_in[3]=3'd0;
    // recv_wopt__msg[5].outport[0]=3'd4;
    // recv_wopt__msg[5].outport[1]=3'd0;
    // recv_wopt__msg[5].outport[2]=3'd0;
    // recv_wopt__msg[5].outport[3]=3'd0;
    // recv_wopt__msg[5].outport[4]=3'd0;
    // recv_wopt__msg[5].outport[5]=3'd3;
    // recv_wopt__msg[5].outport[6]=3'd4;
    // recv_wopt__msg[5].outport[7]=3'd0;
    // recv_wopt__msg[5].predicate_in=6'd0;    

    // recv_wopt__msg[6].ctrl=6'h20;
    // recv_wopt__msg[6].predicate=1'd1;
    // recv_wopt__msg[6].fu_in[0]=3'd1;
    // recv_wopt__msg[6].fu_in[1]=3'd2;
    // recv_wopt__msg[6].fu_in[2]=3'd0;
    // recv_wopt__msg[6].fu_in[3]=3'd0;
    // recv_wopt__msg[6].outport[0]=3'd0;
    // recv_wopt__msg[6].outport[1]=3'd0;
    // recv_wopt__msg[6].outport[2]=3'd5;
    // recv_wopt__msg[6].outport[3]=3'd0;
    // recv_wopt__msg[6].outport[4]=3'd5;
    // recv_wopt__msg[6].outport[5]=3'd0;
    // recv_wopt__msg[6].outport[6]=3'd0;
    // recv_wopt__msg[6].outport[7]=3'd0;
    // recv_wopt__msg[6].predicate_in=6'd0;

    // recv_wopt__msg[7].ctrl=6'd1;
    // recv_wopt__msg[7].predicate=1'd0;
    // recv_wopt__msg[7].fu_in[0]=3'd0;
    // recv_wopt__msg[7].fu_in[1]=3'd0;
    // recv_wopt__msg[7].fu_in[2]=3'd0;
    // recv_wopt__msg[7].fu_in[3]=3'd0;
    // recv_wopt__msg[7].outport[0]=3'd0;
    // recv_wopt__msg[7].outport[1]=3'd0;
    // recv_wopt__msg[7].outport[2]=3'd0;
    // recv_wopt__msg[7].outport[3]=3'd0;
    // recv_wopt__msg[7].outport[4]=3'd0;
    // recv_wopt__msg[7].outport[5]=3'd0;
    // recv_wopt__msg[7].outport[6]=3'd0;
    // recv_wopt__msg[7].outport[7]=3'd0;
    // recv_wopt__msg[7].predicate_in=6'd0;   

    // recv_wopt__msg[8].ctrl=6'd1;
    // recv_wopt__msg[8].predicate=1'd0;
    // recv_wopt__msg[8].fu_in[0]=3'd0;
    // recv_wopt__msg[8].fu_in[1]=3'd0;
    // recv_wopt__msg[8].fu_in[2]=3'd0;
    // recv_wopt__msg[8].fu_in[3]=3'd0;
    // recv_wopt__msg[8].outport[0]=3'd0;
    // recv_wopt__msg[8].outport[1]=3'd0;
    // recv_wopt__msg[8].outport[2]=3'd0;
    // recv_wopt__msg[8].outport[3]=3'd0;
    // recv_wopt__msg[8].outport[4]=3'd0;
    // recv_wopt__msg[8].outport[5]=3'd0;
    // recv_wopt__msg[8].outport[6]=3'd0;
    // recv_wopt__msg[8].outport[7]=3'd0;
    // recv_wopt__msg[8].predicate_in=6'd0;

    // recv_wopt__msg[9].ctrl=6'd2;
    // recv_wopt__msg[9].predicate=1'd0;
    // recv_wopt__msg[9].fu_in[0]=3'd1;
    // recv_wopt__msg[9].fu_in[1]=3'd2;
    // recv_wopt__msg[9].fu_in[2]=3'd0;
    // recv_wopt__msg[9].fu_in[3]=3'd0;
    // recv_wopt__msg[9].outport[0]=3'd0;
    // recv_wopt__msg[9].outport[1]=3'd0;
    // recv_wopt__msg[9].outport[2]=3'd0;
    // recv_wopt__msg[9].outport[3]=3'd5;
    // recv_wopt__msg[9].outport[4]=3'd0;
    // recv_wopt__msg[9].outport[5]=3'd0;
    // recv_wopt__msg[9].outport[6]=3'd0;
    // recv_wopt__msg[9].outport[7]=3'd0;
    // recv_wopt__msg[9].predicate_in=6'd0;    

    // recv_wopt__msg[10].ctrl=6'd1;
    // recv_wopt__msg[10].predicate=1'd0;
    // recv_wopt__msg[10].fu_in[0]=3'd0;
    // recv_wopt__msg[10].fu_in[1]=3'd0;
    // recv_wopt__msg[10].fu_in[2]=3'd0;
    // recv_wopt__msg[10].fu_in[3]=3'd0;
    // recv_wopt__msg[10].outport[0]=3'd0;
    // recv_wopt__msg[10].outport[1]=3'd0;
    // recv_wopt__msg[10].outport[2]=3'd0;
    // recv_wopt__msg[10].outport[3]=3'd0;
    // recv_wopt__msg[10].outport[4]=3'd3;
    // recv_wopt__msg[10].outport[5]=3'd0;
    // recv_wopt__msg[10].outport[6]=3'd0;
    // recv_wopt__msg[10].outport[7]=3'd0;
    // recv_wopt__msg[10].predicate_in=6'd0;

    // recv_wopt__msg[11].ctrl=6'd1;
    // recv_wopt__msg[11].predicate=1'd0;
    // recv_wopt__msg[11].fu_in[0]=3'd0;
    // recv_wopt__msg[11].fu_in[1]=3'd0;
    // recv_wopt__msg[11].fu_in[2]=3'd0;
    // recv_wopt__msg[11].fu_in[3]=3'd0;
    // recv_wopt__msg[11].outport[0]=3'd0;
    // recv_wopt__msg[11].outport[1]=3'd0;
    // recv_wopt__msg[11].outport[2]=3'd0;
    // recv_wopt__msg[11].outport[3]=3'd0;
    // recv_wopt__msg[11].outport[4]=3'd0;
    // recv_wopt__msg[11].outport[5]=3'd0;
    // recv_wopt__msg[11].outport[6]=3'd0;
    // recv_wopt__msg[11].outport[7]=3'd0;
    // recv_wopt__msg[11].predicate_in=6'd0;   

    // recv_wopt__msg[12].ctrl=6'd1;
    // recv_wopt__msg[12].predicate=1'd0;
    // recv_wopt__msg[12].fu_in[0]=3'd0;
    // recv_wopt__msg[12].fu_in[1]=3'd0;
    // recv_wopt__msg[12].fu_in[2]=3'd0;
    // recv_wopt__msg[12].fu_in[3]=3'd0;
    // recv_wopt__msg[12].outport[0]=3'd0;
    // recv_wopt__msg[12].outport[1]=3'd0;
    // recv_wopt__msg[12].outport[2]=3'd0;
    // recv_wopt__msg[12].outport[3]=3'd0;
    // recv_wopt__msg[12].outport[4]=3'd0;
    // recv_wopt__msg[12].outport[5]=3'd0;
    // recv_wopt__msg[12].outport[6]=3'd0;
    // recv_wopt__msg[12].outport[7]=3'd0;
    // recv_wopt__msg[12].predicate_in=6'd0;

    // recv_wopt__msg[13].ctrl=6'd1;
    // recv_wopt__msg[13].predicate=1'd0;
    // recv_wopt__msg[13].fu_in[0]=3'd0;
    // recv_wopt__msg[13].fu_in[1]=3'd0;
    // recv_wopt__msg[13].fu_in[2]=3'd0;
    // recv_wopt__msg[13].fu_in[3]=3'd0;
    // recv_wopt__msg[13].outport[0]=3'd0;
    // recv_wopt__msg[13].outport[1]=3'd0;
    // recv_wopt__msg[13].outport[2]=3'd0;
    // recv_wopt__msg[13].outport[3]=3'd0;
    // recv_wopt__msg[13].outport[4]=3'd0;
    // recv_wopt__msg[13].outport[5]=3'd0;
    // recv_wopt__msg[13].outport[6]=3'd0;
    // recv_wopt__msg[13].outport[7]=3'd0;
    // recv_wopt__msg[13].predicate_in=6'd0;    

    // recv_wopt__msg[14].ctrl=6'd1;
    // recv_wopt__msg[14].predicate=1'd0;
    // recv_wopt__msg[14].fu_in[0]=3'd0;
    // recv_wopt__msg[14].fu_in[1]=3'd0;
    // recv_wopt__msg[14].fu_in[2]=3'd0;
    // recv_wopt__msg[14].fu_in[3]=3'd0;
    // recv_wopt__msg[14].outport[0]=3'd0;
    // recv_wopt__msg[14].outport[1]=3'd0;
    // recv_wopt__msg[14].outport[2]=3'd0;
    // recv_wopt__msg[14].outport[3]=3'd0;
    // recv_wopt__msg[14].outport[4]=3'd0;
    // recv_wopt__msg[14].outport[5]=3'd0;
    // recv_wopt__msg[14].outport[6]=3'd0;
    // recv_wopt__msg[14].outport[7]=3'd0;
    // recv_wopt__msg[14].predicate_in=6'd0;

    // recv_wopt__msg[15].ctrl=6'd1;
    // recv_wopt__msg[15].predicate=1'd0;
    // recv_wopt__msg[15].fu_in[0]=3'd0;
    // recv_wopt__msg[15].fu_in[1]=3'd0;
    // recv_wopt__msg[15].fu_in[2]=3'd0;
    // recv_wopt__msg[15].fu_in[3]=3'd0;
    // recv_wopt__msg[15].outport[0]=3'd0;
    // recv_wopt__msg[15].outport[1]=3'd0;
    // recv_wopt__msg[15].outport[2]=3'd0;
    // recv_wopt__msg[15].outport[3]=3'd0;
    // recv_wopt__msg[15].outport[4]=3'd0;
    // recv_wopt__msg[15].outport[5]=3'd0;
    // recv_wopt__msg[15].outport[6]=3'd0;
    // recv_wopt__msg[15].outport[7]=3'd0;
    // recv_wopt__msg[15].predicate_in=6'd0;   

// //second cycle
//     #10;
//     for ( int i = 0; i < 16; i += 1 ) begin
//       recv_waddr__en[i] = 1'd1;
//       recv_waddr__msg[i] = 2'd1;
//     end
//     recv_wopt__msg[0].ctrl=6'd1;
//     recv_wopt__msg[0].predicate=1'd0;
//     recv_wopt__msg[0].fu_in[0]=3'd0;
//     recv_wopt__msg[0].fu_in[1]=3'd0;
//     recv_wopt__msg[0].fu_in[2]=3'd0;
//     recv_wopt__msg[0].fu_in[3]=3'd0;
//     recv_wopt__msg[0].outport[0]=3'd0;
//     recv_wopt__msg[0].outport[1]=3'd0;
//     recv_wopt__msg[0].outport[2]=3'd0;
//     recv_wopt__msg[0].outport[3]=3'd0;
//     recv_wopt__msg[0].outport[4]=3'd0;
//     recv_wopt__msg[0].outport[5]=3'd0;
//     recv_wopt__msg[0].outport[6]=3'd0;
//     recv_wopt__msg[0].outport[7]=3'd0;
//     recv_wopt__msg[0].predicate_in=6'd0;

//     recv_wopt__msg[1].ctrl=6'd1;
//     recv_wopt__msg[1].predicate=1'd0;
//     recv_wopt__msg[1].fu_in[0]=3'd0;
//     recv_wopt__msg[1].fu_in[1]=3'd0;
//     recv_wopt__msg[1].fu_in[2]=3'd0;
//     recv_wopt__msg[1].fu_in[3]=3'd0;
//     recv_wopt__msg[1].outport[0]=3'd0;
//     recv_wopt__msg[1].outport[1]=3'd0;
//     recv_wopt__msg[1].outport[2]=3'd0;
//     recv_wopt__msg[1].outport[3]=3'd0;
//     recv_wopt__msg[1].outport[4]=3'd0;
//     recv_wopt__msg[1].outport[5]=3'd0;
//     recv_wopt__msg[1].outport[6]=3'd0;
//     recv_wopt__msg[1].outport[7]=3'd0;
//     recv_wopt__msg[1].predicate_in=6'd0;    

//     recv_wopt__msg[2].ctrl=6'd1;
//     recv_wopt__msg[2].predicate=1'd0;
//     recv_wopt__msg[2].fu_in[0]=3'd0;
//     recv_wopt__msg[2].fu_in[1]=3'd0;
//     recv_wopt__msg[2].fu_in[2]=3'd0;
//     recv_wopt__msg[2].fu_in[3]=3'd0;
//     recv_wopt__msg[2].outport[0]=3'd0;
//     recv_wopt__msg[2].outport[1]=3'd0;
//     recv_wopt__msg[2].outport[2]=3'd0;
//     recv_wopt__msg[2].outport[3]=3'd0;
//     recv_wopt__msg[2].outport[4]=3'd0;
//     recv_wopt__msg[2].outport[5]=3'd0;
//     recv_wopt__msg[2].outport[6]=3'd0;
//     recv_wopt__msg[2].outport[7]=3'd0;
//     recv_wopt__msg[2].predicate_in=6'd0;

//     recv_wopt__msg[3].ctrl=6'd1;
//     recv_wopt__msg[3].predicate=1'd0;
//     recv_wopt__msg[3].fu_in[0]=3'd0;
//     recv_wopt__msg[3].fu_in[1]=3'd0;
//     recv_wopt__msg[3].fu_in[2]=3'd0;
//     recv_wopt__msg[3].fu_in[3]=3'd0;
//     recv_wopt__msg[3].outport[0]=3'd0;
//     recv_wopt__msg[3].outport[1]=3'd0;
//     recv_wopt__msg[3].outport[2]=3'd0;
//     recv_wopt__msg[3].outport[3]=3'd0;
//     recv_wopt__msg[3].outport[4]=3'd0;
//     recv_wopt__msg[3].outport[5]=3'd0;
//     recv_wopt__msg[3].outport[6]=3'd0;
//     recv_wopt__msg[3].outport[7]=3'd0;
//     recv_wopt__msg[3].predicate_in=6'd0;   

//     recv_wopt__msg[4].ctrl=6'd1;
//     recv_wopt__msg[4].predicate=1'd0;
//     recv_wopt__msg[4].fu_in[0]=3'd0;
//     recv_wopt__msg[4].fu_in[1]=3'd0;
//     recv_wopt__msg[4].fu_in[2]=3'd0;
//     recv_wopt__msg[4].fu_in[3]=3'd0;
//     recv_wopt__msg[4].outport[0]=3'd0;
//     recv_wopt__msg[4].outport[1]=3'd0;
//     recv_wopt__msg[4].outport[2]=3'd0;
//     recv_wopt__msg[4].outport[3]=3'd0;
//     recv_wopt__msg[4].outport[4]=3'd4;
//     recv_wopt__msg[4].outport[5]=3'd0;
//     recv_wopt__msg[4].outport[6]=3'd0;
//     recv_wopt__msg[4].outport[7]=3'd0;
//     recv_wopt__msg[4].predicate_in=6'd0;

//     recv_wopt__msg[5].ctrl=6'h19;
//     recv_wopt__msg[5].predicate=1'd0;
//     recv_wopt__msg[5].fu_in[0]=3'd3;
//     recv_wopt__msg[5].fu_in[1]=3'd0;
//     recv_wopt__msg[5].fu_in[2]=3'd0;
//     recv_wopt__msg[5].fu_in[3]=3'd0;
//     recv_wopt__msg[5].outport[0]=3'd0;
//     recv_wopt__msg[5].outport[1]=3'd0;
//     recv_wopt__msg[5].outport[2]=3'd5;
//     recv_wopt__msg[5].outport[3]=3'd0;
//     recv_wopt__msg[5].outport[4]=3'd0;
//     recv_wopt__msg[5].outport[5]=3'd0;
//     recv_wopt__msg[5].outport[6]=3'd0;
//     recv_wopt__msg[5].outport[7]=3'd0;
//     recv_wopt__msg[5].predicate_in=6'd0;    

//     recv_wopt__msg[6].ctrl=6'h19;
//     recv_wopt__msg[6].predicate=1'd0;
//     recv_wopt__msg[6].fu_in[0]=3'd1;
//     recv_wopt__msg[6].fu_in[1]=3'd2;
//     recv_wopt__msg[6].fu_in[2]=3'd0;
//     recv_wopt__msg[6].fu_in[3]=3'd0;
//     recv_wopt__msg[6].outport[0]=3'd5;
//     recv_wopt__msg[6].outport[1]=3'd0;
//     recv_wopt__msg[6].outport[2]=3'd0;
//     recv_wopt__msg[6].outport[3]=3'd0;
//     recv_wopt__msg[6].outport[4]=3'd5;
//     recv_wopt__msg[6].outport[5]=3'd0;
//     recv_wopt__msg[6].outport[6]=3'd0;
//     recv_wopt__msg[6].outport[7]=3'd0;
//     recv_wopt__msg[6].predicate_in=6'd0;

//     recv_wopt__msg[7].ctrl=6'd1;
//     recv_wopt__msg[7].predicate=1'd0;
//     recv_wopt__msg[7].fu_in[0]=3'd0;
//     recv_wopt__msg[7].fu_in[1]=3'd0;
//     recv_wopt__msg[7].fu_in[2]=3'd0;
//     recv_wopt__msg[7].fu_in[3]=3'd0;
//     recv_wopt__msg[7].outport[0]=3'd0;
//     recv_wopt__msg[7].outport[1]=3'd0;
//     recv_wopt__msg[7].outport[2]=3'd0;
//     recv_wopt__msg[7].outport[3]=3'd0;
//     recv_wopt__msg[7].outport[4]=3'd0;
//     recv_wopt__msg[7].outport[5]=3'd0;
//     recv_wopt__msg[7].outport[6]=3'd0;
//     recv_wopt__msg[7].outport[7]=3'd0;
//     recv_wopt__msg[7].predicate_in=6'd0;   

//     recv_wopt__msg[8].ctrl=6'd1;
//     recv_wopt__msg[8].predicate=1'd0;
//     recv_wopt__msg[8].fu_in[0]=3'd0;
//     recv_wopt__msg[8].fu_in[1]=3'd0;
//     recv_wopt__msg[8].fu_in[2]=3'd0;
//     recv_wopt__msg[8].fu_in[3]=3'd0;
//     recv_wopt__msg[8].outport[0]=3'd0;
//     recv_wopt__msg[8].outport[1]=3'd0;
//     recv_wopt__msg[8].outport[2]=3'd0;
//     recv_wopt__msg[8].outport[3]=3'd0;
//     recv_wopt__msg[8].outport[4]=3'd0;
//     recv_wopt__msg[8].outport[5]=3'd0;
//     recv_wopt__msg[8].outport[6]=3'd0;
//     recv_wopt__msg[8].outport[7]=3'd0;
//     recv_wopt__msg[8].predicate_in=6'd0;

//     recv_wopt__msg[9].ctrl=6'd1;
//     recv_wopt__msg[9].predicate=1'd0;
//     recv_wopt__msg[9].fu_in[0]=3'd0;
//     recv_wopt__msg[9].fu_in[1]=3'd0;
//     recv_wopt__msg[9].fu_in[2]=3'd0;
//     recv_wopt__msg[9].fu_in[3]=3'd0;
//     recv_wopt__msg[9].outport[0]=3'd0;
//     recv_wopt__msg[9].outport[1]=3'd0;
//     recv_wopt__msg[9].outport[2]=3'd0;
//     recv_wopt__msg[9].outport[3]=3'd0;
//     recv_wopt__msg[9].outport[4]=3'd0;
//     recv_wopt__msg[9].outport[5]=3'd4;
//     recv_wopt__msg[9].outport[6]=3'd2;
//     recv_wopt__msg[9].outport[7]=3'd0;
//     recv_wopt__msg[9].predicate_in=6'd0;    

//     recv_wopt__msg[10].ctrl=6'h20;
//     recv_wopt__msg[10].predicate=1'd1;
//     recv_wopt__msg[10].fu_in[0]=3'd1;
//     recv_wopt__msg[10].fu_in[1]=3'd0;
//     recv_wopt__msg[10].fu_in[2]=3'd0;
//     recv_wopt__msg[10].fu_in[3]=3'd0;
//     recv_wopt__msg[10].outport[0]=3'd0;
//     recv_wopt__msg[10].outport[1]=3'd0;
//     recv_wopt__msg[10].outport[2]=3'd5;
//     recv_wopt__msg[10].outport[3]=3'd0;
//     recv_wopt__msg[10].outport[4]=3'd2;
//     recv_wopt__msg[10].outport[5]=3'd0;
//     recv_wopt__msg[10].outport[6]=3'd0;
//     recv_wopt__msg[10].outport[7]=3'd0;
//     recv_wopt__msg[10].predicate_in=6'd0;

//     recv_wopt__msg[11].ctrl=6'd1;
//     recv_wopt__msg[11].predicate=1'd0;
//     recv_wopt__msg[11].fu_in[0]=3'd0;
//     recv_wopt__msg[11].fu_in[1]=3'd0;
//     recv_wopt__msg[11].fu_in[2]=3'd0;
//     recv_wopt__msg[11].fu_in[3]=3'd0;
//     recv_wopt__msg[11].outport[0]=3'd0;
//     recv_wopt__msg[11].outport[1]=3'd0;
//     recv_wopt__msg[11].outport[2]=3'd0;
//     recv_wopt__msg[11].outport[3]=3'd0;
//     recv_wopt__msg[11].outport[4]=3'd0;
//     recv_wopt__msg[11].outport[5]=3'd0;
//     recv_wopt__msg[11].outport[6]=3'd0;
//     recv_wopt__msg[11].outport[7]=3'd0;
//     recv_wopt__msg[11].predicate_in=6'd0;   

//     recv_wopt__msg[12].ctrl=6'd1;
//     recv_wopt__msg[12].predicate=1'd0;
//     recv_wopt__msg[12].fu_in[0]=3'd0;
//     recv_wopt__msg[12].fu_in[1]=3'd0;
//     recv_wopt__msg[12].fu_in[2]=3'd0;
//     recv_wopt__msg[12].fu_in[3]=3'd0;
//     recv_wopt__msg[12].outport[0]=3'd0;
//     recv_wopt__msg[12].outport[1]=3'd0;
//     recv_wopt__msg[12].outport[2]=3'd0;
//     recv_wopt__msg[12].outport[3]=3'd0;
//     recv_wopt__msg[12].outport[4]=3'd0;
//     recv_wopt__msg[12].outport[5]=3'd0;
//     recv_wopt__msg[12].outport[6]=3'd0;
//     recv_wopt__msg[12].outport[7]=3'd0;
//     recv_wopt__msg[12].predicate_in=6'd0;

//     recv_wopt__msg[13].ctrl=6'd1;
//     recv_wopt__msg[13].predicate=1'd0;
//     recv_wopt__msg[13].fu_in[0]=3'd0;
//     recv_wopt__msg[13].fu_in[1]=3'd0;
//     recv_wopt__msg[13].fu_in[2]=3'd0;
//     recv_wopt__msg[13].fu_in[3]=3'd0;
//     recv_wopt__msg[13].outport[0]=3'd0;
//     recv_wopt__msg[13].outport[1]=3'd0;
//     recv_wopt__msg[13].outport[2]=3'd0;
//     recv_wopt__msg[13].outport[3]=3'd0;
//     recv_wopt__msg[13].outport[4]=3'd0;
//     recv_wopt__msg[13].outport[5]=3'd0;
//     recv_wopt__msg[13].outport[6]=3'd0;
//     recv_wopt__msg[13].outport[7]=3'd0;
//     recv_wopt__msg[13].predicate_in=6'd0;    

//     recv_wopt__msg[14].ctrl=6'd1;
//     recv_wopt__msg[14].predicate=1'd0;
//     recv_wopt__msg[14].fu_in[0]=3'd0;
//     recv_wopt__msg[14].fu_in[1]=3'd0;
//     recv_wopt__msg[14].fu_in[2]=3'd0;
//     recv_wopt__msg[14].fu_in[3]=3'd0;
//     recv_wopt__msg[14].outport[0]=3'd0;
//     recv_wopt__msg[14].outport[1]=3'd0;
//     recv_wopt__msg[14].outport[2]=3'd0;
//     recv_wopt__msg[14].outport[3]=3'd0;
//     recv_wopt__msg[14].outport[4]=3'd0;
//     recv_wopt__msg[14].outport[5]=3'd0;
//     recv_wopt__msg[14].outport[6]=3'd0;
//     recv_wopt__msg[14].outport[7]=3'd0;
//     recv_wopt__msg[14].predicate_in=6'd0;

//     recv_wopt__msg[15].ctrl=6'd1;
//     recv_wopt__msg[15].predicate=1'd0;
//     recv_wopt__msg[15].fu_in[0]=3'd0;
//     recv_wopt__msg[15].fu_in[1]=3'd0;
//     recv_wopt__msg[15].fu_in[2]=3'd0;
//     recv_wopt__msg[15].fu_in[3]=3'd0;
//     recv_wopt__msg[15].outport[0]=3'd0;
//     recv_wopt__msg[15].outport[1]=3'd0;
//     recv_wopt__msg[15].outport[2]=3'd0;
//     recv_wopt__msg[15].outport[3]=3'd0;
//     recv_wopt__msg[15].outport[4]=3'd0;
//     recv_wopt__msg[15].outport[5]=3'd0;
//     recv_wopt__msg[15].outport[6]=3'd0;
//     recv_wopt__msg[15].outport[7]=3'd0;
//     recv_wopt__msg[15].predicate_in=6'd0;  

// //third cycle
//     #10;
//     for ( int i = 0; i < 16; i += 1 ) begin
//       recv_waddr__en[i] = 1'd1;
//       recv_waddr__msg[i] = 2'd2;
//     end
//     recv_wopt__msg[0].ctrl=6'd1;
//     recv_wopt__msg[0].predicate=1'd0;
//     recv_wopt__msg[0].fu_in[0]=3'd0;
//     recv_wopt__msg[0].fu_in[1]=3'd0;
//     recv_wopt__msg[0].fu_in[2]=3'd0;
//     recv_wopt__msg[0].fu_in[3]=3'd0;
//     recv_wopt__msg[0].outport[0]=3'd0;
//     recv_wopt__msg[0].outport[1]=3'd0;
//     recv_wopt__msg[0].outport[2]=3'd0;
//     recv_wopt__msg[0].outport[3]=3'd0;
//     recv_wopt__msg[0].outport[4]=3'd0;
//     recv_wopt__msg[0].outport[5]=3'd0;
//     recv_wopt__msg[0].outport[6]=3'd0;
//     recv_wopt__msg[0].outport[7]=3'd0;
//     recv_wopt__msg[0].predicate_in=6'd0;

//     recv_wopt__msg[1].ctrl=6'd1;
//     recv_wopt__msg[1].predicate=1'd0;
//     recv_wopt__msg[1].fu_in[0]=3'd0;
//     recv_wopt__msg[1].fu_in[1]=3'd0;
//     recv_wopt__msg[1].fu_in[2]=3'd0;
//     recv_wopt__msg[1].fu_in[3]=3'd0;
//     recv_wopt__msg[1].outport[0]=3'd0;
//     recv_wopt__msg[1].outport[1]=3'd0;
//     recv_wopt__msg[1].outport[2]=3'd0;
//     recv_wopt__msg[1].outport[3]=3'd0;
//     recv_wopt__msg[1].outport[4]=3'd0;
//     recv_wopt__msg[1].outport[5]=3'd0;
//     recv_wopt__msg[1].outport[6]=3'd0;
//     recv_wopt__msg[1].outport[7]=3'd0;
//     recv_wopt__msg[1].predicate_in=6'd0;    

//     recv_wopt__msg[2].ctrl=6'd1;
//     recv_wopt__msg[2].predicate=1'd0;
//     recv_wopt__msg[2].fu_in[0]=3'd0;
//     recv_wopt__msg[2].fu_in[1]=3'd0;
//     recv_wopt__msg[2].fu_in[2]=3'd0;
//     recv_wopt__msg[2].fu_in[3]=3'd0;
//     recv_wopt__msg[2].outport[0]=3'd0;
//     recv_wopt__msg[2].outport[1]=3'd0;
//     recv_wopt__msg[2].outport[2]=3'd0;
//     recv_wopt__msg[2].outport[3]=3'd0;
//     recv_wopt__msg[2].outport[4]=3'd0;
//     recv_wopt__msg[2].outport[5]=3'd0;
//     recv_wopt__msg[2].outport[6]=3'd0;
//     recv_wopt__msg[2].outport[7]=3'd0;
//     recv_wopt__msg[2].predicate_in=6'd0;

//     recv_wopt__msg[3].ctrl=6'd1;
//     recv_wopt__msg[3].predicate=1'd0;
//     recv_wopt__msg[3].fu_in[0]=3'd0;
//     recv_wopt__msg[3].fu_in[1]=3'd0;
//     recv_wopt__msg[3].fu_in[2]=3'd0;
//     recv_wopt__msg[3].fu_in[3]=3'd0;
//     recv_wopt__msg[3].outport[0]=3'd0;
//     recv_wopt__msg[3].outport[1]=3'd0;
//     recv_wopt__msg[3].outport[2]=3'd0;
//     recv_wopt__msg[3].outport[3]=3'd0;
//     recv_wopt__msg[3].outport[4]=3'd0;
//     recv_wopt__msg[3].outport[5]=3'd0;
//     recv_wopt__msg[3].outport[6]=3'd0;
//     recv_wopt__msg[3].outport[7]=3'd0;
//     recv_wopt__msg[3].predicate_in=6'd0;   

//     recv_wopt__msg[4].ctrl=6'h0c;
//     recv_wopt__msg[4].predicate=1'd0;
//     recv_wopt__msg[4].fu_in[0]=3'd1;
//     recv_wopt__msg[4].fu_in[1]=3'd2;
//     recv_wopt__msg[4].fu_in[2]=3'd0;
//     recv_wopt__msg[4].fu_in[3]=3'd0;
//     recv_wopt__msg[4].outport[0]=3'd0;
//     recv_wopt__msg[4].outport[1]=3'd0;
//     recv_wopt__msg[4].outport[2]=3'd0;
//     recv_wopt__msg[4].outport[3]=3'd5;
//     recv_wopt__msg[4].outport[4]=3'd0;
//     recv_wopt__msg[4].outport[5]=3'd0;
//     recv_wopt__msg[4].outport[6]=3'd0;
//     recv_wopt__msg[4].outport[7]=3'd0;
//     recv_wopt__msg[4].predicate_in=6'd0;

//     recv_wopt__msg[5].ctrl=6'd1;
//     recv_wopt__msg[5].predicate=1'd0;
//     recv_wopt__msg[5].fu_in[0]=3'd0;
//     recv_wopt__msg[5].fu_in[1]=3'd0;
//     recv_wopt__msg[5].fu_in[2]=3'd0;
//     recv_wopt__msg[5].fu_in[3]=3'd0;
//     recv_wopt__msg[5].outport[0]=3'd0;
//     recv_wopt__msg[5].outport[1]=3'd0;
//     recv_wopt__msg[5].outport[2]=3'd0;
//     recv_wopt__msg[5].outport[3]=3'd0;
//     recv_wopt__msg[5].outport[4]=3'd3;
//     recv_wopt__msg[5].outport[5]=3'd0;
//     recv_wopt__msg[5].outport[6]=3'd0;
//     recv_wopt__msg[5].outport[7]=3'd0;
//     recv_wopt__msg[5].predicate_in=6'd0;    

//     recv_wopt__msg[6].ctrl=6'd1;
//     recv_wopt__msg[6].predicate=1'd0;
//     recv_wopt__msg[6].fu_in[0]=3'd0;
//     recv_wopt__msg[6].fu_in[1]=3'd0;
//     recv_wopt__msg[6].fu_in[2]=3'd0;
//     recv_wopt__msg[6].fu_in[3]=3'd0;
//     recv_wopt__msg[6].outport[0]=3'd0;
//     recv_wopt__msg[6].outport[1]=3'd0;
//     recv_wopt__msg[6].outport[2]=3'd0;
//     recv_wopt__msg[6].outport[3]=3'd0;
//     recv_wopt__msg[6].outport[4]=3'd0;
//     recv_wopt__msg[6].outport[5]=3'd1;
//     recv_wopt__msg[6].outport[6]=3'd0;
//     recv_wopt__msg[6].outport[7]=3'd0;
//     recv_wopt__msg[6].predicate_in=6'd0;

//     recv_wopt__msg[7].ctrl=6'd1;
//     recv_wopt__msg[7].predicate=1'd0;
//     recv_wopt__msg[7].fu_in[0]=3'd0;
//     recv_wopt__msg[7].fu_in[1]=3'd0;
//     recv_wopt__msg[7].fu_in[2]=3'd0;
//     recv_wopt__msg[7].fu_in[3]=3'd0;
//     recv_wopt__msg[7].outport[0]=3'd0;
//     recv_wopt__msg[7].outport[1]=3'd0;
//     recv_wopt__msg[7].outport[2]=3'd0;
//     recv_wopt__msg[7].outport[3]=3'd0;
//     recv_wopt__msg[7].outport[4]=3'd0;
//     recv_wopt__msg[7].outport[5]=3'd0;
//     recv_wopt__msg[7].outport[6]=3'd0;
//     recv_wopt__msg[7].outport[7]=3'd0;
//     recv_wopt__msg[7].predicate_in=6'd0;   

//     recv_wopt__msg[8].ctrl=6'd1;
//     recv_wopt__msg[8].predicate=1'd0;
//     recv_wopt__msg[8].fu_in[0]=3'd0;
//     recv_wopt__msg[8].fu_in[1]=3'd0;
//     recv_wopt__msg[8].fu_in[2]=3'd0;
//     recv_wopt__msg[8].fu_in[3]=3'd0;
//     recv_wopt__msg[8].outport[0]=3'd0;
//     recv_wopt__msg[8].outport[1]=3'd0;
//     recv_wopt__msg[8].outport[2]=3'd0;
//     recv_wopt__msg[8].outport[3]=3'd0;
//     recv_wopt__msg[8].outport[4]=3'd4;
//     recv_wopt__msg[8].outport[5]=3'd0;
//     recv_wopt__msg[8].outport[6]=3'd0;
//     recv_wopt__msg[8].outport[7]=3'd0;
//     recv_wopt__msg[8].predicate_in=6'd0;

//     recv_wopt__msg[9].ctrl=6'h19;
//     recv_wopt__msg[9].predicate=1'd0;
//     recv_wopt__msg[9].fu_in[0]=3'd3;
//     recv_wopt__msg[9].fu_in[1]=3'd0;
//     recv_wopt__msg[9].fu_in[2]=3'd0;
//     recv_wopt__msg[9].fu_in[3]=3'd0;
//     recv_wopt__msg[9].outport[0]=3'd0;
//     recv_wopt__msg[9].outport[1]=3'd0;
//     recv_wopt__msg[9].outport[2]=3'd5;
//     recv_wopt__msg[9].outport[3]=3'd0;
//     recv_wopt__msg[9].outport[4]=3'd0;
//     recv_wopt__msg[9].outport[5]=3'd0;
//     recv_wopt__msg[9].outport[6]=3'd0;
//     recv_wopt__msg[9].outport[7]=3'd0;
//     recv_wopt__msg[9].predicate_in=6'd0;    

//     recv_wopt__msg[10].ctrl=6'h21;
//     recv_wopt__msg[10].predicate=1'd0;
//     recv_wopt__msg[10].fu_in[0]=3'd1;
//     recv_wopt__msg[10].fu_in[1]=3'd2;
//     recv_wopt__msg[10].fu_in[2]=3'd0;
//     recv_wopt__msg[10].fu_in[3]=3'd0;
//     recv_wopt__msg[10].outport[0]=3'd0;
//     recv_wopt__msg[10].outport[1]=3'd5;
//     recv_wopt__msg[10].outport[2]=3'd0;
//     recv_wopt__msg[10].outport[3]=3'd0;
//     recv_wopt__msg[10].outport[4]=3'd0;
//     recv_wopt__msg[10].outport[5]=3'd0;
//     recv_wopt__msg[10].outport[6]=3'd0;
//     recv_wopt__msg[10].outport[7]=3'd0;
//     recv_wopt__msg[10].predicate_in=6'd0;

//     recv_wopt__msg[11].ctrl=6'd1;
//     recv_wopt__msg[11].predicate=1'd0;
//     recv_wopt__msg[11].fu_in[0]=3'd0;
//     recv_wopt__msg[11].fu_in[1]=3'd0;
//     recv_wopt__msg[11].fu_in[2]=3'd0;
//     recv_wopt__msg[11].fu_in[3]=3'd0;
//     recv_wopt__msg[11].outport[0]=3'd0;
//     recv_wopt__msg[11].outport[1]=3'd0;
//     recv_wopt__msg[11].outport[2]=3'd0;
//     recv_wopt__msg[11].outport[3]=3'd0;
//     recv_wopt__msg[11].outport[4]=3'd0;
//     recv_wopt__msg[11].outport[5]=3'd0;
//     recv_wopt__msg[11].outport[6]=3'd0;
//     recv_wopt__msg[11].outport[7]=3'd0;
//     recv_wopt__msg[11].predicate_in=6'd0;   

//     recv_wopt__msg[12].ctrl=6'd1;
//     recv_wopt__msg[12].predicate=1'd0;
//     recv_wopt__msg[12].fu_in[0]=3'd0;
//     recv_wopt__msg[12].fu_in[1]=3'd0;
//     recv_wopt__msg[12].fu_in[2]=3'd0;
//     recv_wopt__msg[12].fu_in[3]=3'd0;
//     recv_wopt__msg[12].outport[0]=3'd0;
//     recv_wopt__msg[12].outport[1]=3'd0;
//     recv_wopt__msg[12].outport[2]=3'd0;
//     recv_wopt__msg[12].outport[3]=3'd0;
//     recv_wopt__msg[12].outport[4]=3'd0;
//     recv_wopt__msg[12].outport[5]=3'd0;
//     recv_wopt__msg[12].outport[6]=3'd0;
//     recv_wopt__msg[12].outport[7]=3'd0;
//     recv_wopt__msg[12].predicate_in=6'd0;

//     recv_wopt__msg[13].ctrl=6'd1;
//     recv_wopt__msg[13].predicate=1'd0;
//     recv_wopt__msg[13].fu_in[0]=3'd0;
//     recv_wopt__msg[13].fu_in[1]=3'd0;
//     recv_wopt__msg[13].fu_in[2]=3'd0;
//     recv_wopt__msg[13].fu_in[3]=3'd0;
//     recv_wopt__msg[13].outport[0]=3'd0;
//     recv_wopt__msg[13].outport[1]=3'd0;
//     recv_wopt__msg[13].outport[2]=3'd0;
//     recv_wopt__msg[13].outport[3]=3'd0;
//     recv_wopt__msg[13].outport[4]=3'd0;
//     recv_wopt__msg[13].outport[5]=3'd0;
//     recv_wopt__msg[13].outport[6]=3'd0;
//     recv_wopt__msg[13].outport[7]=3'd0;
//     recv_wopt__msg[13].predicate_in=6'd0;    

//     recv_wopt__msg[14].ctrl=6'd1;
//     recv_wopt__msg[14].predicate=1'd0;
//     recv_wopt__msg[14].fu_in[0]=3'd0;
//     recv_wopt__msg[14].fu_in[1]=3'd0;
//     recv_wopt__msg[14].fu_in[2]=3'd0;
//     recv_wopt__msg[14].fu_in[3]=3'd0;
//     recv_wopt__msg[14].outport[0]=3'd0;
//     recv_wopt__msg[14].outport[1]=3'd0;
//     recv_wopt__msg[14].outport[2]=3'd0;
//     recv_wopt__msg[14].outport[3]=3'd0;
//     recv_wopt__msg[14].outport[4]=3'd0;
//     recv_wopt__msg[14].outport[5]=3'd0;
//     recv_wopt__msg[14].outport[6]=3'd0;
//     recv_wopt__msg[14].outport[7]=3'd0;
//     recv_wopt__msg[14].predicate_in=6'd0;

//     recv_wopt__msg[15].ctrl=6'd1;
//     recv_wopt__msg[15].predicate=1'd0;
//     recv_wopt__msg[15].fu_in[0]=3'd0;
//     recv_wopt__msg[15].fu_in[1]=3'd0;
//     recv_wopt__msg[15].fu_in[2]=3'd0;
//     recv_wopt__msg[15].fu_in[3]=3'd0;
//     recv_wopt__msg[15].outport[0]=3'd0;
//     recv_wopt__msg[15].outport[1]=3'd0;
//     recv_wopt__msg[15].outport[2]=3'd0;
//     recv_wopt__msg[15].outport[3]=3'd0;
//     recv_wopt__msg[15].outport[4]=3'd0;
//     recv_wopt__msg[15].outport[5]=3'd0;
//     recv_wopt__msg[15].outport[6]=3'd0;
//     recv_wopt__msg[15].outport[7]=3'd0;
//     recv_wopt__msg[15].predicate_in=6'd0;  

// //last
//     #10;
//     for ( int i = 0; i < 16; i += 1 ) begin
//       recv_waddr__en[i] = 1'd1;
//       recv_waddr__msg[i] = 2'd3;
//     end
//     recv_wopt__msg[0].ctrl=6'd1;
//     recv_wopt__msg[0].predicate=1'd0;
//     recv_wopt__msg[0].fu_in[0]=3'd0;
//     recv_wopt__msg[0].fu_in[1]=3'd0;
//     recv_wopt__msg[0].fu_in[2]=3'd0;
//     recv_wopt__msg[0].fu_in[3]=3'd0;
//     recv_wopt__msg[0].outport[0]=3'd0;
//     recv_wopt__msg[0].outport[1]=3'd0;
//     recv_wopt__msg[0].outport[2]=3'd0;
//     recv_wopt__msg[0].outport[3]=3'd0;
//     recv_wopt__msg[0].outport[4]=3'd0;
//     recv_wopt__msg[0].outport[5]=3'd0;
//     recv_wopt__msg[0].outport[6]=3'd0;
//     recv_wopt__msg[0].outport[7]=3'd0;
//     recv_wopt__msg[0].predicate_in=6'd0;

//     recv_wopt__msg[1].ctrl=6'd1;
//     recv_wopt__msg[1].predicate=1'd0;
//     recv_wopt__msg[1].fu_in[0]=3'd0;
//     recv_wopt__msg[1].fu_in[1]=3'd0;
//     recv_wopt__msg[1].fu_in[2]=3'd0;
//     recv_wopt__msg[1].fu_in[3]=3'd0;
//     recv_wopt__msg[1].outport[0]=3'd0;
//     recv_wopt__msg[1].outport[1]=3'd0;
//     recv_wopt__msg[1].outport[2]=3'd0;
//     recv_wopt__msg[1].outport[3]=3'd0;
//     recv_wopt__msg[1].outport[4]=3'd0;
//     recv_wopt__msg[1].outport[5]=3'd0;
//     recv_wopt__msg[1].outport[6]=3'd0;
//     recv_wopt__msg[1].outport[7]=3'd0;
//     recv_wopt__msg[1].predicate_in=6'd0;    

//     recv_wopt__msg[2].ctrl=6'd1;
//     recv_wopt__msg[2].predicate=1'd0;
//     recv_wopt__msg[2].fu_in[0]=3'd0;
//     recv_wopt__msg[2].fu_in[1]=3'd0;
//     recv_wopt__msg[2].fu_in[2]=3'd0;
//     recv_wopt__msg[2].fu_in[3]=3'd0;
//     recv_wopt__msg[2].outport[0]=3'd0;
//     recv_wopt__msg[2].outport[1]=3'd0;
//     recv_wopt__msg[2].outport[2]=3'd0;
//     recv_wopt__msg[2].outport[3]=3'd0;
//     recv_wopt__msg[2].outport[4]=3'd0;
//     recv_wopt__msg[2].outport[5]=3'd0;
//     recv_wopt__msg[2].outport[6]=3'd0;
//     recv_wopt__msg[2].outport[7]=3'd0;
//     recv_wopt__msg[2].predicate_in=6'd0;

//     recv_wopt__msg[3].ctrl=6'd1;
//     recv_wopt__msg[3].predicate=1'd0;
//     recv_wopt__msg[3].fu_in[0]=3'd0;
//     recv_wopt__msg[3].fu_in[1]=3'd0;
//     recv_wopt__msg[3].fu_in[2]=3'd0;
//     recv_wopt__msg[3].fu_in[3]=3'd0;
//     recv_wopt__msg[3].outport[0]=3'd0;
//     recv_wopt__msg[3].outport[1]=3'd0;
//     recv_wopt__msg[3].outport[2]=3'd0;
//     recv_wopt__msg[3].outport[3]=3'd0;
//     recv_wopt__msg[3].outport[4]=3'd0;
//     recv_wopt__msg[3].outport[5]=3'd0;
//     recv_wopt__msg[3].outport[6]=3'd0;
//     recv_wopt__msg[3].outport[7]=3'd0;
//     recv_wopt__msg[3].predicate_in=6'd0;   

//     recv_wopt__msg[4].ctrl=6'd1;
//     recv_wopt__msg[4].predicate=1'd0;
//     recv_wopt__msg[4].fu_in[0]=3'd0;
//     recv_wopt__msg[4].fu_in[1]=3'd0;
//     recv_wopt__msg[4].fu_in[2]=3'd0;
//     recv_wopt__msg[4].fu_in[3]=3'd0;
//     recv_wopt__msg[4].outport[0]=3'd0;
//     recv_wopt__msg[4].outport[1]=3'd0;
//     recv_wopt__msg[4].outport[2]=3'd0;
//     recv_wopt__msg[4].outport[3]=3'd1;
//     recv_wopt__msg[4].outport[4]=3'd0;
//     recv_wopt__msg[4].outport[5]=3'd0;
//     recv_wopt__msg[4].outport[6]=3'd0;
//     recv_wopt__msg[4].outport[7]=3'd0;
//     recv_wopt__msg[4].predicate_in=6'd0;

//     recv_wopt__msg[5].ctrl=6'd7;
//     recv_wopt__msg[5].predicate=1'd0;
//     recv_wopt__msg[5].fu_in[0]=3'd1;
//     recv_wopt__msg[5].fu_in[1]=3'd2;
//     recv_wopt__msg[5].fu_in[2]=3'd0;
//     recv_wopt__msg[5].fu_in[3]=3'd0;
//     recv_wopt__msg[5].outport[0]=3'd5;
//     recv_wopt__msg[5].outport[1]=3'd0;
//     recv_wopt__msg[5].outport[2]=3'd0;
//     recv_wopt__msg[5].outport[3]=3'd0;
//     recv_wopt__msg[5].outport[4]=3'd0;
//     recv_wopt__msg[5].outport[5]=3'd0;
//     recv_wopt__msg[5].outport[6]=3'd0;
//     recv_wopt__msg[5].outport[7]=3'd0;
//     recv_wopt__msg[5].predicate_in=6'd0;    

//     recv_wopt__msg[6].ctrl=6'h10;
//     recv_wopt__msg[6].predicate=1'd0;
//     recv_wopt__msg[6].fu_in[0]=3'd2;
//     recv_wopt__msg[6].fu_in[1]=3'd0;
//     recv_wopt__msg[6].fu_in[2]=3'd0;
//     recv_wopt__msg[6].fu_in[3]=3'd0;
//     recv_wopt__msg[6].outport[0]=3'd5;
//     recv_wopt__msg[6].outport[1]=3'd0;
//     recv_wopt__msg[6].outport[2]=3'd0;
//     recv_wopt__msg[6].outport[3]=3'd0;
//     recv_wopt__msg[6].outport[4]=3'd0;
//     recv_wopt__msg[6].outport[5]=3'd0;
//     recv_wopt__msg[6].outport[6]=3'd0;
//     recv_wopt__msg[6].outport[7]=3'd0;
//     recv_wopt__msg[6].predicate_in=6'b000010;

//     recv_wopt__msg[7].ctrl=6'd1;
//     recv_wopt__msg[7].predicate=1'd0;
//     recv_wopt__msg[7].fu_in[0]=3'd0;
//     recv_wopt__msg[7].fu_in[1]=3'd0;
//     recv_wopt__msg[7].fu_in[2]=3'd0;
//     recv_wopt__msg[7].fu_in[3]=3'd0;
//     recv_wopt__msg[7].outport[0]=3'd0;
//     recv_wopt__msg[7].outport[1]=3'd0;
//     recv_wopt__msg[7].outport[2]=3'd0;
//     recv_wopt__msg[7].outport[3]=3'd0;
//     recv_wopt__msg[7].outport[4]=3'd0;
//     recv_wopt__msg[7].outport[5]=3'd0;
//     recv_wopt__msg[7].outport[6]=3'd0;
//     recv_wopt__msg[7].outport[7]=3'd0;
//     recv_wopt__msg[7].predicate_in=6'd0;   

//     recv_wopt__msg[8].ctrl=6'hc;
//     recv_wopt__msg[8].predicate=1'd0;
//     recv_wopt__msg[8].fu_in[0]=3'd1;
//     recv_wopt__msg[8].fu_in[1]=3'd2;
//     recv_wopt__msg[8].fu_in[2]=3'd0;
//     recv_wopt__msg[8].fu_in[3]=3'd0;
//     recv_wopt__msg[8].outport[0]=3'd0;
//     recv_wopt__msg[8].outport[1]=3'd5;
//     recv_wopt__msg[8].outport[2]=3'd0;
//     recv_wopt__msg[8].outport[3]=3'd0;
//     recv_wopt__msg[8].outport[4]=3'd0;
//     recv_wopt__msg[8].outport[5]=3'd0;
//     recv_wopt__msg[8].outport[6]=3'd0;
//     recv_wopt__msg[8].outport[7]=3'd0;
//     recv_wopt__msg[8].predicate_in=6'd0;

//     recv_wopt__msg[9].ctrl=6'd1;
//     recv_wopt__msg[9].predicate=1'd0;
//     recv_wopt__msg[9].fu_in[0]=3'd0;
//     recv_wopt__msg[9].fu_in[1]=3'd0;
//     recv_wopt__msg[9].fu_in[2]=3'd0;
//     recv_wopt__msg[9].fu_in[3]=3'd0;
//     recv_wopt__msg[9].outport[0]=3'd0;
//     recv_wopt__msg[9].outport[1]=3'd0;
//     recv_wopt__msg[9].outport[2]=3'd0;
//     recv_wopt__msg[9].outport[3]=3'd0;
//     recv_wopt__msg[9].outport[4]=3'd2;
//     recv_wopt__msg[9].outport[5]=3'd0;
//     recv_wopt__msg[9].outport[6]=3'd0;
//     recv_wopt__msg[9].outport[7]=3'd0;
//     recv_wopt__msg[9].predicate_in=6'd0;    

//     recv_wopt__msg[10].ctrl=6'd1;
//     recv_wopt__msg[10].predicate=1'd0;
//     recv_wopt__msg[10].fu_in[0]=3'd0;
//     recv_wopt__msg[10].fu_in[1]=3'd0;
//     recv_wopt__msg[10].fu_in[2]=3'd0;
//     recv_wopt__msg[10].fu_in[3]=3'd0;
//     recv_wopt__msg[10].outport[0]=3'd0;
//     recv_wopt__msg[10].outport[1]=3'd0;
//     recv_wopt__msg[10].outport[2]=3'd0;
//     recv_wopt__msg[10].outport[3]=3'd0;
//     recv_wopt__msg[10].outport[4]=3'd0;
//     recv_wopt__msg[10].outport[5]=3'd0;
//     recv_wopt__msg[10].outport[6]=3'd0;
//     recv_wopt__msg[10].outport[7]=3'd0;
//     recv_wopt__msg[10].predicate_in=6'b010000;

//     recv_wopt__msg[11].ctrl=6'd1;
//     recv_wopt__msg[11].predicate=1'd0;
//     recv_wopt__msg[11].fu_in[0]=3'd0;
//     recv_wopt__msg[11].fu_in[1]=3'd0;
//     recv_wopt__msg[11].fu_in[2]=3'd0;
//     recv_wopt__msg[11].fu_in[3]=3'd0;
//     recv_wopt__msg[11].outport[0]=3'd0;
//     recv_wopt__msg[11].outport[1]=3'd0;
//     recv_wopt__msg[11].outport[2]=3'd0;
//     recv_wopt__msg[11].outport[3]=3'd0;
//     recv_wopt__msg[11].outport[4]=3'd0;
//     recv_wopt__msg[11].outport[5]=3'd0;
//     recv_wopt__msg[11].outport[6]=3'd0;
//     recv_wopt__msg[11].outport[7]=3'd0;
//     recv_wopt__msg[11].predicate_in=6'd0;   

//     recv_wopt__msg[12].ctrl=6'd1;
//     recv_wopt__msg[12].predicate=1'd0;
//     recv_wopt__msg[12].fu_in[0]=3'd0;
//     recv_wopt__msg[12].fu_in[1]=3'd0;
//     recv_wopt__msg[12].fu_in[2]=3'd0;
//     recv_wopt__msg[12].fu_in[3]=3'd0;
//     recv_wopt__msg[12].outport[0]=3'd0;
//     recv_wopt__msg[12].outport[1]=3'd0;
//     recv_wopt__msg[12].outport[2]=3'd0;
//     recv_wopt__msg[12].outport[3]=3'd0;
//     recv_wopt__msg[12].outport[4]=3'd0;
//     recv_wopt__msg[12].outport[5]=3'd0;
//     recv_wopt__msg[12].outport[6]=3'd0;
//     recv_wopt__msg[12].outport[7]=3'd0;
//     recv_wopt__msg[12].predicate_in=6'd0;

//     recv_wopt__msg[13].ctrl=6'd1;
//     recv_wopt__msg[13].predicate=1'd0;
//     recv_wopt__msg[13].fu_in[0]=3'd0;
//     recv_wopt__msg[13].fu_in[1]=3'd0;
//     recv_wopt__msg[13].fu_in[2]=3'd0;
//     recv_wopt__msg[13].fu_in[3]=3'd0;
//     recv_wopt__msg[13].outport[0]=3'd0;
//     recv_wopt__msg[13].outport[1]=3'd0;
//     recv_wopt__msg[13].outport[2]=3'd0;
//     recv_wopt__msg[13].outport[3]=3'd0;
//     recv_wopt__msg[13].outport[4]=3'd0;
//     recv_wopt__msg[13].outport[5]=3'd0;
//     recv_wopt__msg[13].outport[6]=3'd0;
//     recv_wopt__msg[13].outport[7]=3'd0;
//     recv_wopt__msg[13].predicate_in=6'd0;    

//     recv_wopt__msg[14].ctrl=6'd1;
//     recv_wopt__msg[14].predicate=1'd0;
//     recv_wopt__msg[14].fu_in[0]=3'd0;
//     recv_wopt__msg[14].fu_in[1]=3'd0;
//     recv_wopt__msg[14].fu_in[2]=3'd0;
//     recv_wopt__msg[14].fu_in[3]=3'd0;
//     recv_wopt__msg[14].outport[0]=3'd0;
//     recv_wopt__msg[14].outport[1]=3'd0;
//     recv_wopt__msg[14].outport[2]=3'd0;
//     recv_wopt__msg[14].outport[3]=3'd0;
//     recv_wopt__msg[14].outport[4]=3'd0;
//     recv_wopt__msg[14].outport[5]=3'd0;
//     recv_wopt__msg[14].outport[6]=3'd0;
//     recv_wopt__msg[14].outport[7]=3'd0;
//     recv_wopt__msg[14].predicate_in=6'd0;

//     recv_wopt__msg[15].ctrl=6'd1;
//     recv_wopt__msg[15].predicate=1'd0;
//     recv_wopt__msg[15].fu_in[0]=3'd0;
//     recv_wopt__msg[15].fu_in[1]=3'd0;
//     recv_wopt__msg[15].fu_in[2]=3'd0;
//     recv_wopt__msg[15].fu_in[3]=3'd0;
//     recv_wopt__msg[15].outport[0]=3'd0;
//     recv_wopt__msg[15].outport[1]=3'd0;
//     recv_wopt__msg[15].outport[2]=3'd0;
//     recv_wopt__msg[15].outport[3]=3'd0;
//     recv_wopt__msg[15].outport[4]=3'd0;
//     recv_wopt__msg[15].outport[5]=3'd0;
//     recv_wopt__msg[15].outport[6]=3'd0;
//     recv_wopt__msg[15].outport[7]=3'd0;
//     recv_wopt__msg[15].predicate_in=6'd0;  
  end

  always
    begin
      clk <= 1; #5;
      clk <= 0; #5;
    end

endmodule : tb_cgra