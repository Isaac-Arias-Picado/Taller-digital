module adder (
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [4:0] sum
);

    // Acarreos internos entre cada etapa
    logic c1, c2, c3, c4;

    // Bit 0
    xor (sum[0], a[0], b[0]);
    and (c1, a[0], b[0]);

    // Bit 1
    xor (sum[1], a[1] ^ b[1], c1);
    and (c2, a[1] & b[1] | c1 & (a[1] ^ b[1]), 1'b1);

    // Bit 2
    xor (sum[2], a[2] ^ b[2], c2);
    and (c3, a[2] & b[2] | c2 & (a[2] ^ b[2]), 1'b1);

    // Bit 3
    xor (sum[3], a[3] ^ b[3], c3);
    and (c4, a[3] & b[3] | c3 & (a[3] ^ b[3]), 1'b1);

    // Acarreo final
    assign sum[4] = c4;

endmodule