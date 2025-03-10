module fac (
  input x, y, ci,
  output reg z, co
);

always @(*) begin
  if(x == 0 && y == 0 && ci == 0) begin
    z = 0; co = 0;
  end
  if(x == 1 && y == 0 && ci == 0) begin
    z = 1; co = 0;
  end
  if(x == 0 && y == 1 && ci == 0) begin
    z = 1; co = 0;
  end
  if(x == 0 && y == 0 && ci == 1) begin
    z = 1; co = 0;
  end
  if(x == 1 && y == 1 && ci == 0) begin
    z = 0; co = 1;
  end
  if(x == 0 && y == 1 && ci == 1) begin
    z = 0; co = 1;
  end
  if(x == 1 && y == 0 && ci == 1) begin
    z = 0; co = 1;
  end
  if(x == 1 && y == 1 && ci == 1) begin
    z = 1; co = 1;
  end
  end
endmodule

module fac_tb;
  reg x, y, ci;
  wire z, co;
  
  fac fac_i(.x(x), .y(y), .ci(ci), .z(z), .co(co));
  
  integer i;
  initial begin
    {x, y, ci} = 0;
    for(i = 0; i < 8; i = i + 1)
      #10 {x, y, ci} = i;
    #20;
  end
endmodule
  