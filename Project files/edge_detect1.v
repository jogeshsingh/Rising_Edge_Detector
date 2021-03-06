module edge_detect1
#( parameter WIDTH = 2 , 
   parameter [WIDTH-1:0] 
	ZERO = 2'b00 ,
	ONE = 2'b11 ,
	EDGE = 2'b10  	                         
)
 (
i_clk , 
rst_n , 
toggle , 
level , 
p_STATE );

input i_clk ;
input rst_n ;
input level ;
output toggle ;
/////states //////
output reg [WIDTH-1:0] p_STATE ;
reg [WIDTH-1:0] nEXT_STATE ;


///////data register /////

always @ (negedge i_clk )
  begin
    if (~rst_n)
	   begin
		  p_STATE <= ZERO ;
		   end
			else
			  begin
			p_STATE <= nEXT_STATE ;
	            end
			 end		
			 
	/////next_state block ****///


always @ (p_STATE or level)
  begin
  nEXT_STATE = p_STATE ;
   case (p_STATE )
 ZERO: begin
           if (level)
			    nEXT_STATE = EDGE ;
				  else
				    nEXT_STATE = ZERO ;
					 end
EDGE :  begin
          if (level)
           nEXT_STATE = ONE ;
	          else
	        nEXT_STATE = ZERO ;
	         end
ONE :   begin
           if (level )
	          nEXT_STATE = ONE ;
	         else
                 nEXT_STATE = ZERO ;
			     end
		 
default :   nEXT_STATE = ZERO ;
      endcase
       end	
		 
		 
		 
/////*************output block ( registered block of output) *******//

assign toggle = (p_STATE== EDGE) ;
endmodule
/*always @ (posedge i_clk )
  begin
   if (~rst_n)
	  toggle = 0 ;
       else
         toggle = 0;
          case (p_STATE )
	    ZERO , ONE : ;            ///default output = 1'b0 //////
       EDGE : toggle = 1'b1 ;  
	     default : toggle = 1'b0 ;	 ///output is one ////
		   endcase
			
end
  endmodule 	*/				 
			 
			


