module UART_RX
  #(parameter CLKS_PER_BIT = 217)
  (
  input        i_Clock,
  input        i_RX_Serial,
  output       o_RX_DV,
  output [7:0] o_RX_Byte
  );
  
  parameter Start         = 3'b000;
  parameter  StartBit = 3'b001;
  parameter RX_databits
  = 3'b010;
  parameter Stopbit  = 3'b011;
  parameter Stop      = 3'b100;
  
  reg [7:0]     r_Clock_Count = 0;
  reg [2:0]     r_Bit_Index   = 0; //total number of 8 bits
  reg [7:0]     r_RX_Byte     = 0;
  reg           r_RX_DV       = 0;
  reg [2:0]     r_SM_Main     = 0;
  
  
  // Purpose: Control RX state machine
  always @(posedge i_Clock)
  begin
      
    case (r_SM_Main)
      Start :
        begin
          r_RX_DV       <= 1'b0;
          r_Clock_Count <= 0;
          r_Bit_Index   <= 0;
          
          if (i_RX_Serial == 1'b0)          // detection of start bit
            r_SM_Main <=  StartBit;
          else
            r_SM_Main <= Start;
        end
      
      // To check middle of start bit to make sure it's still low
        StartBit :
        begin
          if (r_Clock_Count == (CLKS_PER_BIT-1)/2)
          begin
            if (i_RX_Serial == 1'b0)
            begin
              r_Clock_Count <= 0;  // found middle, reset the counter 
              r_SM_Main     <= RX_databits
              ;
            end
            else
              r_SM_Main <= Start;
          end
          else
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <=  StartBit;
          end
        end // case:  StartBit
      
      
      // wait CLKS_PER_BIT-1 clock cycles to sample serial data
      RX_databits :
        begin
          if (r_Clock_Count < CLKS_PER_BIT-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= RX_databits
            ;
          end
          else
          begin
            r_Clock_Count          <= 0;
            r_RX_Byte[r_Bit_Index] <= i_RX_Serial;
            
            // To check if we have received all bits
            if (r_Bit_Index < 7)
            begin
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main   <= RX_databits
              ;
            end
            else
            begin
              r_Bit_Index <= 0;
              r_SM_Main   <= Stopbit;
            end
          end
        end // case: RX_databits

      
      
      // receive Stop bit.  Stop bit = 1
      Stopbit :
        begin
          // Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
          if (r_Clock_Count < CLKS_PER_BIT-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
     	     r_SM_Main     <= Stopbit;
          end
          else
          begin
       	     r_RX_DV       <= 1'b1;
            r_Clock_Count <= 0;
            r_SM_Main     <= Stop;
          end
        end // case: Stopbit
      
      
      // Stay here 1 clock
      Stop :
        begin
          r_SM_Main <= Start;
          r_RX_DV   <= 1'b0;
        end
      
      
      default :
        r_SM_Main <= Start;
      
    endcase
  end    
  
  assign o_RX_DV   = r_RX_DV;
  assign o_RX_Byte = r_RX_Byte;
  
endmodule 

