class sequencer extends uvm_sequencer#(seq_item);
`uvm_component_utils(sequencer)

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

//component registration
//component 2 argument custom constructor
//NO LOGIC IS WRITING INSIDE SEQUENCER