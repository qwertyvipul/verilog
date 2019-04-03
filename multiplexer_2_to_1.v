module mux_2_to_1(sel, in1, in2, out);
    input sel, in1, int2;
    output out;
    assign out = sel?in2:in1;
endmodule

module test;
    reg sel, in1, in2;
    wire out;
    mux_2_to_1 obj(sel, in1, in2, out);
    initial begin
        $dumpfile("mux-2-to-1.vcd");
        $dumpvars(0, test);
        $display("select\tinput1\tinput2\toutput");
        $monitor("%b\t%b\t%b\t%b", sel, in1, in2, out);
            sel = 0; in1 = 0; in2 = 0; #10
            sel = 0; in1 = 0; in2 = 1; #10
            sel = 0; in1 = 1; in2 = 0; #10
            sel = 0; in1 = 1; in2 = 1; #10
            sel = 1; in1 = 0; in2 = 0; #10
            sel = 1; in1 = 0; in2 = 1; #10
            sel = 1; in1 = 1; in2 = 0; #10
            sel = 1; in1 = 1; in2 = 1; #10
        $finish
    end
endmodule