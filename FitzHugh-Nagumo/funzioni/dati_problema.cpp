#include <math.h>
#include <iostream>
#include "dati_problema.h"
#include "mat_vet.h"

using namespace std;
typedef double Real;

// definisco le costanti A, B, C, M
const Real Iapp=1.5;
const  Real b=5.0;
const Real c=1.0;
const Real e=0.1;
const Real beta=0.1;
const  Real d=1.0;
const Real g=0.25;




//definizione dati del problema
void dati_inizialiProb4(Real *t_0, Real *T, Real *U_0){
    *t_0=0.0;               //tempo iniziale intervallo
    *T=200;               //tempo finale intervallo: T=200

    U_0[0]=0.6;
    U_0[1]=0.0;

}

void eqdiff_fProb4(Real *F, Real t, Real *U){

    F[0]=b*U[0]*(U[0]-beta)*(d-U[0])-c*U[1]+Iapp;
    F[1]=e*(U[0]-g*U[1]);
}

void jfProb4(Real J[], Real t,Real *U){



    J[0]=2*U[0]*b*d*U[0]-3*U[0]*U[0]*b*d-beta*d*b+2*beta*b*d*U[0];
    J[1]=-c;
    J[2]=-e;
    J[3]=-e*g;


}



