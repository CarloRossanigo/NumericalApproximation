function [xmin,xmax,ymin,ymax]=drectan(P);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   funzione [xmin,xmax,ymin,ymax]=drectan(P) 
%
%%   calcolo l'inviluppo rettangolare dei punti di controllo
%%   
%%   Input : P matrice dei punti di controllo
%%
%%   Ouput : xmin,xmax,ymin,ymax coordinate dei vertici
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
XP=P(:,1)';YP=P(:,2)';
xmin=min(XP);xmax=max(XP);
ymin=min(YP);ymax=max(YP);
