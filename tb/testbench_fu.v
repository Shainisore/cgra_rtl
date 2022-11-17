// typedef struct packed {
//   logic [5:0] ctrl ;
//   logic [0:0] predicate ;
//   logic [3:0][2:0] fu_in ;
//   logic [7:0][2:0] outport ;
//   logic [5:0][0:0] predicate_in ;
// } CGRAConfig_6_4_6_8;

// // PyMTL BitStruct CGRAData_32_1_1 Definition
// // At BitStruct CGRAData_32_1_1
// typedef struct packed {
//   logic [31:0] payload ;
//   logic [0:0] predicate ;
//   logic [0:0] bypass ;
// } CGRAData_32_1_1;

// // PyMTL BitStruct CGRAData_1_1 Definition
// // At BitStruct CGRAData_1_1
// typedef struct packed {
//   logic [0:0] payload ;
//   logic [0:0] predicate ;
// } CGRAData_1_1;
// module tb;
  
//   logic [0:0] clk;
//   logic [0:0] reset;
//   logic [0:0] recv_waddr__en [0:15];
//   logic [1:0] recv_waddr__msg [0:15];
//   logic [0:0] recv_waddr__rdy [0:15];
//   logic [0:0] recv_wopt__en [0:15];
//   CGRAConfig_6_4_6_8 recv_wopt__msg [0:15];
//   logic [0:0] recv_wopt__rdy [0:15];

//   top dut (
// 	  .clk(clk),
// 	  .reset(reset),
// 	  .recv_waddr__en(recv_waddr__en),
// 	  .recv_waddr__msg(recv_waddr__msg),
// 	  .recv_waddr__rdy(recv_waddr__rdy),
// 	  .recv_wopt__en(recv_wopt__en),
// 	  .recv_wopt__msg(recv_wopt__msg),
// 	  .recv_wopt__rdy(recv_wopt__rdy)
//   );


//   assign dut.tile__5.element__recv_const__msg = {32'd10, 1'd1, 1'd0};
//   assign dut.tile__9.element__recv_const__msg = {32'd0, 1'd1, 1'd0};

//   assign dut.tile__6.element__recv_const__msg = {32'd1, 1'd1, 1'd0};
//   assign dut.tile__10.element__recv_const__msg = {32'd3, 1'd1, 1'd0};

//  initial begin
//     reset <= 1; #10;
//     reset <= 0; #10;
//     reset <= 1;


//     for ( int i = 0; i < 100; i += 1 ) begin
//       dut.data_mem.reg_file.regs[i].payload = 32'd5;
//       dut.data_mem.reg_file.regs[i].predicate = 1'd1;
//       dut.data_mem.reg_file.regs[i].bypass = 1'd0;
//     end


//     for ( int i = 0; i < 16; i += 1 ) begin
//       recv_waddr__en[i] = 1'd1;
//       recv_waddr__msg[i] = 2'd0;
//       recv_wopt__en[i] = 1'd1;
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
//     recv_wopt__msg[5].outport[0]=3'd4;
//     recv_wopt__msg[5].outport[1]=3'd0;
//     recv_wopt__msg[5].outport[2]=3'd0;
//     recv_wopt__msg[5].outport[3]=3'd0;
//     recv_wopt__msg[5].outport[4]=3'd0;
//     recv_wopt__msg[5].outport[5]=3'd3;
//     recv_wopt__msg[5].outport[6]=3'd4;
//     recv_wopt__msg[5].outport[7]=3'd0;
//     recv_wopt__msg[5].predicate_in=6'd0;    

//     recv_wopt__msg[6].ctrl=6'h20;
//     recv_wopt__msg[6].predicate=1'd1;
//     recv_wopt__msg[6].fu_in[0]=3'd1;
//     recv_wopt__msg[6].fu_in[1]=3'd2;
//     recv_wopt__msg[6].fu_in[2]=3'd0;
//     recv_wopt__msg[6].fu_in[3]=3'd0;
//     recv_wopt__msg[6].outport[0]=3'd0;
//     recv_wopt__msg[6].outport[1]=3'd0;
//     recv_wopt__msg[6].outport[2]=3'd5;
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

//     recv_wopt__msg[9].ctrl=6'd2;
//     recv_wopt__msg[9].predicate=1'd0;
//     recv_wopt__msg[9].fu_in[0]=3'd1;
//     recv_wopt__msg[9].fu_in[1]=3'd2;
//     recv_wopt__msg[9].fu_in[2]=3'd0;
//     recv_wopt__msg[9].fu_in[3]=3'd0;
//     recv_wopt__msg[9].outport[0]=3'd0;
//     recv_wopt__msg[9].outport[1]=3'd0;
//     recv_wopt__msg[9].outport[2]=3'd0;
//     recv_wopt__msg[9].outport[3]=3'd5;
//     recv_wopt__msg[9].outport[4]=3'd0;
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
//     recv_wopt__msg[10].outport[4]=3'd3;
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
//   end

//   always
//     begin
//       clk <= 1; #5;
//       clk <= 0; #5;
//     end

// endmodule : tb


// typedef struct packed {
//   logic [5:0] ctrl ;
//   logic [0:0] predicate ;
//   logic [3:0][2:0] fu_in ;
//   logic [7:0][2:0] outport ;
//   logic [5:0][0:0] predicate_in ;
// } CGRAConfig_6_4_6_8;

// // PyMTL BitStruct CGRAData_32_1_1 Definition
// // At BitStruct CGRAData_32_1_1
// typedef struct packed {
//   logic [31:0] payload ;
//   logic [0:0] predicate ;
//   logic [0:0] bypass ;
// } CGRAData_32_1_1;

// // PyMTL BitStruct CGRAData_1_1 Definition
// // At BitStruct CGRAData_1_1
// typedef struct packed {
//   logic [0:0] payload ;
//   logic [0:0] predicate ;
// } CGRAData_1_1;

// module tb;

//   logic [0:0] clk;
//   logic [0:0] reset;
//   logic [0:0] recv_data__en [0:5];
//   CGRAData_32_1_1 recv_data__msg [0:5];
//   logic [0:0] recv_data__rdy [0:5];
//   logic [0:0] recv_opt__en;
//   CGRAConfig_6_4_6_8 recv_opt__msg;
//   logic [0:0] recv_opt__rdy;
//   logic [0:0] send_data__en [0:7];
//   CGRAData_32_1_1 send_data__msg [0:7];
//   logic [0:0] send_data__rdy [0:7];
//   logic [0:0] send_predicate__en;
//   CGRAData_1_1 send_predicate__msg;
//   logic [0:0] send_predicate__rdy;

//   CrossbarRTL__20918f721d5f331c dut (
//     .clk(clk),
//     .reset(reset),
//     .recv_data__en(recv_data__en),
//     .recv_data__msg(recv_data__msg),
//     .recv_data__rdy(recv_data__rdy),
//     .recv_opt__en(recv_opt__en),
//     .recv_opt__msg(recv_opt__msg),
//     .recv_opt__rdy(recv_opt__rdy),
//     .send_data__en(send_data__en),
//     .send_data__msg(send_data__msg),
//     .send_data__rdy(send_data__rdy),
//     .send_predicate__en(send_predicate__en),
//     .send_predicate__msg(send_predicate__msg),
//     .send_predicate__rdy(send_predicate__rdy)
//   );

//   initial begin
//     reset <= 1; #10;
//     reset <= 0; #10;
//     reset <= 1;

//     recv_data__en = {1'd0,1'd0,1'd0,1'd0,1'd1,1'd0};
//     recv_data__msg = {
//       {32'haaaaaaaa, 1'd1,1'd1},
//       {32'hbbbbbbbb, 1'd1,1'd1},
//       {32'hcccccccc, 1'd1,1'd1},
//       {32'hdddddddd, 1'd1,1'd1},
//       {32'heeeeeeee, 1'd1,1'd1},
//       {32'hffffffff, 1'd1,1'd1}};

//     recv_opt__msg.ctrl=6'h20;
//     recv_opt__msg.predicate=1'd1;
//     recv_opt__msg.fu_in[0]=3'd1;
//     recv_opt__msg.fu_in[1]=3'd2;
//     recv_opt__msg.fu_in[2]=3'd0;
//     recv_opt__msg.fu_in[3]=3'd0;
//     recv_opt__msg.outport[0]=3'd0;
//     recv_opt__msg.outport[1]=3'd0;
//     recv_opt__msg.outport[2]=3'd5;
//     recv_opt__msg.outport[3]=3'd0;
//     recv_opt__msg.outport[4]=3'd5;
//     recv_opt__msg.outport[5]=3'd0;
//     recv_opt__msg.outport[6]=3'd0;
//     recv_opt__msg.outport[7]=3'd0;
//     recv_opt__msg.predicate_in=6'd0;
//     recv_opt__en = 1'b1;

//     send_data__rdy = {1'd0,1'd0,1'd1,1'd0,1'd1,1'd0,1'd0,1'd0};
//     send_predicate__rdy = 1'b1;
//   end

//   always
//     begin
//       clk <= 1; #5;
//       clk <= 0; #5;
//     end

// endmodule : tb

// typedef struct packed {
//   logic [5:0] ctrl ;
//   logic [0:0] predicate ;
//   logic [3:0][2:0] fu_in ;
//   logic [7:0][2:0] outport ;
//   logic [5:0][0:0] predicate_in ;
// } CGRAConfig_6_4_6_8;

// // PyMTL BitStruct CGRAData_32_1_1 Definition
// // At BitStruct CGRAData_32_1_1
// typedef struct packed {
//   logic [31:0] payload ;
//   logic [0:0] predicate ;
//   logic [0:0] bypass ;
// } CGRAData_32_1_1;

// // PyMTL BitStruct CGRAData_1_1 Definition
// // At BitStruct CGRAData_1_1
// typedef struct packed {
//   logic [0:0] payload ;
//   logic [0:0] predicate ;
// } CGRAData_1_1;

// module tb;

// logic [0:0] clk;
// logic [1:0] count;
// logic [0:0] reset;
// logic [0:0] recv__en;
// CGRAData_32_1_1 recv__msg;
// logic [0:0] recv__rdy;
// logic [0:0] send__en;
// CGRAData_32_1_1 send__msg;
// logic [0:0] send__rdy;

//   ChannelRTL__DataType_CGRAData_32_1_1__latency_1 dut (
//     .clk(clk),
//     .count(count),
//     .reset(reset),
//     .recv__en(recv__en),
//     .recv__msg(recv__msg),
//     .recv__rdy(recv__rdy),
//     .send__en(send__en),
//     .send__msg(send__msg),
//     .send__rdy(send__rdy)
//   );

//   initial begin
//     reset <= 1; #10;
//     reset <= 0; #10;
//     reset <= 1;

//     recv__en = 1'd1;
//     recv__msg = {32'hECEBECEB, 1'd1,1'd1};
//     send__rdy = 1'd1;

//     #10;
//     recv__en = 1'd1;
//     recv__msg = {32'hAAAAAAAA, 1'd1,1'd1};
//     send__rdy = 1'd1;
//   end

//   always
//     begin
//       clk <= 1; #5;
//       clk <= 0; #5;
//     end

// endmodule : tb


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

module tb_fu;

  logic [0:0] clk;
  logic [1:0] recv_in_count [0:3];
  logic [0:0] reset;
  logic [0:0] from_mem_rdata__en [0:5];
  CGRAData_32_1_1 from_mem_rdata__msg [0:5];
  logic [0:0] from_mem_rdata__rdy [0:5];
  logic [0:0] recv_const__en;
  CGRAData_32_1_1 recv_const__msg;
  logic [0:0] recv_const__rdy;
  logic [0:0] recv_in__en [0:3];
  CGRAData_32_1_1 recv_in__msg [0:3];
  logic [0:0] recv_in__rdy [0:3];
  logic [0:0] recv_opt__en;
  CGRAConfig_6_4_6_8 recv_opt__msg;
  logic [0:0] recv_opt__rdy;
  logic [0:0] recv_predicate__en;
  CGRAData_1_1 recv_predicate__msg;
  logic [0:0] recv_predicate__rdy;
  logic [0:0] send_out__en [0:1];
  CGRAData_32_1_1 send_out__msg [0:1];
  logic [0:0] send_out__rdy [0:1];
  logic [0:0] to_mem_raddr__en [0:5];
  logic [6:0] to_mem_raddr__msg [0:5];
  logic [0:0] to_mem_raddr__rdy [0:5];
  logic [0:0] to_mem_waddr__en [0:5];
  logic [6:0] to_mem_waddr__msg [0:5];
  logic [0:0] to_mem_waddr__rdy [0:5];
  logic [0:0] to_mem_wdata__en [0:5];
  CGRAData_32_1_1 to_mem_wdata__msg [0:5];
  logic [0:0] to_mem_wdata__rdy [0:5];

  FlexibleFuRTL__4b859bce6db41c85 dut (
    .clk(clk ),
    .recv_in_count(recv_in_count ),
    .reset(reset ),
    .from_mem_rdata__en(from_mem_rdata__en ),
    .from_mem_rdata__msg(from_mem_rdata__msg ),
    .from_mem_rdata__rdy(from_mem_rdata__rdy ),
    .recv_const__en(recv_const__en ),
    .recv_const__msg(recv_const__msg ),
    .recv_const__rdy(recv_const__rdy ),
    .recv_in__en(recv_in__en ),
    .recv_in__msg(recv_in__msg ),
    .recv_in__rdy(recv_in__rdy ),
    .recv_opt__en(recv_opt__en ),
    .recv_opt__msg(recv_opt__msg ),
    .recv_opt__rdy(recv_opt__rdy ),
    .recv_predicate__en(recv_predicate__en ),
    .recv_predicate__msg(recv_predicate__msg ),
    .recv_predicate__rdy(recv_predicate__rdy ),
    .send_out__en(send_out__en ),
    .send_out__msg(send_out__msg ),
    .send_out__rdy(send_out__rdy ),
    .to_mem_raddr__en(to_mem_raddr__en ),
    .to_mem_raddr__msg(to_mem_raddr__msg ),
    .to_mem_raddr__rdy(to_mem_raddr__rdy ),
    .to_mem_waddr__en(to_mem_waddr__en ),
    .to_mem_waddr__msg(to_mem_waddr__msg ),
    .to_mem_waddr__rdy(to_mem_waddr__rdy ),
    .to_mem_wdata__en(to_mem_wdata__en ),
    .to_mem_wdata__msg(to_mem_wdata__msg ),
    .to_mem_wdata__rdy(to_mem_wdata__rdy )
  );

  initial begin
    reset <= 1; #10;
    reset <= 0; #10;
    reset <= 1;

    //fron channel
    recv_in_count = {2'b0, 2'b0, 2'b0, 2'b0};

    //constant msg ports
    recv_const__en  = {1'd1,1'd1,1'd1,1'd1};
    recv_const__msg = {
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1}};

    //recv_msg 
    recv_in__en = {1'd1,1'd1,1'd1,1'd1};
    recv_in__msg = {
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1},
      {32'hECEBECEB, 1'd1,1'd1}};

    //control signals
    recv_opt__en = 1'd1;
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

    //predicate_register
    recv_predicate__en = 1'd1;
    recv_predicate__msg = {1'b1, 1'b1}; 

    send_out__rdy = {1'b1, 1'b1}; 

    //from data_mem
    // from_mem_rdata__en
    // from_mem_rdata__msg
    // to_mem_raddr__rdy
    // to_mem_waddr__rdy
    // to_mem_wdata__rdy


  end

  always
    begin
      clk <= 1; #5;
      clk <= 0; #5;
    end

endmodule : tb_fu