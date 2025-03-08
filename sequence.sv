class seq extends uvm_sequence#(seq_item);
	`uvm_object_utils(seq)
	seq_item pkt;
	
	function new(string name="seq");
		super.new(name);
	endfunction

	virtual task body();
	//pkt=seq_item::type_id::create("pkt");
	repeat(15)
		begin
		`uvm_do(pkt);
		end
	endtask
endclass
