module muxtest;
reg [15:0] B;
reg [3:0] C;
wire D;
mux16 M1(.in(B),.sel(C),.out(D));
initial
begin
$monitor($time, "B=%h, C=%h, D=%b", B,C,D);
#5 B=16'h3f0a;C=4'h0;
#5 B=16'h0aaa;C=4'h1;
//#5 C=4'h6;
//#5 C=4'hc;
//#5 $finish;
end
endmodule
