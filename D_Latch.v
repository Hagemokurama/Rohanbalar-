//Author: Rohan Balar
//File Name: D_Latch.v
//Type: Module
//-----------------------------------------------------------------
//Purpose: D Type Level Sensitive Latch


module sensitive_latch(q,d,en);
input d,en;
output q;
assign q=en?d:q;
endmodule

