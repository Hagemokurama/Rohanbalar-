//Author: Rohan Balar
//File Name: SR_Latch.v
//Type: Module
//-----------------------------------------------------------------
//Purpose: Set Reset Latch

module sr_latch(q,qbar,s,r);
input s,r;
output q,qbar;
assign q=~(r&qbar);
assign qbar=~(s&q);
endmodule

