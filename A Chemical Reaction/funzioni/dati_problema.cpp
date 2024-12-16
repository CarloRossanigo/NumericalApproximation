#include <math.h>
#include <iostream>
#include "dati_problema.h"
#include "mat_vet.h"

using namespace std;
typedef double Real;

// definisco le costanti A, B, C, M
const Real A=7.89*pow(10,-10);
const Real B=1.1*pow(10,7);
const Real C=1.13*pow(10,3);
const Real M=pow(10,6);


//definizione del campo f dell'equazione differenziale
void eqdiff_f(Real F[], Real t, Real U[]){

    F[0]=-A*U[0]-B*U[0]*U[2];
    F[1]= A*U[0]-M*C*U[1]*U[2];
    F[2]= A*U[0]-B*U[0]*U[2]-M*C*U[1]*U[2]+C*(U[1]-U[2]);

}

//definizione dati del problema
void dati_iniziali(Real *t_0, Real *T, Real U_0[]){

    *t_0=0.0;               //tempo iniziale intervallo
    *T=pow(10,10);          //tempo finale intervallo 10^10...cambiare la potenza di 10 per ultima parte relazione: T=10;T=10^5;T=10^9

    U_0[0]=1.76*pow(10,-3);
    U_0[1]=0.0;
    U_0[2]=0.0;
}

//Matrice Jacobiana di f
void jf(Real J[], Real t,Real *U){

    J[0]=-A-B*U[2];
    J[1]=0.0;
    J[2]=-B*U[0];

    J[3]=A;
    J[4]=-M*C*U[2];
    J[5]=-M*C*U[1];

    J[6]=A-B*U[2];
    J[7]=-M*C*U[2]+C;
    J[8]=-B*U[0]-M*C*U[1]-C;

}
