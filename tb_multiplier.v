`timescale 1ps/1ps

module tb_multiplier();

reg [7:0] a,b;
reg clk=0, reset;

wire [15:0] out;

multiplier DUT (
    .clk(clk),
    .reset(reset),    
    .a(a),
    .b(b),
    .out(out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 0;
    #5 reset = 1;
    #5 reset = 0;
end

initial begin
    #10 a = 1;
    #10 b = 1;
    #10 a = 2;
    #10 b = 2;
    #10 a = 3;
    #10 b = 3;
    #10 a = 4;
    #10 b = 4;
    #10 a = 5;
    #10 b = 5;
    #10 a = 6;
end

endmodule