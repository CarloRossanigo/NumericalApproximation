
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Matlab: codice per l'algoritmo di Intersezione di due curve di Bèzier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear all; 
close all;

% definizione dei punti di controllo
ktest=3;

switch ktest
    case 1
       P1=[0. 0.; 1. 1.; 2. 0.0];
       P2=[0. 2.5; 1. -2.; 2. 0.5];
    case 2 
        P1=[-1. 0.;0. 1;1.5 1.5;2.5 -1.;3. 0.; 2. 2.5];
        P2=[0. 2.5;1. 2.25; 2. 1.5; 1. 0.25;0. -0.5];
    case 3
        P1=[-1. 0.;1. 1.5;2. 2.;3. -1.;-1. 0.];
        P2=[0. 2.5; 1. 2.;2. 1.5;1. 0.5;0. -0.5];
end
XP3=P1(:,1);YP3=P1(:,2);XP4=P2(:,1);YP4=P2(:,2);

n=100;
t=linspace(0,1,n);
p=CAGD_Bezier(P1,t);
q=CAGD_Bezier(P2,t);
% imposto i rettangoli
[xmin1,xmax1,ymin1,ymax1]=drectan(P1);
[xmin2,xmax2,ymin2,ymax2]=drectan(P2);
dx=0.75;dy=0.75;
xmin=min(xmin1,xmin2)-dx;xmax=max(xmax1,xmax2)+dx;
ymin=min(ymin1,ymin2)-dy;ymax=max(ymax1,ymax2)+dy;
%% Grafico delle curve

CAGD_plot(p,P1);

CAGD_plot(q,P2);

figure();hold on;
plot(p(:,1),p(:,2),'g', 'LineWidth', 2);
hold on;
plot([P1(:,1);P1(1,1)],[P1(:, 2); P1(1, 2)],'--','LineWidth', 2);
plot([P1(:,1);P1(1,1)],[P1(:, 2); P1(1, 2)],'ro','MarkerFaceColor','r');
plot(q(:,1),q(:,2),'y', 'LineWidth', 2);
plot([P2(:,1);P2(1,1)],[P2(:, 2); P2(1, 2)],'--','LineWidth', 2);
plot([P2(:,1);P2(1,1)],[P2(:, 2); P2(1, 2)],'ro','MarkerFaceColor','y');
hold on;
%%
%% Primo step: verifico se esiste l'intersezione
%%
[test,xmi,xma,ymi,yma]=rbezier(P1,P2);
if (test==2) 
  trectan(xmi,xma,ymi,yma,'k'); 
  hold on;
else
   fprintf('\n Non è stata trovata alcuna intersezione ');
   stop
end

grid on
yticks(-2:3)
title('Intersezione di due curve : prima vista','FontSize',24);
hold off ;
 %%  Secondo step : ricerca del punto di intersezione

figure(); hold on;
axis([xmin,xmax,ymin,ymax]);

% iterazioni
 d1=0.;f1=1.;d2=0.;f2=1.;iter=0;
[Q1,d1,f1,Q2,d2,f2,iter]=dbezier(P1,d1,f1,P2,d2,f2,iter);
 grid on
 yticks(-2:3)
 title('Intersezione di due curve: algoritmo','FontSize',24); hold off ;

 %%  Terzo step : calcolo il punto di intersezione come punto comune dei due segmenti
XQ1=Q1(:,1)';YQ1=Q1(:,2)';XQ2=Q2(:,1)';YQ2=Q2(:,2)';
A=zeros(2,2);b=zeros(2,1);np1=size(XQ1,2);np2=size(XQ2,2);
A(1,1)=XQ1(np1)-XQ1(1);A(1,2)=-XQ2(np2)+XQ2(1);b(1)=XQ2(1)-XQ1(1);
A(2,1)=YQ1(np1)-YQ1(1);A(2,2)=-YQ2(np2)+YQ2(1);b(2)=YQ2(1)-YQ1(1);
delta=A(1,1)*A(2,2)-A(2,1)*A(1,2);
delt1=b(1)*A(2,2)-b(2)*A(1,2);
delt2=A(1,1)*b(2)-A(2,1)*b(1);
c(1)=delt1/delta;c(2)=delt2/delta;
XI1=XQ1(1)+c(1)*(XQ1(np1)-XQ1(1));YI1=YQ1(1)+c(1)*(YQ1(np1)-YQ1(1));
XI2=XQ2(1)+c(2)*(XQ2(np2)-XQ2(1));YI2=YQ2(1)+c(2)*(YQ2(np2)-YQ2(1));
fprintf('\n punto di intersezione:  %f %f %f %f ',XI1,YI1,XI2,YI2);
 %%  Quarto step : check grafico
figure(); hold on;
[test,xmi,xma,ymi,yma]=rbezier(Q1,Q2); 
dx=(xma-xmi)*0.1;dy=(yma-ymi)*0.1;
axis([xmi-dx,xma+dx,ymi-dy,yma+dy]);
q1=CAGD_Bezier(Q1,t);
q2=CAGD_Bezier(Q2,t);
% Grafici
plot(q1(:,1),q1(:,2),'g', 'LineWidth', 2);
hold on;
plot([Q1(:,1);Q1(1,1)],[Q1(:, 2); Q1(1, 2)],'--','LineWidth', 2);
plot(q2(:,1),q2(:,2),'b', 'LineWidth', 2);
plot([Q2(:,1);Q2(1,1)],[Q2(:, 2); Q2(1, 2)],'--','LineWidth', 2);
% 
 %%  Vista del punto di intersezione
 text(XI1,YI1,'X');text(XI2,YI2,'O');
title('Intersezione di due curve vista localmente','FontSize',24);

 grid on
 yticks(-2:3)
 hold off ;

%%  Quinto step : calcolo dei valori
P3=[XQ1;YQ1]';P4=[XQ2;YQ2]';
fprintf('\n Intersezione di due curve : formula locale');
tx1=(XI1-XQ1(1)')/(XQ1(np1)'-XQ1(1)');ty1=(YI1-YQ1(1)')/(YQ1(np1)'-YQ1(1)');
XXI1=CAGD_casteljau(tx1,P3);XXXI1=CAGD_casteljau(ty1,P3);
fprintf('\n Valori per la prima curva (calcolati con x) : %f %f %f %f %f ',tx1,XI1,YI1,XXI1(1,1),XXI1(1,2));
fprintf('\n Valori per la prima curva (calcolati con y) : %f %f %f %f %f ',ty1,XI1,YI1,XXXI1(1,1),XXXI1(1,2));
tx2=(XI2-XQ2(1))/(XQ2(np2)-XQ2(1));ty2=(YI2-YQ2(1))/(YQ2(np2)-YQ2(1));
XXI2=CAGD_casteljau(tx2,P4);XXXI2=CAGD_casteljau(ty2,P4);
fprintf('\n Valori per la seconda curva(calcolati con x) : %f %f %f %f %f ',tx2,XI2,YI2,XXI2(1,1),XXI2(1,2));
fprintf('\n Valori per la seconda curva(calcolati con y) : %f %f %f %f %f ',ty2,XI2,YI2,XXXI2(1,1),XXXI2(1,2));
%%  Sesto step : vista globale
figure(); hold on;
 [test,xmi,xma,ymi,yma]=rbezier(P1,P2); 
 axis([xmin,xmax,ymin,ymax]);
 plot(p(:,1),p(:,2),'g', 'LineWidth', 2);
hold on;
plot([P1(:,1);P1(1,1)],[P1(:, 2); P1(1, 2)],'--','LineWidth', 2);
plot(q(:,1),q(:,2),'y', 'LineWidth', 2);
plot([P2(:,1);P2(1,1)],[P2(:, 2); P2(1, 2)],'--','LineWidth', 2);


 xx=(XXI1(1)+XXI2(1))*0.5;yy=(XXI1(2)+XXI2(2))*0.5;
 dx=(xmax-xmin)/100;dy=(ymax-ymin)/100;
 trectan(xx-dx,xx+dx,yy-dy,yy+dy,'r'); 
 grid on
 yticks(-2:3)
 title('Intersezione di due curve : vista globale','FontSize',24); 
 hold off ;
 %
%%  Settimo step : calcolo i valori del parametro
%%
 fprintf('\n Intersezione: formula globale ');

p1=CAGD_Bezier(P1,t);p2=CAGD_Bezier(P2,t);
[xmin1,xmax1,ymin1,ymax1]=drectan(P1);
[xmin2,xmax2,ymin2,ymax2]=drectan(P2);
tollx=1.e-03;tolly=1.e-03;test1=0;test2=0;
X1=p1(:,1);Y1=p1(:,2);X2=p2(:,1);Y2=p2(:,2); 
for k=1:size(t,2)-1
if abs((X1(k)-XI1)*(XI1-X1(k+1))) < tollx * (xmax1-xmin1) * (xmax1-xmin1)
if abs((Y1(k)-YI1)*(YI1-Y1(k+1))) < tolly * (ymax1-ymin1) * (ymax1-ymin1)
tx1=t(1,k+1)*(XI1-X1(k))/(X1(k+1)-X1(k))+t(1,k)*(X1(k+1)-XI1)/(X1(k+1)-X1(k));
ty1=t(1,k+1)*(YI1-Y1(k))/(Y1(k+1)-Y1(k))+t(1,k)*(Y1(k+1)-YI1)/(Y1(k+1)-Y1(k));
test1=1;
% fprintf('\n Punto di intersezione sulla prima curva : %f %f %d ',tx1,ty1,k);
end;end;end;
% fprintf('\n Verifico la posizione sulla prima curva : %d ',test1);
for k=1:size(t,2)-1
if abs((X2(k)-XI2)*(XI2-X2(k+1))) < tollx * (xmax2-xmin2) * (xmax2-xmin2)
if abs((Y2(k)-YI2)*(YI2-Y2(k+1))) < tolly * (ymax2-ymin2) * (ymax2-ymin2)
tx2=t(1,k+1)*(XI2-X2(k))/(X2(k+1)-X2(k))+t(1,k)*(X2(k+1)-XI2)/(X2(k+1)-X2(k));
ty2=t(1,k+1)*(YI2-Y2(k))/(Y2(k+1)-Y2(k))+t(1,k)*(Y2(k+1)-YI2)/(Y2(k+1)-Y2(k));
test2=1;
%fprintf('\n Punto di intersezione sulla seconda curva : %f %f %d ',tx2,ty2,k);
end;end;end;
% fprintf('\n Verifico la posizione sulla seconda curva : %d ',test2);
XXI1x=CAGD_casteljau(tx1,P1);XXI1y=CAGD_casteljau(ty1,P1);
fprintf('\n Punto di intersezione sulla prima curva (calcolato con x) : %f %f %f %f %f ',tx1,XI1,YI1,XXI1x(1,1),XXI1x(1,2));
fprintf('\n Punto di intersezione sulla prima curva (calcolato con y) : %f %f %f %f %f ',ty1,XI1,YI1,XXI1y(1,1),XXI1y(1,2));
XXI2x=CAGD_casteljau(tx2,P2);XXI2y=CAGD_casteljau(ty2,P2);
fprintf('\n Punto di intersezione sulla seconda curva (calcolato con x) : %f %f %f %f %f ',tx2,XI2,YI2,XXI2x(1,1),XXI2x(1,2));
fprintf('\n Punto di intersezione sulla seconda curva (calcolato con y) : %f %f %f %f %f \n',ty2,XI2,YI2,XXI2y(1,1),XXI2y(1,2));

figure(); hold on;
[test,xmi,xma,ymi,yma]=rbezier(P1,P2);
 axis([xmin,xmax,ymin,ymax]);

  plot(p(:,1),p(:,2),'g', 'LineWidth', 2);
hold on;
plot([P1(:,1);P1(1,1)],[P1(:, 2); P1(1, 2)],'--','LineWidth', 2);
plot(q(:,1),q(:,2),'y', 'LineWidth', 2);
plot([P2(:,1);P2(1,1)],[P2(:, 2); P2(1, 2)],'--','LineWidth', 2);


dx=(xmax-xmin)/100;dy=(ymax-ymin)/100;
XCr(1)=XXI1x(:,1)-dx;XCr(2)=XXI1x(:,1)+dx;YCr(1)=XXI1x(:,2);YCr(2)=XXI1x(:,2);
plot(XCr,YCr,'r',LineWidth=2);
XCr(1)=XXI1x(:,1);XCr(2)=XXI1x(:,1);YCr(1)=XXI1x(:,2)-dy;YCr(2)=XXI1x(:,2)+dy;
plot(XCr,YCr,'r',LineWidth=2);
XCr(1)=XXI2x(:,1)-dx;XCr(2)=XXI2x(:,1)+dx;YCr(1)=XXI2x(:,2)-dy;YCr(2)=XXI2x(:,2)+dy;
plot(XCr,YCr,'b',LineWidth=2);
XCr(1)=XXI2x(:,1)-dx;XCr(2)=XXI2x(:,1)+dx;YCr(1)=XXI2x(:,2)+dy;YCr(2)=XXI2x(:,2)-dy;
plot(XCr,YCr,'b',LineWidth=2);

title('Intersezione di due curve : vista globale','FontSize',24);

grid on;
yticks(-2:3);

 hold off ;
