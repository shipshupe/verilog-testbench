`timescale 10ns / 1ns 

module CD4029B(
    input wire PRESET_ENABLE,
    input wire CLOCK,
    input wire [4:1] JAM,
    output reg [4:1] Q
    );

    always @(posedge CLOCK)
    begin
        if(PRESET_ENABLE == 1'b1)
            Q <= #4 4'b0000;
        else
            Q <= #4 Q + 4'b0001;
    end

endmodule

module testbench;
    reg clk;
    reg reset;
    
    CD4029B counter(
        .PRESET_ENABLE(reset),
        .CLOCK(clk),
        .JAM(4'b0000)
    );

    wire ctval = counter.Q[1];

    initial begin
        clk = 0;
        reset = 1;
        #10;
        clk = 1;
        #10;
        clk = 0;
        reset = 0;
        //$display("%d\n",clk);
        #8000;
        $finish;
    end
    
    always begin
        #10;
        clk = ~clk;
        $display("%d-%d\n",clk,counter.Q);
    end

endmodule