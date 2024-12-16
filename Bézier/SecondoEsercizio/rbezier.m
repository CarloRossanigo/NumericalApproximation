function [inter,xmi,xma,ymi,yma]=rbezier(P1,P2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Intersezione di due curve di Bèzier
%%   computazione dell'inviluppo rettangolare - Check dell'intersezione
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
[xmin1,xmax1,ymin1,ymax1]=drectan(P1);
[xmin2,xmax2,ymin2,ymax2]=drectan(P2);
xmi=max(xmin1,xmin2);xma=min(xmax1,xmax2);
ymi=max(ymin1,ymin2);yma=min(ymax1,ymax2);
inter=0;toll=1.e-06;
if ( xma-xmi > toll )
   inter = inter + 1 ;
end
if ( yma-ymi > toll )
   inter = inter + 1 ;
end
%% fprintf('\n Intersezione : %d %f %f %f %f ',inter,xmi,xma,ymi,yma);
