//serial add
module serial(s,cy,z,x,y,clk,reset);
input x,y,clk,reset;
output  s,cy;
output reg z;

wire s,cy;
reg ps,ns;
assign{cy,s}=x+y;
parameter s0=0,s1=1;//s0=no carry;s1=carry
always @(posedge clk or posedge reset)
if(reset)
ps<=s0;
else
ps<=ns;

always @(ps,x,y)
case(ps)
s0:
begin
if(s==1&cy==0)
begin
ns=s0;
z=0;
end
else if(s==0&cy==0)
begin
ns=s0;
z=0;
end
else if(s==0&cy==1)
begin
ns=s1;
z=1;
end
end
s1:
begin
if(s==0&cy==1)
begin
ns=s1;
z=1;
end
else if(s==1&cy==1)
begin
ns=s1;
z=1;
end
else if(s==1&cy==0)
begin
ns=s0;
z=0;
end
end
endcase
endmodule

