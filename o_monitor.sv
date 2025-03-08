class o_monitor extends uvm_monitor;
	
	`uvm_component_utils(o_monitor)
	seq_item pkt;
	virtual muxinter inter;

	uvm_blocking_put_port #(seq_item)m_put_port1;

	function new(string name,uvm_component parent);
		super.new(name,parent);
		m_put_port1=new("m_put_port1",this);
	endfunction 

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		pkt = seq_item::type_id::create("pkt");
		if(!uvm_config_db#(virtual muxinter)::get(this,"","inter",inter))
		begin
			`uvm_error("config_db_error","not able to retrieve interface from configdb")
		end
	endfunction

	task run_phase(uvm_phase phase);
	//pkt=seq_item::type_id::create("pkt");
	forever
	begin

	@(inter.out);
	pkt.out = inter.out;
	`uvm_info(get_full_name(),$psprintf("out=%0d",pkt.out),UVM_NONE)
	`uvm_info(get_full_name(),$psprintf("out=%0d",pkt.out),UVM_NONE)

	m_put_port1.put(pkt);
	end
	`uvm_info(get_name(),"message from o_monitor", UVM_LOW)

	endtask
endclass

//component registration
//creating seq_item handle
//creating virtual interface handle
//monitor to scoreboard sending put_port declartion
//component 2argument custom constructor
		//creating memory for port
//build phase
		//creating memory for pkt
		//getting config_db - reason for why inetrface handle declared in this file
		
//run_phase
		//inside forever begin- before getting ouput giving delay
		//data from dut assigned to o_monitor
		//pkt_info putting
		
