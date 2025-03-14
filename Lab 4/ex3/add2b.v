module fac(
  input a, b, cin,
  output s, cout
  );
  
  assign s = a ^ b ^ cin; //suma este xor-ul intrarilor
  assign cout = (a & b) | (b & cin) | (a & cin); //transport in iesire
endmodule

module add2b(
  input [1:0] x, y,
  input ci,
  output [1:0] o,
  output co
  );
  
  wire f; //firul de legatura intre primul si al doilea FAC
  
  fac fac1(.a(x[0]), .b(y[0]), .cin(ci), .s(o[0]), .cout(f));
  
  fac fac2(.a(x[1]), .b(y[1]), .cin(f), .s(o[1]), .cout(co));
  
endmodule

module add2b_tb;
  reg [1:0] x, y;
  reg ci;
  wire [1:0] o;
  wire co;
  
  add2b add2b_i(.x(x), .y(y), .ci(ci), .o(o), .co(co));
  
  integer i;
  initial begin
    {x, y, ci} = 0;
    for(i = 0; i < 64; i = i + 1) begin //2^6 = 64 de combinatii posibile
      {x, y, ci} = i;
      #10;
    end
  end
endmodule