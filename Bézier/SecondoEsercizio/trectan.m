function trectan(xmi,xma,ymi,yma,color) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   funzione trectan(xmi,xma,ymi,yma,color) 
%%   
%%   Input  : xmin,xmax,ymin,ymax coordinate dei vertici
%%
%%   Output : visualizzazione del rettangolo
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
xx(1)=xmi;xx(2)=xma;
xx(3)=xx(2);xx(4)=xx(1);xx(5)=xx(1);
yy(1)=ymi;yy(2)=yy(1);
yy(3)=yma;yy(4)=yy(3);yy(5)=yy(1);
plot(xx,yy,color,LineWidth=2)