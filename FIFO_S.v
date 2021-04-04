module FIFO_Sync (
    input clk,
    input [31:0] d_in ,
    input wr_en,
    input rd_en,
    input reset,
    input en,
    output full,
    output empty,
    output reg  [31:0] d_out 
);
    reg [2:0] counter = 0 ;
    reg [31:0] fifo [7:0] ;
    reg [2:0] rd_counter = 0;
    reg [2:0] wr_counter = 0;

    assign full = (counter == 8)? 1'b1 : 1'b0;
    assign empty = (counter == 0)? 1'b1 : 1'b0;

    always @(posedge clk ) 
    begin
            if (en == 0); 
            
            else 
                begin
                    if (reset)
                    begin
                            rd_counter <= 0;
                            wr_counter <= 0;    
                    end

                    else
                    begin
                        
                        if  (rd_en == 1'b1 && counter != 0)
                        begin
                                d_out <= fifo[rd_counter];
                                rd_counter <= rd_counter + 1;

                        end

                        else if (wr_en == 1'b1 && counter < 8) 
                        begin
                            fifo[wr_counter] <= d_in;
                            wr_counter <= wr_counter + 1;

                        end
                        else;
                    end

                end
            end


always @(posedge clk)
begin
            if (rd_counter == 8)
            begin
                    rd_counter <= 0;    
            end
            else if (wr_counter == 8)
            begin
                    wr_counter <= 0;
            end
            else;
end

always @(posedge clk)
begin

            if (rd_counter < wr_counter)
            counter <= wr_counter - rd_counter;
            else if (rd_counter > wr_counter)
            counter <= rd_counter - wr_counter;
	else;

end




endmodule
