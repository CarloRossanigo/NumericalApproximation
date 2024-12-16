typedef double Real;

#include <fstream>
using namespace std;
void stampamat(Real *a,int n,int m,ofstream *prt=0);
void stampa(int d,Real t,Real *u,void(*sol)(Real *,Real),ofstream *prt=0);
