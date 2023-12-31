module Register (clk, reset, data_in, data_out, enable);
input clk;         // Clock input
input reset;      // Reset input
input [7:0] data_in;   // Input data to be stored in the register
output reg [7:0] data_out; // Output data from the register
input reg enable;

    always @((posedge(clk)) or (posedge reset)) begin

        if (reset) begin
            data_out <= 8'b0; // Inizializzazione a 0 in caso di reset
        end else if(enable) begin
            data_out <= data_in; // Aggiornamento del registro con il nuovo dato in ingresso
        end
    end
    
endmodule
