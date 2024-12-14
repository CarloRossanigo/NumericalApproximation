#include "mat_vet.h"
#include "newton.h"
#include <iostream>
#include <math.h>
using namespace std;
typedef double Real;
void newton_sist(void(*effe)(Real*,Real*),void(*Jeffe)(Real*,Real*), int n, Real x[], int *nit, Real toll, int nitmax){
   Real J[n][n],F[n],delta[n];
    int P[n];
    for(int i=0;i<n;i++)
      {
          delta[i]=0;
            F[i]=0;
            P[i]=0;
    for(int j=0;j<n;j++)
        J[i][j]=0;
      }
    Jeffe(J[0],x);
    lu(J[0],P,n);

    // inizio ciclo di Newton
    Real delta1=1e200;
    Real delta2=0.0;
    *nit = 0;
    do{
        *nit +=1;
        effe(F,x);
        for (int i=0; i<n; i++){
            F[i]=-F[i];
        }
        risist(J[0],P,delta,F,n);
        delta2=norm_2(delta,n);
        //cout << delta2<<endl;
        if(delta2>delta1) return;
        else delta1=delta2;
        for (int i=0; i<n; i++){
            x[i]+=delta[i];
        }
    }
    while((delta1>toll)&&(*nit<nitmax));
    if(*nit==nitmax){
        cout << "Newton non converge in "<< nitmax << " iterazioni"<<endl;
        return;
    }
}
void newtonVERO_sist(void(*effe)(Real*,Real*),void(*Jeffe)(Real*,Real*), int n,Real x[], int *nit, Real toll, int nitmax){
    Real J[n][n],F[n],delta[n];
   // int P[n];
    for(int i=0;i<n;i++)
      {
          delta[i]=0;
            F[i]=0;
           // P[i]=0;
    for(int j=0;j<n;j++)
        J[i][j]=0;
      }
    // inizio ciclo di Newton
    Real delta1=1e200;
    Real delta2=0.0;
    *nit = 0;
    do{
        Jeffe(J[0],x);
//        int P[n]= {0};
//        lu(J[0],P,n);
        *nit +=1;
        effe(F,x);
        for (int i=0; i<n; i++){
            F[i]=-F[i];
        }
//       risist(J[0],P,delta,F,n);
        gauss(J[0],delta, F, n);
        delta2=norm_2(delta,n);
        //cout << delta2<<endl;
        if(delta2>delta1)return;
        else delta1=delta2;
        for (int i=0; i<n; i++){
            x[i]+=delta[i];
        }
    }
    while((delta1>toll)&&(*nit<nitmax));
    if(*nit==nitmax){
        cout << "Newton non converge in "<< nitmax << " iterazioni"<<endl;
        return;
    }
}
