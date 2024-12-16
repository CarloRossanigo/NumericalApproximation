function Q=cast1(t,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   funzione Q=cast1(t,P)
%%   Inviluppo convesso di una curva di Bèzier
%%   costruisco i punti di controllo
%%   Primo step: t in [0.,0.5]
%%
%%   Input  : t valore del parametro
%%            P matrice punti di controllo
%%
%%   Output : Q matrice punti di controllo
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
m=size(P,1)-1;  % P è la matrice 2D di controllo (XP, YP)
XP = P(:,1)';  % Estraggo la colonna X dalla matrice P
YP = P(:,2)';  % Estraggo la colonna Y dalla matrice P
XPP=XP;
YPP=YP; 
xx=XP;yy=YP;
XPP(1)=xx(1);YPP(1)=yy(1);
for kk=1:m
    xxx=xx;
    yyy=yy;
    for k=kk:m
        xx(k+1)=(1.-t)*xxx(k)+t*xxx(k+1);
        yy(k+1)=(1.-t)*yyy(k)+t*yyy(k+1);
    end
    XPP(kk+1)=xx(kk+1);YPP(kk+1)=yy(kk+1);
end
Q=[XPP',YPP'];
