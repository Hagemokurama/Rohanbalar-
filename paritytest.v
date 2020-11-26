module ptb;
reg x,clk;
wire z;
parity PT(x,clk,z);
initial
begin
clk=1'b0;
end
always #5 clk=~clk;
initial
begin
#2 x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 $finish;
end
endmodule
