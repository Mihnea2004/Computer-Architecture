module sadd(
  input clk, rst_b, x, y,
  output reg s
);

reg st, st_next;
localparam s0 = 1'd0;
localparam s1 = 1'd1;

always @(*) begin
  case (st)
    s0: if(x == 1 && y == 1) st_next = s1; else  st_next = s0;
    s1: if(x == 0 && y == 0) st_next = s0; else  st_next = s1;
  endcase
end

always @(*) begin
  s = 0;
  case (st) 
    s0: if(x + y == 1) s = 1; else s = 1; //efectiv te uiti pe sageata si vezi cand e output-ul s = 0
    s1: if(x + y == 0) s = 0; else s = 1;
  endcase
end

always @(posedge clk, negedge rst_b) begin
  if(rst_b == 0) st <= 0;
  else st <= st_next;
  end

endmodule

module sadd_tb;
  reg clk, rst_b, x, y;
  wire s;
  sadd sadd_i(.clk(clk), .rst_b(rst_b), .x(x), .y(y), .s(s));
  
  integer i;
  initial begin
    clk = 0;
    rst_b = 0;
    x = 0; 
    y = 1;
  end
  
  initial begin
    for(i = 1; i <= 8; i = i + 1) begin
      #50; clk = ~clk;
    end
  end
  
  initial begin
    #25; rst_b = 1;
  end
  
  initial begin
    #100; x = 1;
    #200; x = 0;
  end
    
  initial begin
    #200; y = 0;
  end
endmodule