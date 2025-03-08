class seq_item extends uvm_sequence_item;
	
	`uvm_object_utils(seq_item)
	/*`uvm_object_utils_begin(seq_item)	//begin end para registration
			`uvm_field_int(sel,UVM_DEC)
			`uvm_field_int(i1,UVM_DEC)
			`uvm_field_int(i0,UVM_DEC)
	`uvm_object_utils_end*/

	
	randc bit [7:0]i0;
	randc bit [7:0]i1;
	rand bit sel;
	bit [7:0]out;

	function new(string name="seq_item");
		super.new(name);
	endfunction
	
endclass

//object registration
//declaration of variables, with rand and randc
//object 1 argument constum constructor
