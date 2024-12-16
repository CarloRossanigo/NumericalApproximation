function [Q1,td1,tf1,Q2,td2,tf2,iter]=dbezier(P1,d1,f1,P2,d2,f2,iter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   funzione [Q1,td1,tf1,Q2,td2,tf2,iter] = dbezier(P1,d1,f1,P2,d2,f2,iter)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   "Tracciamento" del punto di intersezione di due curve di Bèzier
%%
%%   Input : P1 matrice dei punti di controllo
%%           P2 matrice dei punti di controllo
%%           d1,f1 parametri dei punti di controllo
%%           d2,f2  parametri dei punti di controllo
%%           iter   numero delle chiamate di questa procedura
%%
%%   Ouput : 
%%           Q1 matrice dei nuovi punti di controllo
%%           Q2 matrice dei nuovi punti di controllo
%%           td1,tf1  nuovi parametri dei punti di controllo
%%           td2,tf2  nuovi parametri dei punti di controllo
%%           iter = iter + 1
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
[test,xi,xa,yi,ya]=rbezier(P1,P2);
%XQ1=XP1;YQ1=YP1;XQ2=XP2;YQ2=YP2;
Q1=P1;Q2=P2;
td1=d1;tf1=f1;td2=d2;tf2=f2;
%%
%%  Verifica la convergenza (numero di iterazioni)
%%
iter=iter+1;
itmax=20;
if ( iter > itmax )
    fprintf('\n lo schema non converge ');
    trectan(xi,xa,yi,ya,'b');
    return
end
%%
%%  Verifica la convergenza (convessità)
%%
h1=convex(P1);
h2=convex(P2);
h=max(h1,h2);
tolc=5.e-05;
if ( h < tolc )
    fprintf('\n Convergenza convessità h = %f ',h);
    fprintf('\n Iterazioni: %d ',iter);
    return
end
%%
%%  Convergenza in ascisse
%%
toll=1.e-04;
if ( abs(xa-xi) < toll )
    fprintf('\n Convergenza in x');
    fprintf('\n Iterazioni: %d ',iter);
    return
end
%%
%%  Convergenza in ordinate 
%%
if ( abs(ya-yi) < toll )
    fprintf('\n Convergenza in y');
    fprintf('\n Iterazioni: %d ',iter);
    return
end
%
%% Splitting delle curve
%%
char=int2str(iter);char=strcat('RI: ',char);
%  parametro t
tm1=(d1+f1)*0.5;
p1a=cast1(tm1,P1);
p1b=cast2(tm1,P1);
tm2=(d2+f2)*0.5;
p2a=cast1(tm2,P2);
p2b=cast2(tm2,P2);
%% test delle intersezioni
[test1,xmi1,xma1,ymi1,yma1]=rbezier(p1a,p2a);
[test2,xmi2,xma2,ymi2,yma2]=rbezier(p1b,p2a);
[test3,xmi3,xma3,ymi3,yma3]=rbezier(p1a,p2b);
[test4,xmi4,xma4,ymi4,yma4]=rbezier(p1b,p2b);
if (test1==2)
    trectan(xmi1,xma1,ymi1,yma1,'k');char1=strcat(char,'-1');text(xma1*1.05,ymi1*1.05,char1);
    %%      fprintf('\n Intersezione 1 - 1');
    %%      fprintf('\n xmi xma ymi yma %f %f %f %f ',xmi1,xma1,ymi1,yma1);
    [Q1,td1,tf1,Q2,td2,tf2,iter]=dbezier(p1a,d1,tm1,p2a,d2,tm2,iter);
elseif (test2==2)
    trectan(xmi2,xma2,ymi2,yma2,'k');char2=strcat(char,'-2');text(xma2*1.05,ymi2*1.05,char2)
    %%      fprintf('\n Intersezione  2 - 1');
    %%      fprintf('\n xmi xma ymi yma %f %f %f %f ',xmi2,xma2,ymi2,yma2);
    [Q1,td1,tf1,Q2,td2,tf2,iter]=dbezier(p1b,tm1,f1,p2a,d2,tm2,iter);
elseif (test3==2)
    trectan(xmi3,xma3,ymi3,yma3,'k');char3=strcat(char,'-3');text(xma3*1.05,ymi3*1.05,char3);
    %%      fprintf('\n Intersezione  1 - 2');
    %%      fprintf('\n xmi xma ymi yma %f %f %f %f ',xmi3,xma3,ymi3,yma3);
    [Q1,td1,tf1,Q2,td2,tf2,iter]=dbezier(p1a,d1,tm1,p2b,tm2,f2,iter);
elseif (test4==2)
    trectan(xmi4,xma4,ymi4,yma4,'k');char4=strcat(char,'-4');text(xma4*1.05,ymi4*1.05,char4);
    %%      fprintf('\n Intersezione  2 - 2');
    %%      fprintf('\n xmi xma ymi yma %f %f %f %f ',xmi4,xma4,ymi4,yma4);
    [Q1,td1,tf1,Q2,td2,tf2,iter]=dbezier(p1b,tm1,f1,p2b,tm2,f2,iter);
end
