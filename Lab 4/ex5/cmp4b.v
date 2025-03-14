module cmp2b(
  input [1:0] x, y,
  output eq, lt, gt
  );
  
  assign eq = (x == y);
  assign lt = (x < y);
  assign gt = (x > y);
endmodule

module cmp4b(
  input [3:0] a, b,
  output eq, lt, gt
  );
  
  wire eq1, lt1, gt1, eq2, lt2, gt2;
  
  cmp2b cmp2b1(.x(a[1:0]), .y(b[1:0]), .eq(eq1), .lt(lt1), .gt(gt1)); //primii 2 biti
  
  cmp2b cmp2b2(.x(a[3:2]), .y(b[3:2]), .eq(eq2), .lt(lt2), .gt(gt2)); //urmatorii 2 biti

  assign eq = eq1 & eq2; //cand ambii sunt 0 sau 1
  assign lt = (lt1 & eq2) | (lt2 & eq1) | (lt1 & lt2);  // Mai mic: oricare p?r?i pot fi mai mici
  assign gt = (gt1 & eq2) | (gt2 & eq1) | (gt1 & gt2);  // Mai mare: oricare p?r?i pot fi mai mari
endmodule

module cmp4b_tb;
  reg [3:0] a, b;
  wire eq, lt, gt;
  
  cmp4b cmp4b_i(.a(a), .b(b), .eq(eq), .lt(lt), .gt(gt));
  
  integer i;
  initial begin
    {a, b} = 0;
    for(i = 0; i < 256; i = i + 1) begin
      {a, b} = i;
    #10;
  end
end
endmodule