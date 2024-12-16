function Q=cast2(t,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   funzione Q=cast2(t,P)
%%   Inviluppo convesso di una curva di Bèzier
%%   costruisco i punti di controllo
%%   Secondo step: t in [0.5,1]
%%
%%   Input  : t valore del parametro
%%            P matrice punti di controllo
%%
%%   Output : Q matrice punti di controllo
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
m=size(P,1)-1;  %P è la matrice 2D di controllo (XP, YP)
XP = P(:,1)';  % Estraggo la colonna X dalla matrice P
YP = P(:,2)';  % Estraggo la colonna Y dalla matrice P

xx = XP;  % Assegno XP alla variabile temporanea xx
yy = YP;  % Assegno YP alla variabile temporanea yy

for k = 1:m+1
    xx(m+2-k) = XP(k);  % Inizializza i valori nella variabile xx
    yy(m+2-k) = YP(k);  % Inizializza i valori nella variabile yy
end

for kk = 1:m
    xxx = xx;  
    yyy = yy;  
    XPP(m+2-kk) = xx(kk);  
    YPP(m+2-kk) = yy(kk);  

    for k = kk:m
        xx(k+1)=t*xxx(k)+(1.-t)*xxx(k+1);
        yy(k+1)=t*yyy(k)+(1.-t)*yyy(k+1);
    end
end

XPP(1) = xx(m+1);  % Assegna il valore finale a XPP
YPP(1) = yy(m+1);  % Assegna il valore finale a YPP

% La funzione ritorna un output XPP e YPP
Q = [XPP', YPP'];  
