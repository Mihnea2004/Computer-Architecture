module div3 (
  input [3:0] i,
  output [2:0] o
);
  
  reg [2:0] temp;
  always @(*) begin
    case(i)
      4'd0, 4'd1, 4'd2 : temp = 3'd0;
      4'd3, 4'd4, 4'd5 : temp = 3'd1;
      4'd6, 4'd7, 4'd8 : temp = 3'd2;
      4'd9, 4'd10, 4'd11 : temp = 3'd3;
      4'd12, 4'd13, 4'd14 : temp = 3'd4;
      4'd15 : temp = 3'd5;
    endcase
    end
    assign o = temp;
endmodule

module div3_tb;
  reg [3:0] i;
  wire [2:0] o;

  div3 div3_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\t\to");
    $monitor("%0t\t%b(%2d)\t%b(%0d)", $time, i, i, o, o);
    i = 0;
    for (k = 1; k < 16; k = k + 1)
      #10 i = k;
  end
endmodule