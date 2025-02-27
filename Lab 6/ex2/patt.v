module patt(
  input clk, rst_b, i,
  output reg [1:0] s
);

reg [1:0] st, st_next;
localparam s0 = 2'd0;
localparam s1 = 2'd1;
localparam s2 = 2'd2;
localparam s3 = 2'd3;

always @(*) begin
  case(st)
    s0: if(i == 0) st_next = s0; else st_next = s1;
    s1: if(i == 0) st_next = s2; else st_next = s1;
    s2: if(i == 0) st_next = s0; else st_next = s3;
    s3: if(i == 0) st_next = s3; else st_next = s1;    
  endcase
end

always @(*) begin
  s = 0;
  case(st)
    s0: if(i == 0) s = 0; else s = 0;
    s1: if(i == 0) s = 0; else s = 0;
    s2: if(i == 0) s = 0; else s = 0;
    s3: if(i == 0) s = 0; else s = 1;
  endcase
end

always @(posedge clk, negedge rst_b) begin
  if(!rst_b) st <= 0;
  else st <= st_next;
end
endmodule

module patt_tb;
  reg clk, rst_b, i;
  wire s;
  
  patt patt_i(.clk(clk), .rst_b(rst_b), .i(i), .s(s));
  
  integer j;
  initial begin
    clk = 0;
    rst_b = 0;
    i = 1;
  end
  
  initial begin
    for(j = 1; j <= 15; j = j + 1) begin
      #100; clk = ~clk;
    end
  end
  
  initial begin
    #25; rst_b = 1;
  end
  
  initial begin
    #100; i = 0;
    #100; i = 1;
    #200; i = 0;
    #100; i = 1;
  end
endmodule