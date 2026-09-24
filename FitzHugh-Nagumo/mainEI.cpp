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


// pointers to the functions that defines the problem 
void(*effe)(Real*, Real, Real*);
void(*dati)(Real *,Real *,Real *);
void(*butcher)(int, Real *,Real *,Real *,Real *, int *);
void(*Jf)(Real*, Real,Real*);
Real t,T,h;
unsigned long valf1=0;                                // variables to count the evaluation of f 
const int dim=2;                                            //dimension of the problem 
Real u[dim];

// set the bucther's table 
    const int ns=1; // number of stadium 
    Real b[ns];
    Real c[ns];
    Real A[ns][ns];
    Real K[ns][dim]={{0}};

int main ()
{
   // problem data 
    effe=eqdiff_fProb4;
    dati=dati_inizialiProb4;
    Jf=jfProb4;

    butcher=EI;
    butcher(ns,A[0],b,c,0,0);
      // set the print file  
    char n_file[21]={0};
    cout << "dammi nome file di stampa(max 20 caratteri)";
    cin >> n_file ;
    ofstream prt(n_file);
   prt.precision(14);
    ofstream prt2("iterazioni");
    
     // newton parameters 
    Real toll_newton=1e-14;                                 //this is teh treshold of newton approximation od Ki values 
    int nitmax=20;
    // input
    dati(&t,&T,u);
    unsigned long N;
    cout << "inserisci numero di passi N  = ";
    cin >> N;
    h=(T-t)/Real(N);
    Real x[dim]={0};
    copia(x,u,dim);
// begin cycle on the time
    unsigned long n=0;
// stampa(dim,t,u,0,&prt);
    for(int i=0; i<ns; i++)
       {
             Real aux[dim]= {0};
            step(u,h,A[i],K[0],i,dim,aux);//calculate Ki=un+h*A*Kj
            effe(K[i],t+h*c[i],aux);//storing the field D in the i-row of K 
           // stampa(dim,t,u,0,&prt);

        }
//stampa(dim,t,u,0,&prt);
 // Initializate first vector for Newton 

  while(t+h<T)
    {
       //  Building K for each n 
        for(int i=0; i<ns; i++)
        {
            int nit=0;
            // Newton iteration
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
    //building  k
    for(int i=0; i<ns; i++)
    {
        step(u,h,A[i],KK,ns,dim,Z);
        effe(F+dim*i,t+c[i]*h,Z);
        valf1++;
    }
    for(int i=0; i<ns*dim; i++)
    {
        F[i]=KK[i]-F[i]; 
    }
}


void Jf_newton(Real *J,Real *KK)
{
    Real Jff[dim][dim];
    Real Z[dim]={0};
    //cycle on the row 
    for (int i=0; i<ns; i++)
    {
        step(u,h,A[i],KK,ns,dim,Z);
        Jf(Jff[0],t+c[i]*h,Z);
      valf1+=dim;
        //cycle on the columns
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








