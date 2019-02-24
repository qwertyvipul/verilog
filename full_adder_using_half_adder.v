module half_adder(A, B, Carry, Sum);
	input A,B;
	output Carry, Sum;
	assign Carry = A&B;
	assign Sum = A^B;
endmodule

module full_adder(A, B, C, Carry, Sum);
	input A,B,C;
	output Carry, Sum;
	wire carry1, carry2, sum1;
	half_adder h1(A, B, carry1, sum1);
	half_adder h2(sum1, C, carry2, Sum);
	assign Carry = carry1 | carry2;
endmodule

module test;
    reg a,b, c;
    wire carry, sum;
    full_adder gl(a, b, c, carry, sum);
    
    initial begin
    	$dumpfile("full-adder-using-half-adder.vcd");
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
    	#10 a=0;b=0;c=0;
    	$finish;
    end
endmodule
