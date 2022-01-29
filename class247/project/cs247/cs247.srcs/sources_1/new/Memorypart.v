`timescale 1ns / 1ps



module MemoryPart #(
    parameter ADDR_LEN = 4,
    parameter INSTRUCTION_LEN = 10
)
(
    input                          Clock   ,
    input                          PCload  ,
    input                          Reset   ,
    input                          IRload  ,
    input                          Jmux    ,
    output reg [INSTRUCTION_LEN:0] IR
    );

    wire [INSTRUCTION_LEN-1:0] instruction;
    reg  [ADDR_LEN - 1:0] PC = 0;
    wire [ADDR_LEN - 1:0] PC_JMP = IR[ADDR_LEN - 1:0];
    wire [ADDR_LEN - 1:0] PC_INC = PC + 1;
    wire [ADDR_LEN - 1:0] PC_NXT = Jmux ? PC_INC : PC_JMP;

    always @ (posedge Clock) begin
        if(IRload)
            IR <= instruction;
    end

    always @ (posedge Clock) begin
        if(Reset)
            PC <= 0;
        else
        if(PCload)
            PC <= PC_NXT;
    end

    ProgramMemory ProgramMemory_inst(
    .addra(PC),
    .clka(Clock),
    .douta(instruction)
);


endmodule






























