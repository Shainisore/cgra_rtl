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

// PyMTL Component NormalQueueCtrlRTL Definition
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py

module NormalQueueCtrlRTL__num_entries_2
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] deq_en,
  output logic [0:0] deq_rdy,
  input logic [0:0] enq_en,
  output logic [0:0] enq_rdy,
  output logic [0:0] raddr,
  input logic [0:0] reset,
  output logic [0:0] waddr,
  output logic [0:0] wen
);
  localparam logic [0:0] last_idx = 1'd1;
  localparam logic [1:0] num_entries = 2'd2;
  logic [0:0] deq_xfer ;
  logic [0:0] enq_xfer ;
  logic [0:0] head ;
  logic [0:0] tail ;

  // PyMTL Lambda Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:86
  // s.deq_rdy //= lambda: ~s.reset & ( s.count > CountType(0) )
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_deq_rdy
    deq_rdy = ( ~reset ) & ( count > 2'd0 );
  end

  // PyMTL Lambda Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:89
  // s.deq_xfer //= lambda: s.deq_en & s.deq_rdy
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_deq_xfer
    deq_xfer = deq_en & deq_rdy;
  end

  // PyMTL Lambda Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:85
  // s.enq_rdy //= lambda: ~s.reset & ( s.count < s.num_entries )
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_enq_rdy
    enq_rdy = ( ~reset ) & ( count < num_entries );
  end

  // PyMTL Lambda Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:88
  // s.enq_xfer //= lambda: s.enq_en & s.enq_rdy
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_enq_xfer
    enq_xfer = enq_en & enq_rdy;
  end

  // PyMTL Update Block Source
  // At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:91
  // @s.update_ff
  // def up_reg():
  // 
  //   if s.reset:
  //     s.head  <<= PtrType(0)
  //     s.tail  <<= PtrType(0)
  //     s.count <<= CountType(0)
  // 
  //   else:
  //     if s.deq_xfer:
  //       s.head <<= s.head + PtrType(1) if s.head < s.last_idx else PtrType(0)
  // 
  //     if s.enq_xfer:
  //       s.tail <<= s.tail + PtrType(1) if s.tail < s.last_idx else PtrType(0)
  // 
  //     if s.enq_xfer & ~s.deq_xfer:
  //       s.count <<= s.count + CountType(1)
  //     if ~s.enq_xfer & s.deq_xfer:
  //       s.count <<= s.count - CountType(1)
  
  always_ff @(posedge clk) begin : up_reg
    if ( reset ) begin
      head <= 1'd0;
      tail <= 1'd0;
      count <= 2'd0;
    end
    else begin
      if ( deq_xfer ) begin
        head <= ( head < last_idx ) ? head + 1'd1 : 1'd0;
      end
      if ( enq_xfer ) begin
        tail <= ( tail < last_idx ) ? tail + 1'd1 : 1'd0;
      end
      if ( enq_xfer & ( ~deq_xfer ) ) begin
        count <= count + 2'd1;
      end
      if ( ( ~enq_xfer ) & deq_xfer ) begin
        count <= count - 2'd1;
      end
    end
  end

  assign wen = enq_xfer;
  assign waddr = tail;
  assign raddr = head;

endmodule





// PyMTL Component NormalQueueDpathRTL Definition
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py

module NormalQueueDpathRTL__EntryType_CGRAData_32_1_1__num_entries_2
(
  input logic [0:0] clk,
  output CGRAData_32_1_1 deq_ret,
  input CGRAData_32_1_1 enq_msg,
  input logic [0:0] raddr,
  input logic [0:0] reset,
  input logic [0:0] waddr,
  input logic [0:0] wen
);
  //-------------------------------------------------------------
  // Component queue
  //-------------------------------------------------------------

  logic [0:0] queue__clk ;
  logic [0:0] queue__raddr [0:0] ;
  CGRAData_32_1_1 queue__rdata [0:0] ;
  logic [0:0] queue__reset ;
  logic [0:0] queue__waddr [0:0] ;
  CGRAData_32_1_1 queue__wdata [0:0] ;
  logic [0:0] queue__wen [0:0] ;

  RegisterFile__e355018d318c7c45 queue
  (
    .clk( queue__clk ),
    .raddr( queue__raddr ),
    .rdata( queue__rdata ),
    .reset( queue__reset ),
    .waddr( queue__waddr ),
    .wdata( queue__wdata ),
    .wen( queue__wen )
  );

  //-------------------------------------------------------------
  // End of component queue
  //-------------------------------------------------------------

  assign queue__clk = clk;
  assign queue__reset = reset;
  assign queue__raddr[0] = raddr;
  assign deq_ret = queue__rdata[0];
  assign queue__wen[0] = wen;
  assign queue__waddr[0] = waddr;
  assign queue__wdata[0] = enq_msg;

endmodule


// PyMTL Component NormalQueueRTL Definition
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py

module NormalQueueRTL__EntryType_CGRAData_32_1_1__num_entries_2
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] reset,
  input logic [0:0] deq__en,
  output logic [0:0] deq__rdy,
  output CGRAData_32_1_1 deq__ret,
  input logic [0:0] enq__en,
  input CGRAData_32_1_1 enq__msg,
  output logic [0:0] enq__rdy
);
  //-------------------------------------------------------------
  // Component ctrl
  //-------------------------------------------------------------

  logic [0:0] ctrl__clk ;
  logic [1:0] ctrl__count ;
  logic [0:0] ctrl__deq_en ;
  logic [0:0] ctrl__deq_rdy ;
  logic [0:0] ctrl__enq_en ;
  logic [0:0] ctrl__enq_rdy ;
  logic [0:0] ctrl__raddr ;
  logic [0:0] ctrl__reset ;
  logic [0:0] ctrl__waddr ;
  logic [0:0] ctrl__wen ;

  NormalQueueCtrlRTL__num_entries_2 ctrl
  (
    .clk( ctrl__clk ),
    .count( ctrl__count ),
    .deq_en( ctrl__deq_en ),
    .deq_rdy( ctrl__deq_rdy ),
    .enq_en( ctrl__enq_en ),
    .enq_rdy( ctrl__enq_rdy ),
    .raddr( ctrl__raddr ),
    .reset( ctrl__reset ),
    .waddr( ctrl__waddr ),
    .wen( ctrl__wen )
  );

  //-------------------------------------------------------------
  // End of component ctrl
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component dpath
  //-------------------------------------------------------------

  logic [0:0] dpath__clk ;
  CGRAData_32_1_1 dpath__deq_ret ;
  CGRAData_32_1_1 dpath__enq_msg ;
  logic [0:0] dpath__raddr ;
  logic [0:0] dpath__reset ;
  logic [0:0] dpath__waddr ;
  logic [0:0] dpath__wen ;

  NormalQueueDpathRTL__EntryType_CGRAData_32_1_1__num_entries_2 dpath
  (
    .clk( dpath__clk ),
    .deq_ret( dpath__deq_ret ),
    .enq_msg( dpath__enq_msg ),
    .raddr( dpath__raddr ),
    .reset( dpath__reset ),
    .waddr( dpath__waddr ),
    .wen( dpath__wen )
  );

  //-------------------------------------------------------------
  // End of component dpath
  //-------------------------------------------------------------

  assign ctrl__clk = clk;
  assign ctrl__reset = reset;
  assign dpath__clk = clk;
  assign dpath__reset = reset;
  assign dpath__wen = ctrl__wen;
  assign dpath__waddr = ctrl__waddr;
  assign dpath__raddr = ctrl__raddr;
  assign ctrl__enq_en = enq__en;
  assign enq__rdy = ctrl__enq_rdy;
  assign ctrl__deq_en = deq__en;
  assign deq__rdy = ctrl__deq_rdy;
  assign count = ctrl__count;
  assign dpath__enq_msg = enq__msg;
  assign deq__ret = dpath__deq_ret;

endmodule


// PyMTL Component ChannelRTL Definition
// At /home/kevin/Desktop/final_test/noc/ChannelRTL.py

module ChannelRTL__DataType_CGRAData_32_1_1__latency_1
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] reset,
  input logic [0:0] recv__en,
  input CGRAData_32_1_1 recv__msg,
  output logic [0:0] recv__rdy,
  output logic [0:0] send__en,
  output CGRAData_32_1_1 send__msg,
  input logic [0:0] send__rdy
);
  localparam CGRAData_32_1_1 data = { 32'd0, 1'd0, 1'd0 };
  localparam logic [31:0] latency = 32'd1;
  //-------------------------------------------------------------
  // Component queues[0:0]
  //-------------------------------------------------------------

  logic [0:0] queues__clk [0:0] ;
  logic [1:0] queues__count [0:0] ;
  logic [0:0] queues__reset [0:0] ;
  logic [0:0] queues__deq__en [0:0] ;
  logic [0:0] queues__deq__rdy [0:0] ;
  CGRAData_32_1_1 queues__deq__ret [0:0] ;
  logic [0:0] queues__enq__en [0:0] ;
  CGRAData_32_1_1 queues__enq__msg [0:0] ;
  logic [0:0] queues__enq__rdy [0:0] ;

  NormalQueueRTL__EntryType_CGRAData_32_1_1__num_entries_2 queues__0
  (
    .clk( queues__clk[0] ),
    .count( queues__count[0] ),
    .reset( queues__reset[0] ),
    .deq__en( queues__deq__en[0] ),
    .deq__rdy( queues__deq__rdy[0] ),
    .deq__ret( queues__deq__ret[0] ),
    .enq__en( queues__enq__en[0] ),
    .enq__msg( queues__enq__msg[0] ),
    .enq__rdy( queues__enq__rdy[0] )
  );
  
  always_comb begin : process
    if ( recv__msg.bypass == 1'd0 ) begin
      recv__rdy = queues__enq__rdy[0];
      queues__enq__msg[0] = recv__msg;
      queues__enq__en[0] = recv__en && queues__enq__rdy[0];
      for ( int i = 0; i < latency - 1; i += 1 ) begin
        queues__enq__msg[i + 1] = queues__deq__ret[i];
        queues__enq__en[i + 1] = queues__deq__rdy[i] && queues__enq__rdy[i + 1];
        queues__deq__en[i] = queues__enq__en[i + 1];
      end
      send__msg = queues__deq__ret[latency - 1];
      send__en = send__rdy && queues__deq__rdy[latency - 1];
      queues__deq__en[latency - 1] = send__en;
    end
    else begin
      send__msg = data;
      send__msg.payload = recv__msg.payload;
      send__msg.predicate = recv__msg.predicate;
      //send__msg.bypass = 1'd0;
      send__msg.bypass = 1'd1;
      send__en = send__rdy && recv__en;
      recv__rdy = send__rdy;
    end
  end

  assign queues__clk[0] = clk;
  assign queues__reset[0] = reset;
  assign count = queues__count[0];

endmodule



// PyMTL Component NormalQueueDpathRTL Definition
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py

module NormalQueueDpathRTL__EntryType_CGRAData_1_1__num_entries_2
(
  input logic [0:0] clk,
  output CGRAData_1_1 deq_ret,
  input CGRAData_1_1 enq_msg,
  input logic [0:0] raddr,
  input logic [0:0] reset,
  input logic [0:0] waddr,
  input logic [0:0] wen
);
  //-------------------------------------------------------------
  // Component queue
  //-------------------------------------------------------------

  logic [0:0] queue__clk ;
  logic [0:0] queue__raddr [0:0] ;
  CGRAData_1_1 queue__rdata [0:0] ;
  logic [0:0] queue__reset ;
  logic [0:0] queue__waddr [0:0] ;
  CGRAData_1_1 queue__wdata [0:0] ;
  logic [0:0] queue__wen [0:0] ;

  RegisterFile__b2651f5e70154f41 queue
  (
    .clk( queue__clk ),
    .raddr( queue__raddr ),
    .rdata( queue__rdata ),
    .reset( queue__reset ),
    .waddr( queue__waddr ),
    .wdata( queue__wdata ),
    .wen( queue__wen )
  );

  //-------------------------------------------------------------
  // End of component queue
  //-------------------------------------------------------------

  assign queue__clk = clk;
  assign queue__reset = reset;
  assign queue__raddr[0] = raddr;
  assign deq_ret = queue__rdata[0];
  assign queue__wen[0] = wen;
  assign queue__waddr[0] = waddr;
  assign queue__wdata[0] = enq_msg;

endmodule


// PyMTL Component NormalQueueRTL Definition
// At /home/kevin/virtual_env/venv_with_python3.7/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py

module NormalQueueRTL__EntryType_CGRAData_1_1__num_entries_2
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] reset,
  input logic [0:0] deq__en,
  output logic [0:0] deq__rdy,
  output CGRAData_1_1 deq__ret,
  input logic [0:0] enq__en,
  input CGRAData_1_1 enq__msg,
  output logic [0:0] enq__rdy
);
  //-------------------------------------------------------------
  // Component ctrl
  //-------------------------------------------------------------

  logic [0:0] ctrl__clk ;
  logic [1:0] ctrl__count ;
  logic [0:0] ctrl__deq_en ;
  logic [0:0] ctrl__deq_rdy ;
  logic [0:0] ctrl__enq_en ;
  logic [0:0] ctrl__enq_rdy ;
  logic [0:0] ctrl__raddr ;
  logic [0:0] ctrl__reset ;
  logic [0:0] ctrl__waddr ;
  logic [0:0] ctrl__wen ;

  NormalQueueCtrlRTL__num_entries_2 ctrl
  (
    .clk( ctrl__clk ),
    .count( ctrl__count ),
    .deq_en( ctrl__deq_en ),
    .deq_rdy( ctrl__deq_rdy ),
    .enq_en( ctrl__enq_en ),
    .enq_rdy( ctrl__enq_rdy ),
    .raddr( ctrl__raddr ),
    .reset( ctrl__reset ),
    .waddr( ctrl__waddr ),
    .wen( ctrl__wen )
  );

  //-------------------------------------------------------------
  // End of component ctrl
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component dpath
  //-------------------------------------------------------------

  logic [0:0] dpath__clk ;
  CGRAData_1_1 dpath__deq_ret ;
  CGRAData_1_1 dpath__enq_msg ;
  logic [0:0] dpath__raddr ;
  logic [0:0] dpath__reset ;
  logic [0:0] dpath__waddr ;
  logic [0:0] dpath__wen ;

  NormalQueueDpathRTL__EntryType_CGRAData_1_1__num_entries_2 dpath
  (
    .clk( dpath__clk ),
    .deq_ret( dpath__deq_ret ),
    .enq_msg( dpath__enq_msg ),
    .raddr( dpath__raddr ),
    .reset( dpath__reset ),
    .waddr( dpath__waddr ),
    .wen( dpath__wen )
  );

  //-------------------------------------------------------------
  // End of component dpath
  //-------------------------------------------------------------

  assign ctrl__clk = clk;
  assign ctrl__reset = reset;
  assign dpath__clk = clk;
  assign dpath__reset = reset;
  assign dpath__wen = ctrl__wen;
  assign dpath__waddr = ctrl__waddr;
  assign dpath__raddr = ctrl__raddr;
  assign ctrl__enq_en = enq__en;
  assign enq__rdy = ctrl__enq_rdy;
  assign ctrl__deq_en = deq__en;
  assign deq__rdy = ctrl__deq_rdy;
  assign count = ctrl__count;
  assign dpath__enq_msg = enq__msg;
  assign deq__ret = dpath__deq_ret;

endmodule


// PyMTL Component RegisterRTL Definition
// At /home/kevin/Desktop/final_test/rf/RegisterRTL.py

module RegisterRTL__DataType_CGRAData_1_1__latency_1
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv__en,
  input CGRAData_1_1 recv__msg,
  output logic [0:0] recv__rdy,
  output logic [0:0] send__en,
  output CGRAData_1_1 send__msg,
  input logic [0:0] send__rdy
);
  localparam logic [31:0] latency = 32'd1;
  //-------------------------------------------------------------
  // Component queues[0:0]
  //-------------------------------------------------------------

  logic [0:0] queues__clk [0:0] ;
  logic [1:0] queues__count [0:0] ;
  logic [0:0] queues__reset [0:0] ;
  logic [0:0] queues__deq__en [0:0] ;
  logic [0:0] queues__deq__rdy [0:0] ;
  CGRAData_1_1 queues__deq__ret [0:0] ;
  logic [0:0] queues__enq__en [0:0] ;
  CGRAData_1_1 queues__enq__msg [0:0] ;
  logic [0:0] queues__enq__rdy [0:0] ;

  NormalQueueRTL__EntryType_CGRAData_1_1__num_entries_2 queues__0
  (
    .clk( queues__clk[0] ),
    .count( queues__count[0] ),
    .reset( queues__reset[0] ),
    .deq__en( queues__deq__en[0] ),
    .deq__rdy( queues__deq__rdy[0] ),
    .deq__ret( queues__deq__ret[0] ),
    .enq__en( queues__enq__en[0] ),
    .enq__msg( queues__enq__msg[0] ),
    .enq__rdy( queues__enq__rdy[0] )
  );

  //-------------------------------------------------------------
  // End of component queues[0:0]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /home/kevin/Desktop/final_test/rf/RegisterRTL.py:30
  //   @s.update
  //   def process():
  //     s.recv.rdy = s.queues[0].enq.rdy
  //     s.queues[0].enq.msg = s.recv.msg
  //     s.queues[0].enq.en  = s.recv.en and s.queues[0].enq.rdy
  //     for i in range(s.latency - 1):
  //       s.queues[i+1].enq.msg = s.queues[i].deq.ret
  //       s.queues[i+1].enq.en  = s.queues[i].deq.rdy and s.queues[i+1].enq.rdy
  //       s.queues[i].deq.en    = s.queues[i+1].enq.en
  // 
  //     s.send.msg  = s.queues[s.latency-1].deq.ret
  //     s.send.en   = s.send.rdy and s.queues[s.latency-1].deq.rdy
  //     s.queues[s.latency-1].deq.en   = s.send.en
  
  always_comb begin : process
    recv__rdy = queues__enq__rdy[0];
    queues__enq__msg[0] = recv__msg;
    queues__enq__en[0] = recv__en && queues__enq__rdy[0];
    for ( int i = 0; i < latency - 1; i += 1 ) begin
      queues__enq__msg[i + 1] = queues__deq__ret[i];
      queues__enq__en[i + 1] = queues__deq__rdy[i] && queues__enq__rdy[i + 1];
      queues__deq__en[i] = queues__enq__en[i + 1];
    end
    send__msg = queues__deq__ret[latency - 1];
    send__en = send__rdy && queues__deq__rdy[latency - 1];
    queues__deq__en[latency - 1] = send__en;
  end

  assign queues__clk[0] = clk;
  assign queues__reset[0] = reset;

endmodule