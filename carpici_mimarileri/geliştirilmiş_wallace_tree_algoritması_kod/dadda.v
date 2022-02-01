`timescale 1ns / 1ps
module dadda(a,b,z);
    
    input  [07:00] a;                                   // 8-bit a
    input  [07:00] b;                                   // 8-bit b
    wire    [15:00] x;                                   // sum high
    wire    [15:00] y;                                   
    output [15:00] z;                                   
                                     
    wire s100,c100,s101,c101,s103,c103,s104,c104,s105,c105,s200,c200s201,c201,s202,c202,s203,c203,s204,c204,
         s205,c205,s206,c206,s207,c207,s208,c208,s209,c209,s210,c210,s211,c211,s212,c212,s213,c213,s300,c300,
         s301,c301,s302,c302,s303,c303,s304,c304,s305,c305,s306,c306,s307,c307,s400,c400,s401,c401,s402,c402,
         s403,c403,s404,c404,s405,c405,s406,c406,s407,c407,s408,c408,s409,c409,s410,c410,s411,c411;
         
    reg   [07:00] p [07:00];                           // p[i][j]
    parameter zero = 1'b0;                              // constant 0
    integer i, j;
    
    always @ * begin
        for (i = 0; i < 8; i = i + 1)
            for (j = 0; j < 8; j = j + 1)
                p[i][j] = a[i] & b[j];                  // p[i][j]=a[i]&b[j]
    end
    
    //1. ADIM
    ha_structural i_000 (p[6][0],p[5][1],            s100,c100);
    
    fa_structural i_001 (p[7][0],p[6][1], p[5][2],   s101,c101);
    ha_structural i_002 (p[4][3],p[3][4],            s102,c102);
    
    fa_structural i_003 (p[7][1],p[6][2], p[5][3],   s103,c103);
    ha_structural i_004 (p[4][4],         p[3][5],   s104,c104);
    
    fa_structural i_005 (p[7][2],p[6][3], p[5][4],   s105,c105);
    
    //2.ADIM
    ha_structural i_100 (p[4][0],p[3][1],            s200,c200);
    
    fa_structural i_101 (p[5][0],p[4][1], p[3][2],   s201,c201);
    ha_structural i_102 (p[2][3],p[1][4],            s202,c202);
    
    fa_structural i_103 (s100,   p[4][2], p[3][3],   s203,c203);
    fa_structural i_104 (p[2][4],p[1][5], p[0][6],   s204,c204);
    
    fa_structural i_105 (c100,   s101 , s102,        s205,c205);
    fa_structural i_106 (p[2][5],p[1][6], p[0][7],   s206,c206);
    
    fa_structural i_107 (s103,  c101 ,c102,          s207,c207);
    fa_structural i_108 (s104   ,p[2][6], p[1][7],   s208,c208);
    
    fa_structural i_109 (c103,  s105 , p[4][5],      s209,c209);
    fa_structural i_110 (c104   ,p[3][6], p[2][7],   s210,c210);
    
    fa_structural i_111 (p[7][3],  c105 , p[6][4],   s211,c211);
    fa_structural i_112 (p[5][5]   ,p[4][6], p[3][7],s212,c212);
    
    fa_structural i_113 (p[7][4],  p[6][5] , p[5][6],s213,c213);
    
    //3. ADIM
    ha_structural i_200 (p[3][0],p[2][1],             s300,c300);
    fa_structural i_201 (s200,  p[2][2] , p[1][3],    s301,c301);               
    fa_structural i_202 (c200,  s201 , s202      ,    s302,c302);                 
    fa_structural i_203 (s203,  c201 , c202      ,    s303,c303);                   
    fa_structural i_204 (c203,  s205 , s206      ,    s304,c304);                 
    fa_structural i_205 (s207,  c205 , c206      ,    s305,c305);                
    fa_structural i_206 (c207,  s209 , s210      ,    s306,c306);                
    fa_structural i_207 (s211,  c209 , c210      ,    s307,c307);                  
    fa_structural i_208 (c211,  s213 , p[4][7]   ,    s308,c308);                     
    fa_structural i_209 (p[7][5],c213 ,p[6][6]   ,    s309,c309);
    
    //4.ADIM
    ha_structural i_300 (p[2][0],p[1][1],             s400,c400);
    fa_structural i_301 (s300, p[1][2],p[0][3],       s401,c401);
    fa_structural i_302 (c300, s301   ,p[0][4],       s402,c402);
    fa_structural i_303 (s302, c301   ,p[0][5],       s403,c403);
    fa_structural i_304 (c302,  s303   ,s204   ,      s404,c404);
    fa_structural i_305 (s304,  c303   ,c204   ,      s405,c405);
    fa_structural i_306 (c304,  s305   ,s208   ,      s406,c406);
    fa_structural i_307 (s306,  c305   ,c208   ,      s407,c407);
    fa_structural i_308 (c306,  s307   ,s212   ,      s408,c408);
    fa_structural i_309 (s308,  c307   ,c212   ,      s409,c409);
    fa_structural i_310 (c308,  s309   ,p[5][7]   ,   s410,c410);
    fa_structural i_311 (p[7][6],  c309   ,p[6][7],   s411,c411);
    
    
    
    //TOPLAMA
    assign x[0]  = p[0][0];                     assign y[0]   = zero;         
    assign x[1]  = p[1][0];                     assign y[1]   = p[0][1];
    assign x[2]  = s400;                        assign y[2]   = p[0][2];
    assign x[3]  = c400;                        assign y[3]   = s401;
    assign x[4]  = s402;                        assign y[4]   = c401;
    assign x[5]  = c402;                        assign y[5]   = s403;
    assign x[6]  = s404;                        assign y[6]   = c403;
    assign x[7]  = c404;                        assign y[7]   = s405;
    assign x[8]  = s406;                        assign y[8]   = c405;
    assign x[9]  = c406;                        assign y[9]   = s407;
    assign x[10] = s408;                        assign y[10]  = c407;
    assign x[11] = c408;                        assign y[11]  = s409;
    assign x[12] = s410;                        assign y[12]  = c409;
    assign x[13] = c410;                        assign y[13]  = s411;
    assign x[14] = p[7][7];                     assign y[14]  = c411;
    assign x[15] = zero;                        assign y[15] = zero;  
    
    assign z = x + y;
endmodule
