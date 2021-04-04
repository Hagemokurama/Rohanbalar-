module fifo_testb;

    reg clk;
    reg [31:0] d_in;
    reg wr_en;
    reg rd_en;
    reg reset;
    reg en;
    wire full;
    wire empty;
    wire [31:0] d_out;


 FIFO_Sync ff ( .clk(clk),
                    .d_in(d_in),
                    .wr_en(wr_en),
                    .rd_en(rd_en),
                    .reset(reset),
                    .en(en),
                    .full(full),
                    .empty(empty),
                    .d_out(d_out)
                    );

    initial 
    begin
        clk = 1'b0;
        reset = 1'b1;
        d_in = 32'h0;
        wr_en = 1'b0;
        rd_en = 1'b0;
        en = 1'b0;
        #100;
        reset = 1'b1;
        en = 1'b1;
        #20;
        reset = 1'b0;
        wr_en = 1'b1;
        d_in = 32'h0;

        #20;
        d_in = 32'h1;
        #20;
        d_in = 32'h2;
        #20;
        d_in = 32'h3;
        #20;
        d_in = 32'h4;
	#20;
	wr_en = 1'b0;
	rd_en = 1'b1;
    end
initial begin
    forever begin
        #10 clk = ~clk;
    end
end

endmodule