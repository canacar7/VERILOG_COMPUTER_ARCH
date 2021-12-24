module wallace_32x32(a,b,z);                             // 26*26 wt product
    input  [15:00] a;                                    // 26 bits
    input  [15:00] b;                                    // 26 bits
    output [31:00] z;                                    // product
    wire   [31:07] x;                                    // sum high
    wire   [31:07] y;                                    // carry high
    wire   [31:07] z_high;                               // product high
    wire   [06:00] z_low;                                // product low
    islemler aktif (a, b, x, y, z_low);        			9// partial product
    assign z_high = x + y;
    assign z = {z_high,z_low};                           // product
endmodule