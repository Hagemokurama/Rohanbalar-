module lptb;
reg clock;
wire[0:2] light;
lamp lp(clock,light);
always #5 clock=~clock;
initial
begin
clock=1'b0;
#100 $finish;
end
initial
begin
$monitor ($time,"RGY: %b", light);
end
endmodule

