// METODI RK-IMPLICITI
#include <iostream>
#include <math.h>
#include <fstream>
//Per macOS

#include "funzioni/mat_vet.h"
#include "funzioni/dati_problema.h"
#include "funzioni/newton.h"
#include "funzioni/stampe.h"
#include "funzioni/Runge_Kutta.h"
/*
#include "funzioni\mat_vet.h"
#include "funzioni\dati_problema.h"
#include "funzioni\newton.h"
#include "funzioni\stampe.h"
#include "funzioni\Runge_Kutta.h"
*/
using namespace std;
void f_newton(Real *F,Real *X);
void Jf_newton(Real *J,Real *X);
typedef double Real;


// puntatori al tipo di funzioni che definiscono il problema
void(*effe)(Real*, Real, Real*);
void(*dati)(Real *,Real *,Real *);
void(*butcher)(int, Real *,Real *,Real *,Real *, int *);
void(*Jf)(Real*, Real,Real*);
Real t,T,h;
unsigned long valf1=0;                                // variabile per il conteggio delle valutazioni di f
const int dim=2;                                            //dimensione del problema
Real u[dim];

// imposto la tabella di butcher
    const int ns=1; // numero di stadi
    Real b[ns];
    Real c[ns];
    Real A[ns][ns];
    Real K[ns][dim]={{0}};

int main ()
{
   // dati del problema
    effe=eqdiff_fProb4;
    dati=dati_inizialiProb4;
    Jf=jfProb4;

    butcher=EI;
    butcher(ns,A[0],b,c,0,0);
      // predispongo file stampa
    char n_file[21]={0};
    cout << "dammi nome file di stampa(max 20 caratteri)";
    cin >> n_file ;
    ofstream prt(n_file);
   prt.precision(14);
    ofstream prt2("iterazioni");
    //
    //parametri e variabili Newton
     // parametri newton
    Real toll_newton=1e-14;                                 //questa è la tolleranza per quando approssimiamo con newton i valori dei Ki
    int nitmax=20;
    // input
    dati(&t,&T,u);
    unsigned long N;
    cout << "inserisci numero di passi N  = ";
    cin >> N;
    h=(T-t)/Real(N);
    Real x[dim]={0};
    copia(x,u,dim);
// inizia ciclo sul tempo
    unsigned long n=0;
// stampa(dim,t,u,0,&prt);
    for(int i=0; i<ns; i++)
       {
             Real aux[dim]= {0};
            step(u,h,A[i],K[0],i,dim,aux);//calcolo Ki=un+h*A*Kj
            effe(K[i],t+h*c[i],aux);//memorizzo il campo f nella i-esima riga di K
           // stampa(dim,t,u,0,&prt);

        }
//stampa(dim,t,u,0,&prt);
 // inizializzo primo vettore di tentativo per Newton

  while(t+h<T)
    {
       //  Costruisco K per ogni n
        for(int i=0; i<ns; i++)
        {
            int nit=0;
            //iterazione Newton
            newtonVERO_sist(f_newton,Jf_newton, dim*ns, K[0], &nit,toll_newton,nitmax);
            prt2 <<nit<<endl;
        }

        step(u, h, b, K[0], ns, dim, u);                //
            t+=h;
                       n++;
          stampa(dim,t,u,0,&prt);
    }

    //stampa(dim,t,u,0,&prt);

    cout << "valutazioni  f = "<<valf1<<endl;
    cout <<"numero passi: "<<n<<endl;
    return 0;
}
void f_newton(Real *F,Real *KK)
{
    Real Z[dim]={0};
    //costruisco i k
    for(int i=0; i<ns; i++)
    {
        step(u,h,A[i],KK,ns,dim,Z);
        effe(F+dim*i,t+c[i]*h,Z);
        valf1++;
    }
    for(int i=0; i<ns*dim; i++)
    {
        F[i]=KK[i]-F[i]; //è la F corsivo
    }
}


void Jf_newton(Real *J,Real *KK)
{
    Real Jff[dim][dim];
    Real Z[dim]={0};
    //ciclo sulle righe
    for (int i=0; i<ns; i++)
    {
        step(u,h,A[i],KK,ns,dim,Z);
        Jf(Jff[0],t+c[i]*h,Z);
      valf1+=dim;
        //ciclo sulle colonne
        for (int j=0; j<ns; j++)
        {
            Real aij= -A[i][j]*h;
            for(int l=0; l<dim; l++)
            {
                for(int m=0; m<dim; m++)
                {
                    int indice=(i*dim+l)*(ns*dim)+j*dim+m;
                    J[indice]=aij*Jff[l][m];
                }
            }
        }
    }

    //J=J+I
    int k=0;
    for (int i=0; i<ns*dim; i++)
    {
        J[k]++;
        k+=ns*dim+1;
    }

}








