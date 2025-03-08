	`include "uvm_macros.svh"
	import uvm_pkg::*;
	
	`include "interface.sv"
	`include "dut.sv"
	`include "seq_item.sv"
	`include "sequence.sv"
	`include "sequencer.sv"
	`include "driver.sv"
	`include "i_monitor.sv"
	`include "o_monitor.sv"
	`include "a_agent.sv"
	`include "p_agent.sv"
	`include "scoreboard.sv"
	`include "environment.sv"
	`include "test.sv"

module top;
	muxinter inter();
	muxdut dut(inter);

	initial begin
		uvm_config_db#(virtual muxinter)::set(uvm_root::get(),"*","inter",inter);
		run_test("test");
	end

endmodule


//(1)	Base file added
//(2)	Included all files as per heirarchy
//(3)	Inside module instantiated interface, DUT 
//(4)	Inside initial begin setting config_db and running test file