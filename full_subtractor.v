module full_subtractor(A, B, C, Diff, Borrow);
	input A,B,C;
	output Diff, Borrow;
	assign Diff = (A&~B&~C)|(~A&~B&C)|(A&B&C)|(~A&B&~C);
	assign Borrow = (~A&B)|(~A&C)|(B&C);
endmodule

module test;
    reg a,b,c;
    wire diff,borrow;
    full_subtractor g1(a, b, c, diff, borrow);
    
    initial begin
    	$dumpfile("full-subtractor.vcd");
    	$dumpvars(0, test);
    	$display("A\tB\tC\tDiff\tBorrow");
    	$monitor("%b\t%b\t%b\t%b\t%b", a,b,c,diff,borrow);
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
