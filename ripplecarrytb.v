module ripple;
reg[3:0] x,y;
reg cin;
wire[3:0] z;
wire cout;
fulladder RP(z,cout,x,y,cin);
initial
begin
$monitor($time,"X=%b,cin=%b, Y=%b, z=%b,cout=%b",x,cin,y,z,cout);
#5 x=4'b0001; y=4'b0010; cin=1'b1;
#5 x=4'b0110; y=4'b0010; cin=1'b0;
//#5 x=16'haaaa; y=16'h5555;
#30 $finish;
end
endmodule
