class a_agent extends uvm_agent;
	`uvm_component_utils(a_agent)
	sequencer sqr;
	driver drv;
	i_monitor i_mon;

	function new(string name="a_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = sequencer::type_id::create("sqr",this);
		drv = driver::type_id::create("drv",this);
		i_mon = i_monitor::type_id::create("i_mon",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		 drv.seq_item_port.connect(sqr.seq_item_export);
	endfunction

endclass

//component registration
//creating handle for sequencer, driver, i_monitor
//component 2argument custom constructor
//build phase creating memory for sequencer, driver,i_monitor
//connect phase  TLM port connections
		//(*) create connection between driver and sequencer