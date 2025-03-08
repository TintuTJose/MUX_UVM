class p_agent extends uvm_agent;
	
	`uvm_component_utils(p_agent)
	o_monitor o_mon;

	function new(string name="Passive Agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	 function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		o_mon=o_monitor::type_id::create("o_mon",this);
		
	endfunction


endclass

//component registration
//creating handle for output monitor
//component (2 argument) custom constructor
//build pahse creating memory for omonitor