function p=cast3d(t,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function p=cast3d(t,P)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Costruzione del punto P(t) di una curva di Bèzier usando de Castejau
%%  P è una matrice (m+1) x 3, con i punti di controllo in 3D
%%
%%   Input : t  parameter value
%%
%%
%%   Ouput : x,y,z coordinates of P(t) in R^3
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
m=size(P,1)-1;
xx=P(:,1);yy=P(:,2);zz=P(:,3);
for kk=1:m
    xxx=xx;yyy=yy;zzz=zz;
    for k=kk:m
        xx(k+1)=(1-t)*xxx(k)+(t)*xxx(k+1);
        yy(k+1)=(1-t)*yyy(k)+(t)*yyy(k+1);
        zz(k+1)=(1-t)*zzz(k)+(t)*zzz(k+1);
    end
end
p=[xx(m+1),yy(m+1),zz(m+1)];
