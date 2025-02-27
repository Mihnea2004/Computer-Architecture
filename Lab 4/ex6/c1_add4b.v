// Modulul c1_add4b pentru adunarea a doua numere in codul C1 pe 4 biti
module c1_add4b(
    input [3:0] x,  // Intrarea x (4 biti)
    input [3:0] y,  // Intrarea y (4 biti)
    input ci,       // Intrare carry-in (1 bit)
    output [3:0] z  // Ie?irea suma (4 biti)
);
    wire [3:0] sum;  // Suma intermediar? (4 biti)
    wire carry;      // Carry-ul intermediar (1 bit)

    // Adunarea C1 folosind carry-in
    assign {carry, sum} = x + y + ci;

    // Implementarea end-around carry
    // Daca exista carry, il adaugam inapoi la suma
    assign z = sum ^ {4{carry}};  // XOR cu masca carry

endmodule

// Testbench pentru verificarea functioanalitatii modulului c1_add4b
module c1add4b_tb;
    reg [3:0] x, y;  // Intrarile x si y (4 biti fiecare)
    reg ci;           // Carry-in (1 bit)
    wire [3:0] z;     // Ie?irea suma (4 biti)

    // Instantierea modulului c1_add4b
    c1_add4b uut (
        .x(x),     // Conectam intrarea x
        .y(y),     // Conectam intrarea y
        .ci(ci),   // Conectam carry-in
        .z(z)      // Conectam iesirea suma
    );

    // Procedura de testare
    integer i, j, k;
    initial begin
        // Afi??m capul tabelului
        $display("x\ty\tci\tz");

        // Testarea tuturor combinatiilor posibile pentru x, y si ci
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                for(k = 0; k < 2; k = k + 1) begin
                    // Setam valorile pentru x, y si ci
                    x = i;
                    y = j;
                    ci = k;

                    // A?teptam 10 unit??i de timp pentru a evalua rezultatele
                    #10;

                    // Afi??m rezultatele testului
                    $display("%b\t%b\t%b\t%b", x, y, ci, z);
                end
            end
        end
        // Termin?m simularea dup? ce toate combina?iile au fost testate
        $finish;
    end
endmodule
