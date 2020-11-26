module bcdtest;
reg[3:0] in;
wire[6:0] seg;
bcd BT(in,seg);
initial
begin
$monitor($time,"bcd=%b,seg=%b",in,seg);
in=4'b0001;
#5 in=4'b0010;
#5 in=4'b0110;
#5 in=4'b1100;
#50 $finish;
end
endmodule
