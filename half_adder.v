module half_adder(A, B, Carry, Sum);
	input A,B;
	output Carry, Sum;
	assign Carry = A&B;
	assign Sum = A^B;
endmodule

module test;
    reg a,b;
    wire carry, sum;
    half_adder g1(a, b, carry, sum);
    
    initial begin
    	$dumpfile("half-adder.vcd");
    	$dumpvars(0, test);
    	$display("A\tB\tCarry\tSum");
    	$monitor("%b\t%b\t%b\t%b", a,b,carry,sum);
    	a=0;b=0;
    	#10 a=0;b=1;
    	#10 a=1;b=0;
    	#10 a=1;b=1;
    	#10 a=0;b=0;
    	$finish;
    end
endmodule
