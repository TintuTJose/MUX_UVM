class driver extends uvm_driver #(seq_item);
	
	`uvm_component_utils(driver)
	seq_item pkt;
	virtual muxinter inter;

	function new(string name, uvm_component parent);
        super.new(name,parent);    
    endfunction

    function void build_phase(uvm_phase phase);
		if(!uvm_config_db#(virtual muxinter)::get(this,"*","inter",inter))
		begin
			`uvm_error("config_db_error","not able to retrieve inter from config_db")
		end

		`uvm_info("DRIVER","**MESSAGE IS FROM DRIVER BUILD PHASE WITH LOW**",UVM_LOW)
    endfunction

 virtual  task run_phase(uvm_phase phase);
    
	forever begin
            seq_item_port.get_next_item(pkt);
            #1;
			
			inter.i0 = pkt.i0;
			inter.i1 = pkt.i1;
			inter.sel = pkt.sel;
			inter.out = pkt.out;
			
            pkt.print();
            seq_item_port.item_done();
            end
    endtask
endclass    

//component registration
//virtual interface handle creation
//component 2 argument constum constructor
//build phase config_db gettting inetrface handle
//run phase inside get_next_item and item_done logic of driver witting
		//(driving  data from testbech to dut )
		