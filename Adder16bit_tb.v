module alutest2;
reg[15:0] X,Y;
wire [15:0] Z;
wire S,Zr,Cy,P,V;

Alu DUT(X,Y,Z,S,Zr,Cy,P,V);
initial
begin
$monitor ($time,"X=%h,Y=%h,Z=%h,S=%b,Zr=%b,Cy=%b,P=%b,V=%b",X,Y,Z,S,Zr,Cy,P,V);
#5 X=16'h8fff;Y=16'h8000;
#5 X=16'h8ffe;Y=16'h0001;
#5 X=16'haaaa;Y=16'h5555;
#5 $finish;
end
endmodule
