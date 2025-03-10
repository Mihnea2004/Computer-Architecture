module pktmux(
  input [63:0] msg_len, pkt,
  input pad_pkt, zero_pkt, mgln_pkt, //cele 3 intrari de control
  output reg [63:0] o
);

always @(*) begin
  if(pad_pkt) begin 
    o = 0;
    o[63] = 1; //primii 63 de biti sunt 0, iar MSB este 1
  end
  else if(zero_pkt) o = 0;
  else if(mgln_pkt) o = msg_len;
  else o = pkt;
end
endmodule

module pktmux_tb;
  reg msg_len, pkt;
  reg pad_pkt, zero_pkt, mgln_pkt;
  wire [63:0] o;
  
  pktmux pktmux_i(.msg_len(msg_len), .pkt(pkt), .pad_pkt(pad_pkt), .zero_pkt(zero_pkt), .mgln_pkt(mgln_pkt));
  
  task urand64(output reg [63:0] r);
    begin
      r[63:32] = $urandom;
      r[31:0] = $urandom;
    end
  endtask;
  
  integer i;
  initial begin
    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 0;
    urand64(pkt);
    urand64(msg_len);
  end
  
  initial begin
    #100; pad_pkt = 1;
    #100; pad_pkt = 0;
    #300; pad_pkt = 1;
    #100; pad_pkt = 0; 
    #300; pad_pkt = 1;
    #100; pad_pkt = 0;
    #300; //timpul pana cand se termina linia
  end
  
  initial begin
    #200; zero_pkt = 1;
    #100; zero_pkt = 0;
    #300; zero_pkt = 1;
    #100; zero_pkt = 0; 
    #300; zero_pkt = 1;
    #100; zero_pkt = 0;
    #200; //timpul pana cand se termina linia
  end
  
  initial begin
    #300; mgln_pkt = 1;
    #100; mgln_pkt = 0;
    #300; mgln_pkt = 1;
    #100; mgln_pkt = 0; 
    #300; mgln_pkt = 1;
    #100; mgln_pkt = 0;
    #100; //timpul pana cand se termina linia
  end
  
  initial begin
    for(i = 1; i <= 12; i = i + 1) begin
      #100;
      urand64(pkt);
      urand64(msg_len);
    end
  end
endmodule