	// verilator_coverage annotation
	module reg_if_id(
 020000	    input wire clk,
%000002	    input wire rst,
 013249	    input wire[31:0] if_pc,
 177799	    input wire[31:0] if_inst,
 144964	    output reg[31:0] id_inst,
 026389	    output reg[31:0] id_pc,
	    //hazard detection
 006569	    input  wire if_id_flush,
%000009	    input  wire if_id_stall
	);
	
	always @(posedge clk) begin
 003384	    if (!rst || if_id_flush)begin
	        id_inst <= 32'b0;
	        id_pc   <= 32'b0;
	        $display("if_id_flush pc: %h",id_pc);
	    end
%000004	    else if (if_id_stall) begin
	        id_inst <= id_inst;
	        id_pc   <= id_pc;   
	        $display("if_id_stall, inst: %h, \npc: %h", id_inst,id_pc );     
	    end
 006612	    else begin
	        id_inst <= if_inst;
	        id_pc   <= if_pc;
	        $display("id_inst: %h",id_inst );        
	    end
	end
	
	endmodule
