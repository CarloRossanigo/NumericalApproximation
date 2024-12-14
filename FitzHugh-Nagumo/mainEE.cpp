#include <iostream>
#include <math.h>
#include <fstream>
//Per macOS
#include "funzioni/dati_problema.h"
#include "funzioni/mat_vet.h"
#include "funzioni/Runge_Kutta.h"
#include "funzioni/stampe.h"

/*
#include "funzioni\dati_problema.h"
#include "funzioni\mat_vet.h"
#include "funzioni\Runge_Kutta.h"
#include "funzioni\stampe.h"
*/
using namespace std;
typedef double Real;
// puntatori al tipo di funzioni che definiscono il problema
void(*effe)(Real*, Real,Real*);
void(*dati)(Real *,Real *,Real *);
void(*butcher)(int, Real *,Real *,Real *,Real *, int *);
// variabili comuni
Real t,T,h;
// dimensioni del problema
const int d=2;
Real u[d];
// dimensiono matrice e vettori Butcher
const int ns=1;
Real b[ns];
Real c[ns];
Real A[ns][ns];// matrice
unsigned long valf=0;
int main ()
{
    butcher=EE;
    effe=eqdiff_fProb4;
    dati=dati_inizialiProb4;

    // predispongo file stampa
    char n_file[21]= {0};
    cout << "dammi nome file di stampa(max 20 caratteri)";
    cin >> n_file ;
    ofstream prt(n_file);
    prt.precision(14);
    cout.precision(14);

    // carico coefficienti e dati iniziali

    butcher(ns,A[0],b,c,0,0);
    dati(&t,&T,u);
    unsigned long N;
    cout << "inserisci numero di passi N  = ";
    cin >> N;
    h=(T-t)/Real(N);

//  qui inizia ciclo sul tempo

    for(unsigned long n=1; n<=N; n++)
    {

        Real K[ns][d]= {{0}};
        for(int i=0; i<ns; i++)
        {
            Real aux[d]= {0};
            step(u,h,A[i],K[0],i,d,aux);
            effe(K[i],t+h*c[i],aux);
            valf++;
        }
        step(u,h,b,K[0],ns,d, u);


        t+=h;
         stampa(d,t,u,0,&prt);
    }
// stampa  valore finale
   // stampa(d,t,u,0); // su terminale
   // stampa(d,t,u,0,&prt); //stampa su file
     cout<<"Numero Valutazioni: "<<valf<<endl;

    return 0;
}
