
class test extends uvm_test;
	
	`uvm_component_utils(test)
	environment env;
	seq sq;

	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = environment::type_id::create("env",this);
		sq = seq::type_id::create("sq",this);
		`uvm_info(get_full_name(),"**MESSSAGE FROM TEST**",UVM_LOW)
	endfunction

	task run_phase(uvm_phase phase);
	begin
		phase.raise_objection(this,"start of test");
			sq.start(env.agt_a.sqr);//triggering handshaking mechanism
			#20;
		phase.drop_objection(this,"end of test");
		`uvm_info(get_full_name(),"message from test runphase",UVM_LOW)
	end
	endtask
endclass

//(1)	Component registration
//(2)	creating handle for Environment and sequence
//(3)	components 2 argument custom constructor
//(4)	Inside build phase 
		//(*)creating memory for environment and sequence handles,
		//(*)display
			
//(5)	Run phase inside raise_objection and drop_objection 
		//starting sequence with help of sequencer(triggering handshaking mechanism)
