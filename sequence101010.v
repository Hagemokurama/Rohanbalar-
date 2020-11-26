//sequence 101010
module seq_1(z,x,clk,reset);
input x,clk,reset;
output reg z;
reg [0:2] ps,ns;
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
always @(posedge clk or posedge reset)
if(reset)
ps<=s0;
else
ps<=ns;

always @(ps,x)
case(ps)
s0: //(1)
begin
z=x?0:0;
ns=x?s1:s0;//if x=1 then go to s1 else s0
end
s1: //(0)
begin
z=x?0:0;
ns=x?s1:s2;//if x=1 stay in s1 else go to s2
end
s2://(1)
begin
z=x?0:0;
ns=x?s4:s2;// if x=1 stay else go to s3
end
s3: //(0)
begin
z=x?0:0;
ns=x?s3:s4;
end //if x=1 go to s4 else s3
s4: //(1)
begin
z=x?0:0;
ns=x?s5:s4;
end
s5: //(0)
begin
z=x?0:1;
ns=x?s0:s4;
end
endcase
endmodule

