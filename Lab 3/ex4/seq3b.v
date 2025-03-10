module seq3b (
  input [3:0] i,
  output reg o
);

  integer j;
  always @(*) begin
    /*o = 0;
    for(j = 0; j <= 1; j = j + 1) begin
      if(i[j] == 1 && i[j + 1] == 1 && i[j + 2] == 1) begin
        o = 1;
        break;
      end
    end   */
    case (i)
      0, 1, 7, 8, 14, 15: o = 1;
      default: o = 0;
    endcase
  end
endmodule

module seq3b_tb;
  reg [3:0] i;
  wire o;

  seq3b seq3b_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\t\to");
    $monitor("%0t\t%b(%2d)\t%b", $time, i, i, o);
    i = 0;
    for (k = 1; k < 16; k = k + 1)
      #10 i = k;
  end
endmodule