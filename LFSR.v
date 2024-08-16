module LFSR (
    input wire clk,      // Clock signal
    input wire rst,      // Reset signal
    output reg [7:0] lfsr // 8-bit LFSR output
);

wire feedback;

// Feedback calculation using the polynomial x^8 + x^6 + x^5 + x^4 + 1
// Equivalent to feedback = lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]
assign feedback = lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        lfsr <= 8'h1; // Initialize LFSR to a non-zero value on reset
    end else begin
        lfsr <= {lfsr[6:0], feedback}; // Shift left and insert feedback bit
    end
end

endmodule
