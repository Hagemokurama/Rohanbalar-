module prioritytest;
reg[7:0] in;
wire[2:0] code;

pe PET(in,code);

initial
begin
$monitor($time,"in=%h,code=%h",in,code);
#2 in=16'h0007;
#5 in=16'h0006;
#5 in=16'h0001;
#10 $finish;
end
endmodule

