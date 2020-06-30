module dlatchtest;
reg d,en;
wire q;
sensitive_latch D(q,d,en);

initial
begin
$monitor($time,"q=%b,d=%b,en=%b",q,d,en);
en=1'b0;d=1'bx;
#5 en=1'b1;d=1'b0;
#5 en=1'b1;d=1'b1;
#5 en=1'b0;d=1'b1;
//#5 s=1'b0;r=1'b0;
//#5 s=1'b1;r=1'b1;
#100 $finish;
end
endmodule
