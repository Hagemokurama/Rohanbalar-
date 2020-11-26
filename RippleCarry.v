//Author: Rohan Balar
//File Name: RippleCarry.v
//Type: Module
//-----------------------------------------------------------------
//Purpose: 4-bit Ripple Carry Adder

module adder4(s,cout,A,B,cin);  //instantiating mosule adder4
input [3:0] A,B;
input cin;
output cout;
output [3:0] s;
wire c1,c2,c3;

fulladder FA0(s[0],c1,A[0],B[0],cin);
fulladder FA1(s[1],c2,A[1],B[1],c1);
fulladder FA2(s[2],c3,A[2],B[2],c2);
fulladder FA3(s[3],cout,A[3],B[3],c3);
endmodule

module fulladder (s,cout,a,b,c);
input a,b,c;
output s,cout;
wire s1,c1,c2;
xor GT1(s1,a,b),GT2(s,s1,c),GT3(cout,c1,c2);
and GT4(c1,a,b),GT(c2,s1,c);
endmodule
