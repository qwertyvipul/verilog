module decoder_4_to_2(in, out);
    input[3:0] in;
    output[1:0] out;
    reg[1:0] out;
    always@(*)begin
        out = 2'b00;
        case(in)
            4'b0001: out = 2'b00;
            4'b0010: out = 2'b01;
            4'b0100: out = 2'b10;
            4'b1000: out = 2'b11;
        endcase
    end
endmodule

module test;
    reg[3:0] in;
    wire[1:0] out;
    decoder_4_to_2(in, out);
    initial begin
        $dumpfile("decoder-4-to-2.vcd");
        $dumpvars(0, test);
        $display("input\toutput")
        $monitor("%b\t%b", in, out);
            in = 4'b0001; #10
            in = 4'b0010; #10
            in = 4'b0100; #10
            in = 4'b1000; #10
        $finish;
    end
endmodule