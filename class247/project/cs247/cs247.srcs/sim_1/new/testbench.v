`timescale 1ns / 1ps



module testbench(

    );

reg Clock = 0;
always #10 Clock = ~Clock;

reg [9:0] DataIn = 10;
wire [9:0] DataOut;


CPU inst(
    .Clock(Clock),
    .DataIn(DataIn),
    .DataOut(DataOut)
);


endmodule