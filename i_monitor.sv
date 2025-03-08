//Active agents output monitor,collecting inputs from inetrface
class i_monitor extends uvm_monitor;
	
	`uvm_component_utils(i_monitor)
	
	seq_item pkt;
	virtual muxinter inter;

	uvm_blocking_put_port #(seq_item)m_put_port;

	function new(string name,uvm_component parent);
		super.new(name,parent);
		m_put_port=new("m_put_port",this);
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

	forever
	begin

		@(inter.i0,inter.i1,inter.sel);
		pkt.i0=inter.i0;
		pkt.i1=inter.i1;
		pkt.sel=inter.sel;
		begin
			pkt.out=pkt.sel?pkt.i1:pkt.i0;
			
			`uvm_info(get_full_name(),$psprintf("i0=%0d,i1=%0d,sel=%0d",pkt.i0,pkt.i1,pkt.sel),UVM_NONE)
			`uvm_info(get_full_name(),$psprintf("out=%0d",pkt.out),UVM_NONE)
	
		end
	m_put_port.put(pkt);
	end
	`uvm_info(get_name(),"message from i_monitor", UVM_LOW)

	endtask
endclass

//component registration
//seq_item handle declartion
//vitual interface handle dedclaration
//blocking_put_port declaration
//component 2argument custum constructor
	