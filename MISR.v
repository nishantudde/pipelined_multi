module misr_8bit (
    input wire clk,        // Clock signal
    input wire rst,        // Reset signal
    input wire [7:0] data, // 8-bit input data
    output reg [7:0] misr  // 8-bit MISR output
);

wire feedback;

assign feedback = misr[7] ^ data[7] ^ misr[5] ^ data[5] ^ misr[4] ^ data[4] ^ misr[3] ^ data[3];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        misr <= 8'h0; // Initialize MISR to 0 on reset
    end else begin
        misr[0] <= feedback;
        misr[1] <= misr[0] ^ data[0];
        misr[2] <= misr[1] ^ data[1];
        misr[3] <= misr[2] ^ data[2];
        misr[4] <= misr[3] ^ data[3];
        misr[5] <= misr[4] ^ data[4];
        misr[6] <= misr[5] ^ data[5];
        misr[7] <= misr[6] ^ data[6];
    end
end

endmodule
