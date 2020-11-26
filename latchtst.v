module latchtest;
reg S,R;
wire Q,Qbar;
srltch LAT(Q,Qbar,S,R);
initial
begin
$monitor($time, "S=%b, R=%b, Q=%b, Qbar=%b",S,R,Q,Qbar);
S=1'b0; R=1'b1;
#5 S=1'b1; R=1'b1;
#5 S=1'b1; R=1'b0;
#5 S=1'b1; R=1'b1;
#5 S=1'b1; R=1'b0;
#5 S=1'b1; R=1'b1;
end 
endmodule


