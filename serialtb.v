module add23;
reg x,y,clk,reset;
wire z,s,cy;
serial st(s,cy,z,x,y,clk,reset);
initial
begin
clk=1'b0;
reset=1'b1;
#15 reset=1'b0;
end
always #5 clk=~clk;
initial
begin
#12 x=0;y=0;
#10 x=0;y=1;
#10 x=1;y=0;
#10 x=1;y=1;
#10 x=0;y=0;
//#10 x=1;
//#10 x=0;
//#10 x=1;
//#10 x=0;
//#10 x=0;
#10 $finish;
end
//initial
//begin
//$monitor ($time,"State: %b", st.ps);
//end
endmodule
