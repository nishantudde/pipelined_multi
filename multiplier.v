`timescale 1ps/1ps

module multiplier(
    input clk, reset,
    input  wire [7:0] a,
    input  wire [7:0] b,
    output reg  [15:0] out

);

reg [7:0] temp_a, temp_b;

always@(posedge clk or posedge reset) begin

    if (reset) begin
        out <= 15'd0; 
    end  
    else begin
        temp_a <= a;
        temp_b <= b;
        out <= temp_a * temp_b;
    end

end

endmodule
