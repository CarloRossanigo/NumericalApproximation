#include <iostream>
#include <math.h>
#include <fstream>
#include "funzioni/dati_problema.h"
#include "funzioni/mat_vet.h"
#include "funzioni/Runge_Kutta.h"
#include "funzioni/stampe.h"
#include "funzioni/newton.h"
using namespace std;
typedef double Real;
const Real pi=4.0*atan(1.0);
//definizione funzioni fnewton e Jfnewton per iterazioni di Newton
void effe_newton(Real *F,Real *X);
void Jeffe_newton(Real *J,Real *X);

// puntatori per puntare ai dati del problema
void(*funz_effe)(Real*, Real,Real*);                           // funzione del campo vettoriale dell'equazione differenziale
void(*dati)(Real *,Real *,Real *);                          //dati iniziali del problema
void(*butcher)(int, Real *,Real *,Real *,Real *, int *);    //coefficienti della tabella butcher
void(*Jeffe)(Real*,Real,Real*);                                //jacobiano di f

// variabili comuni
Real t,T,h,hnew;
// dimensione,dati del problema e dati del metodo
unsigned long valf;                                // variabile per il conteggio delle valutazioni di f
const int dim=3;                                           //dimensione del problema..avendo una costante del moto non è 4 ma 3
const Real p=4.0;                                           //ordine del metodo di ordine maggiore:nel caso di Lobatto 3c di ordine 4 l'ordine è.. 4
Real u[dim];
// imposto la tabella di butcher
    const int s=3; // numero di stadi
    Real b[s];
    Real bc[s];
    Real c[s];
    Real A[s][s];
    Real K[s][dim]={{0}};
    Real Z[dim];

int main ()
{
    funz_effe=eqdiff_f;                                     //funzione del campo
    dati=dati_iniziali;                                      //dati iniziali
    butcher=LOBATTO_3C_ORD4;                                //matrice dei coefficienti del metodo
    Jeffe=jf;                                               //jacobiano di f
    butcher(s,A[0],b,c,bc,0);                              // metto 0 se sono vettori che nel metodo richiamato non servono

//    test: stampo le variabili inizializzate
//    stampamat(A[0], 3.0, 3.0,0);
//    stampa(3, 10.0, c,0,0);
//    stampa(3, 10.0, b,0,0);
//    stampa(3, 10.0, bc,0,0);


    // impostiamo il file su cui stampare
    char n_file[21]= {0};
    cout << "inserire nome del file di stampa(max 20 caratteri):";
    cin >> n_file ;
    ofstream prt(n_file);
    prt.precision(14);

    // input
    dati(&t,&T,u);
//    test: stampo i dati iniziali
//    cout << "i dati iniziali:  ";
//    stampa(dim,t,u,0,0);

    h=0.01;
    Real toll=1e-14;                                        //tolleranza per il passo adattivo di lobatto
    Real r=0.5;
    unsigned long n=0;
    for(int i=0; i<s; i++)                                 //con questo for calcolo la differenza b-bc che è quello che ci serve per calcolare l'errore ad ogni passo
    {
        bc[i]=b[i]-bc[i];
//        test: stampa la differenza b-bc
//        cout << "la differenza b-bc:  " << bc[i];
    }
    // parametri newton
    Real toll_newton=1e-14;                                 //tolleranza per quando si approssima con newton i valori dei Ki
    int nitmax=20;
    valf=0;

    while(t<T)
    {
        // Costruisco K per ogni n
        for(int i=0; i<s; i++)
        {
            // iterazione Newton
            int nit =0;
            newtonVERO_sist(effe_newton,Jeffe_newton, dim*s, K[0], &nit,toll_newton,nitmax);
        }
        Real err[dim], Err;
        step(0, 1, bc, K[0], s, dim, err);                 //qui fa il prod matrice di bc con K cioè un prod vettore,poi pone err= h*[bc]*[K]
        Err=h*norm_2(err,dim);
        hnew=pow(r*toll/Err, 1.0/p)*h;                      //questa è la regola per aggiornare h
        if(Err<=toll)                                       //questo if else fa il seguente:
        {                                                   // se l'errore è meno della tolleranza stampa e aggiorna il passo al minimo fra hnew e T-t
            step(u, h, b, K[0], s, dim, u);
            t+=h;                                           //se l'errore è più della tolleranza aggiorna h ad hnew e il for continua
            h=min(hnew,T-t);
            n++;
            stampa(dim,t,u,0,&prt);
            //stampa(dim,t,u,0,0);
        }
        else
        {
            h=hnew;
        }
    }

    cout << "n step= "<<n<<endl;
    cout << "valutazioni  f = "<<valf<<endl;
    return 0;
}




void effe_newton(Real *F,Real *KK)
{
    Real Z[dim]={0};
    //costruisco i k
    for(int i=0; i<s; i++)
    {
        step(u,h,A[i],KK,s,dim,Z);
        funz_effe(F+dim*i,t+c[i]*h,Z);
        valf++;
    }
    for(int i=0; i<s*dim; i++)
    {
        F[i]=KK[i]-F[i]; // F corsivo
    }

}


void Jeffe_newton(Real *J,Real *KK)
{
    Real Jff[dim][dim];
    Real Z[dim]={0};
    //ciclo sulle righe
    for (int i=0; i<s; i++)
    {
        step(u,h,A[i],KK,s,dim,Z);
        Jeffe(Jff[0],t+c[i]*h,Z);
        valf+=dim;
        //ciclo sulle colonne
        for (int j=0; j<s; j++)
        {
            Real aij= -A[i][j]*h;
            for(int l=0; l<dim; l++)
            {
                for(int m=0; m<dim; m++)
                {
                    int indice=(i*dim+l)*(s*dim)+j*dim+m;
                    J[indice]=aij*Jff[l][m];
                }
            }
        }
    }

    //J=J+I
    int k=0;
    for (int i=0; i<s*dim; i++)
    {
        J[k]++;
        k+=s*dim+1;
    }
}


