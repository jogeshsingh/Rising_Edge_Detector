/////////*******simulation file of edge_detect******///
////*****simulator used **** MODELSIM INTEL starter edition ******///////


module edge_detect1_tb();
reg i_clk ;
reg rst_n ;
reg level;
wire toggle ;
wire [1:0] p_STATE ;

edge_detect1 DUT 
 (
.i_clk(i_clk) , 
.rst_n(rst_n) , 
.toggle(toggle) , 
.level(level) , 
.p_STATE(p_STATE) );


initial 
   begin 
	  i_clk = 1'b0 ;
	   rst_n = 1'b0 ;
		level = 1'b0 ;
		 end


always #5 i_clk = ~i_clk ;


initial 
  begin
  
		  rst_n = 1'b1 ;  
		  #3;
	  end 
	  
	  initial
	     begin
		  repeat (3) @(posedge i_clk)
			#3 ;
			level = 1'b1 ;
			 @(posedge i_clk )
			 level = 1'b0 ;
		
	      repeat (5) @(posedge i_clk)	
			level = 1'b1 ;
	       
			 @(posedge i_clk)
			  level = 1'b0 ;
			  
			 #100 $finish ;
			 end
			 
			 endmodule 