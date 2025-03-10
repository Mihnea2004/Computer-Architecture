module mux_2s #(
  parameter w = 4
)(
  input [w-1:0] d0, d1, d2, d3,
  input {1:0] s,
  output [w-1:0] o
  );
  
  wire [w-1:0] o0, o1, o2, o3; //semnalele pt drivere tri-state
  assign o0 = (s == 2'b00) ? d0 : {w{1'bz}}; //daca s este 00, o0 ia valoarea do, altfel este tri-state
  assign o1 = (s == 2'b01) ? d1 : {w{1'bz}};
  assign o2 = (s == 2'b10) ? d2 : {w{1'bz}};
  assign o3 = (s == 2'b11) ? d3 : {w{1'bz}};
  
  assign o = o0 | o1 | o2 | o3; //iesirea este una dintre cele 4 intrari
endmodule