module counter(rst,clk,mode,load,din,up_down,sat_count,enable,timer_event,count);
	input logic clk,rst;
	input logic load,up_down,enable;  
	input logic [2:0] mode;
	input logic [31:0] din;
	input logic [31:0] sat_count;
	output logic timer_event;
	output logic signed [31:0] count;     
	
	logic signed [31:0] value;    
	
	always_ff @(posedge clk)    
	  begin
	   if(~rst)
	    begin
	     count<=32'd0;
	    end
	   else
	   	begin
	   	 if(load)
	   	   count<=din;
	   	 else if(enable & up_down)	
	   	  begin
				 if((count+value)>sat_count)
				  count<=sat_count;
	   	   else if(count>=sat_count)
	   	     count<=32'd0;
	   	     else
	   	      count<=count+value;
	   	  end
	   	 else if(enable & ~up_down)
	   	  begin
	   	   if(count==0)
	   	     count<=din;
	   	   else if((count-value)<0)
	   	   	 count<=0;
	   	   else
	   	   count<=count-value;
	   	  end  
	   	 else
	   	    count<=count;	
	   	end   	
	  end
	  
	always_comb 
	 begin
	  case(mode)	
	  3'd0: value =32'd1;
	  3'd1: value =32'd2;
	  3'd2: value =32'd3;
	  3'd3: value =32'd4;
	  3'd4: value =32'd5;
	  3'd5: value =32'd6;
	  3'd6: value =32'd7;
	  3'd7: value =32'd8;
	  default value=32'd0;
	  endcase
	 end
	
	assign timer_event = (~rst)?(1'b0):((up_down)?((count==sat_count)?1'b1:1'b0):((count==0)?1'b1:1'b0));
 
endmodule
