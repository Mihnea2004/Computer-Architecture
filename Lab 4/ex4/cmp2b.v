module cmp2b(
  input [1:0] x, y,
  output eq, lt, gt
  );
  
  assign eq = (x == y);
  assign lt = (x < y);
  assign gt = (x > y);
endmodule

module cmp2b_tb;
  reg [1:0] x, y;
  wire eq, lt, gt;
  
  cmp2b cmp2b_i(.x(x), .y(y), .eq(eq), .lt(lt), .gt(gt));
  
  integer i;
  initial begin
    {x, y} = 0;
    for(i = 0; i < 16; i = i + 1) begin //exista 4^2 = 16 combinatii posibile
      {x, y} = i;
    #10;
  end
end
endmodule