module text2nibble (
  input [7:0] i,
  output reg [3:0] o
);
  always @(*) begin
    o = 15;
    if(i == 8'b00110000)
      o = 0;
  else if(i == 8'b00110001)
      o = 1;
  else if(i == 8'b00110010)
      o = 2;
  else if(i == 8'b00110011)
      o = 3;
  else if(i == 8'b00110100)
      o = 4;
  else if(i == 8'b00110101)
      o = 5;
  else if(i == 8'b00110110)
      o = 6;
  else if(i == 8'b00110111)
      o = 7;
  else if(i == 8'b00111000)
      o = 8;
  else if(i == 8'b00111001)
      o = 9;
    else
      o = 15;
  end
endmodule

module text2nibble_tb;
  reg [7:0] i;
  wire [3:0] o;

  text2nibble text2nibble_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\ti_chr\to");
    $monitor("%0t\t%b\t%c\t%b(%d)", $time, i, i, o, o);
    i = 0;
    for (k = 1; k < 256; k = k + 1)
      #10 i = k;
  end
endmodule