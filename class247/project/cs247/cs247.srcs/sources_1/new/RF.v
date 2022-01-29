`timescale 1ns / 1ps



module RF #(
    parameter  REGISTER_LEN = 10
)
(
    input                           Clock   ,
    input [REGISTER_LEN-1:0]        RFIN    ,
    input                           WE      ,
    input [1:0]                     WA      ,
    input                           RAE     ,
    input [1:0]                     RAA     ,
    input                           RBE     ,
    input [1:0]                     RBA     ,
    output reg [REGISTER_LEN-1:0]   A       ,
    output reg [REGISTER_LEN-1:0]   B
    );

    reg [REGISTER_LEN - 1:0] register [3:0];

    always @ (posedge Clock) begin
        if(RAE)
            A <= register[RAA];
    end   

    always @ (posedge Clock) begin
        if(RBE)
            B <= register[RBA];
    end

    always @ (posedge Clock) begin
        if(WE)
            register[WA] <= RFIN;
    end

endmodule