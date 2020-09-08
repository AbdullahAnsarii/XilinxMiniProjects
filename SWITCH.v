module SWITCH(
    input x1,
    input x2,
    input x3,
    output y
    );
wire y1;
assign y1 = x1^x2;
assign y = y1^x3;

endmodule