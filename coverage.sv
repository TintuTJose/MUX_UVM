
class coverage extends uvm_component;
	`uvm_component_utils(coverage)
	seq_item c;

	covergroup cvg;
		A:coverpoint c.i1
					{bins a1={[0:1]};
					}
		B:coverpoint c.i0
					{bins b1={[0:1]};
					}
		C:coverpoint c.sel{bins c={[0:1]};}
	
	
	endgroup

	function new(string name="coverage",uvm_component parent);
		super.new(name,parent);
		cvg = new();
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		c = seq_item :: type_id :: create("c");
	endfunction
endclass