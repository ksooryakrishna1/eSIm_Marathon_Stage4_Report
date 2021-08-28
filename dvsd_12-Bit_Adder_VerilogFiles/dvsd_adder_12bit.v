//12 bit adder
//module CLA12bit_newway(clk, CE, A,B, Cin, S,Cout);
module dvsd_adder_12bit(CE, A,B, Cin, S,Cout);
//input clk;
input CE;
input [11:0] A,B;
input Cin;
output reg [11:0] S;
output reg Cout;

//wire [3:0] p,g,c;
wire [11:0] p,g,c;
//reg [11:0] S;
//reg Cout;
//p = A exor B
//g=AB
//S = p exor c
//Ci+1=gi + PiCi

always @(A, B, Cin) begin
        if (CE) begin
      //    p = A ^ B;
      //    g = A & B;
              p[0] = A[0] ^ B[0];
           	  p[1] = A[1] ^ B[1];
           	  p[2] = A[2] ^ B[2];
           	  p[3] = A[3] ^ B[3];
          	  p[4] = A[4] ^ B[4];
           	  p[5] = A[5] ^ B[5];
           	  p[6] = A[6] ^ B[6];
           	  p[7] = A[7] ^ B[7];
           	  p[8] = A[8] ^ B[8];
           	  p[9] = A[9] ^ B[9];
              p[10] = A[10] ^ B[10];
           	  p[11] = A[11] ^ B[11];


           	  g[0] = A[0] & B[0];
           	  g[1] = A[1] & B[1];
           	  g[2] = A[2] & B[2];
           	  g[3] = A[3] & B[3];
              g[4] = A[4] & B[4];
           	  g[5] = A[5] & B[5];
           	  g[6] = A[6] & B[6];
           	  g[7] = A[7] & B[7];
           	  g[8] = A[8] & B[8];
           	  g[9] = A[9] & B[9];
              g[10] = A[10] & B[10];
           	 g[11] = A[11] & B[11];



          c[0] = Cin;
          c[1] = g[0]|(p[0]&c[0]);
          c[2] = g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
          c[3] = g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
          c[4] = g[3] | (p[3] & c[3]);
          c[5] = g[4] | (p[4] & c[4]);
          c[6] = g[5] | (p[5] & c[5]);
          c[7] = g[6] | (p[6] & c[6]);
          c[8] = g[7] | (p[7] & c[7]);
          c[9] = g[8] | (p[8] & c[8]);
          c[10] = g[9] | (p[9] & c[9]);
          c[11] = g[10] | (p[10] & c[10]);
          Cout = g[11] | (p[11] & c[11]);

        //  S = p^c;

         S[0] = p[0] ^ Cin;
         S[1] = p[1] ^ c[1];
         S[2] = p[2] ^ c[2];
         S[3] = p[3] ^ c[3];
         S[4] = p[4] ^ c[4];
         S[5] = p[5] ^ c[5];
         S[6] = p[6] ^ c[6];
         S[7] = p[7] ^ c[7];
         S[8] = p[8] ^ c[8];
         S[9] = p[9] ^ c[9];
         S[10] = p[10] ^ c[10];
        S[11] = p[11] ^ c[11];
        end
end
endmodule
