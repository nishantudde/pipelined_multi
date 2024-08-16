module BIST (
    input wire clk,
    input wire rst,
    output wire [7:0] lfsr_out,
    output wire [15:0] result,
    output wire bist_pass
);

    wire [7:0] lfsr_a, lfsr_b;
    wire [7:0] misr_out;
    wire [15:0] multiplier_out;

    // Instantiate LFSR for input a
    LFSR lfsr_a_inst (
        .clk(clk),
        .rst(rst),
        .lfsr(lfsr_a)
    );

    // Instantiate LFSR for input b
    LFSR lfsr_b_inst (
        .clk(clk),
        .rst(rst),
        .lfsr(lfsr_b)
    );

    // Instantiate Multiplier
    multiplier multiplier_inst (
        .clk(clk),
        .reset(rst),
        .a(lfsr_a),
        .b(lfsr_b),
        .out(multiplier_out)
    );

    // Instantiate MISR
    misr_8bit misr_inst (
        .clk(clk),
        .rst(rst),
        .data(multiplier_out[7:0]),
        .misr(misr_out)
    );

    assign lfsr_out = lfsr_a; // For observing the LFSR output
    assign result = multiplier_out; // For observing the multiplier output

    // Simple BIST pass/fail condition: Check if MISR output is zero
    assign bist_pass = (misr_out == 8'h0);

endmodule
