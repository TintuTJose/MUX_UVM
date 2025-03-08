 `include "coverage.sv"
`uvm_blocking_put_imp_decl(_i)
`uvm_blocking_put_imp_decl(_o)
class scoreboard extends uvm_scoreboard;
	
	`uvm_component_utils(scoreboard)
	uvm_blocking_put_imp_i#(seq_item,scoreboard)my_export;
	uvm_blocking_put_imp_o#(seq_item,scoreboard)my_export1;
	seq_item recv_pkt,exp_pkt;
	coverage covg;

	function new(string name,uvm_component parent);
			super.new(name,parent);   
			my_export=new("my_export",this);
			my_export1=new("my_export1",this);
			 
	endfunction

	function void build_phase(uvm_phase phase);
		
		recv_pkt = seq_item::type_id::create("recv_pkt",this);
		exp_pkt = seq_item::type_id::create("exp_pkt",this);
		covg = coverage :: type_id :: create("covg",this);	

		`uvm_info(get_name(),"**MESSAGE IS FROM SCOREBOARD BUILD PHASE WITH NONE**",UVM_NONE)
	endfunction



	task put_i(seq_item recv_pkt);
		this.recv_pkt = recv_pkt;
	endtask

	task put_o(seq_item exp_pkt);
		this.exp_pkt = exp_pkt;
		if(recv_pkt.out == exp_pkt.out)
		begin 
		`uvm_info(get_full_name(),$sformatf("recv_pkt.out=%0d,exp_pkt.out=%0d",recv_pkt.out,exp_pkt.out),UVM_NONE)
		end
		else
		begin
		`uvm_info(get_full_name(),$sformatf("failed"),UVM_NONE)
		`uvm_info(get_full_name(),$sformatf("recv_pkt.out=%0d,exp_pkt.out=%0d",recv_pkt.out,exp_pkt.out),UVM_NONE)
		end
	covg.c = exp_pkt;
	covg.cvg.sample();
	endtask
endclass
