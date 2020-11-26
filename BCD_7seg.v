//Author: Rohan Balar
//File Name: BCD_7seg.v
//Type: Module
//-----------------------------------------------------------------
//Purpose:BCD 7 Segment Dispaly


module bcd(in,seg);
input[3:0] in;
output reg [6:0] seg;
always@(in)
case(in)
0:seg=7'b0000001;
1:seg=7'b1001111;
2:seg=7'b0010010;
3:seg=7'b0000110;
4:seg=7'b1001100;
5:seg=7'b0100100;
6:seg=7'b0100000;
7:seg=7'b0001111;
8:seg=7'b0000000;
9:seg=7'b0000001;
default:seg=7'b1111111;
endcase
endmodule


