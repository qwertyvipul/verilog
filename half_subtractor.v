module half_subtractor(A, B, Diff, Borrow);
	input A,B;
	output Diff, Borrow;
	assign Diff = (~A&B)|(A&~B);
	assign Borrow = ~A&B;
endmodule

module test;
    reg a,b;
    wire diff,borrow;
    half_subtractor g1(a, b, diff, borrow);
    
    initial begin
    	$dumpfile("half-subtractor.vcd");
    	$dumpvars(0, test);
    	$display("A\tB\tDiff\tBorrow");
    	$monitor("%b\t%b\t%b\t%b", a,b,diff,borrow);
    	a=0;b=0;
    	#10 a=0;b=1;
    	#10 a=1;b=0;
    	#10 a=1;b=1;
    	#10 a=0;b=0;
    	$finish;
    end
endmodule
