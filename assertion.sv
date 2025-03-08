module asser(i0,i1,sel,out);
	input i0,i1,sel;
	output out;
	
	
	 property mux_correct;
       @(posedge clk)
        (sel == 0) |-> (out == i0) &&
        (sel == 1) |-> (out == i1);
    endproperty
	mux_check : assert property(mux_correct);
	
endmodule