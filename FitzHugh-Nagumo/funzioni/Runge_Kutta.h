typedef  double Real;
void step(Real *v, Real h, Real *a, Real *K, int stadi, int d, Real *y);
using namespace std;
// Explicit methods
void EE(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void EM(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void RK4(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void HEUN(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void RKFEHL5(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
// DIRK methods : Diagunally implicit with diagunal eleemnts null or with the same value 
void EI(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void CN(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void GAUSS1(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);

// implicit methods NOT diagunal 
void GAUSS2(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void GAUSS3(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void RADAU2(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void RADAU3(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);

// Immersed Explicit Methods 
void RKFEHL54(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void EEHEUN(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);
void DP87(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);


// Implicit DIRK methods (adaptive)
void HAMMER(int ns, Real *A, Real *b, Real *c, Real *bc,int *Ind);

// Implicit NOT Diagunal Immersed methods (adaptive) 
void LOBATTO_3C_ORD2(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
void LOBATTO_3C_ORD4(int ns, Real *A, Real *b, Real *c, Real *bc, int *Ind);
