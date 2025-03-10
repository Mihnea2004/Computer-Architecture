module counter #(
  parameter LATIME = 4,
  parameter VAL_INIT = {LATIME{1'b0}}
)(
  input clk, rst_b, c_up, clr,
  output reg [LATIME-1:0] q
);

always @(posedge clk, negedge rst_b) begin
  if(rst_b == 0) q <= VAL_INIT; //rst e activ pe 0, aduce iesirea la val initiala
  else if(clr == 1) q <= VAL_INIT; //prioritate mai mare, inversez if-urile
  else if(c_up == 1) q = q + 1;
    end
endmodule

module counter_tb;
  reg clk, rst_b, c_up, clr;
  wire [7:0] q;
  
  counter #(
    .LATIME(8), .VAL_INIT(8'hff)
  )counter1(
    .clk(clk), .rst_b(rst_b), .c_up(c_up), .clr(clr), .q(q)
  );
  
  integer i;
  initial begin
    clk = 0;
    rst_b = 0;
    c_up = 1;
    clr = 0;
  end
  
  initial begin
    for(i = 1; i <= 14; i = i + 1) begin
      #50; clk = ~clk;
    end
  end
  
  initial begin
    #5; rst_b = ~rst_b;
  end
  
  initial begin
    #425; c_up = ~c_up;
    #100; clr = ~clr;
  end
  
  initial begin
    #225; clr = ~clr;
    #100; c_up = ~c_up;
  end
  
endmodule
    