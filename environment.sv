  class environment extends uvm_env;

	`uvm_component_utils(environment)
	
	a_agent agt_a;
	p_agent agt_p;
	scoreboard scb;
	
	virtual muxinter inter;

	function new(string name,uvm_component parent);
			super.new(name,parent);    
	endfunction

	function void build_phase(uvm_phase phase);
		agt_a = a_agent::type_id::create("agt_a",this);
		agt_p = p_agent::type_id::create("agt_p",this);
		scb = scoreboard::type_id::create("scb",this);

		`uvm_info(get_name(),"**MESSAGE IS FROM ENVIRONMENT BUILD PHASE WITH NONE**",UVM_NONE)
	endfunction

	function void connect_phase(uvm_phase phase);
	agt_a.i_mon.m_put_port.connect(scb.my_export);
	agt_p.o_mon.m_put_port1.connect(scb.my_export1);
	`uvm_info(get_full_name(),"**CONNECTING ENVIRONMENT PHASE**",UVM_LOW)

	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
			uvm_top.print_topology();
			`uvm_info(get_full_name(),"END OF ELABORATION",UVM_LOW)
			`uvm_info("ENVIRONMENT","ENVIRONMENT FUNCTION",UVM_HIGH)
	endfunction
endclass        

//component registration
//creating handles for active agent, passive agent,scoreboard
//virtual interface handle creation
//component 2 argument custom constructor
//build phase creating memory for activeagent, passive agent and scoreboard, display
//connect phase TLM port connections
		//(*)imon put_port connected to scoreboard export
		//(*)omon put_port connected to scoreboard export
//Inside end_of_elaboration	printing topology
	