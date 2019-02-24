module full_adder(A, B, C, Carry, Sum);
	input A,B,C;
	output Carry, Sum;
	assign Sum = A^B^C;
	assign Carry = (A&B)|(B&C)|(A&C);
endmodule

module test;
    reg a,b, c;
    wire carry, sum;
    full_adder gl(a, b, c, carry, sum);
    
    initial begin
    	$dumpfile("full-adder.vcd");
    	$dumpvars(0, test);
    	$display("A\tB\tC\tCarry\tSum");
    	$monitor("%b\t%b\t%b\t%b\t%b", a,b,c,carry,sum);
    	a=0;b=0;c=0;
    	#10 a=0;b=0;c=1;
    	#10 a=0;b=1;c=0;
    	#10 a=0;b=1;c=1;
    	#10 a=1;b=0;c=0;
    	#10 a=1;b=0;c=1;
    	#10 a=1;b=1;c=0;
    	#10 a=1;b=1;c=1;
    	$finish;
    end
endmodule
