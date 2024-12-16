%% Curva di Bèzier con 4 punti
clear all;
close all;
m=3; %numero di punti: m+1=4
C1=0; %% Variabile per punti random: 1->punti random
C2=0; %% Variabile di controllo per disposizione dei punti random:1->random
if(C1==0)
P0=[2,3];
P1=[1,2];
P2=[5,0];
P3=[0,6];
P=[P3;P1;P2;P0];
else
 P=rand(m+1,2)*10;
 C2=0; %I punti sono generati random, quindi hanno gia una disposizone randomica
end
%fprintf('Punti di controllo generati:');
%display(P);
n=100; %passo
t=linspace(0,1,n);
if(C2==1)
% ordine random
P = P(randperm(size(P, 1)), :);
% Visualizza disposizione
%fprintf('Punti di controllo mescolati:');

end
%display(P);


B1=zeros(n,2);
for i=1:n
    t_i=t(i);
    B1(i,:)=(1-t_i)^3*P(1,:)+2*t_i*(1-t_i)*P(2,:)+t_i^2*P(3,:);
end

subplot(2,1,1)
plot(B1(:,1),B1(:,2),'g','LineWidth',2);
title("Curva di Bèzier");
xlabel('x');
ylabel('y');
grid on;


subplot(2,1,2)
plot([P(:, 1);P(1,1)], [P(:, 2);P(1,2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
