%% Curve di Bèzier
clear all;
close all;
C1=1; % controllo scelta di punti: 1-> random
C2=0; % controllo ordine punti : 1->random
m=2; %numero di punti: m+1=3
P0=[0,1];
P1=[1,0];
P2=[3,4];
P=[P0;P1;P2];
if(C1==1)
    P=rand(m+1,2)*10;
   % fprintf('Punti selezionati:');
    C2=0; %I punti sono generati random, quindi hanno già una disposizone randomica
end
 %display(P)
if(C2==1)
    P = P(randperm(m+1), :);
    %fprintf('Punti selezionati:');
    
end

%display(P)
n=100; %passo
t=linspace(0,1,n);
B=zeros(n,2);

B1=zeros(n,2);
for i=1:n
    t_i=t(i);
    B1(i,:)=(1-t_i)^2*P0+2*t_i*(1-t_i)*P1+t_i^2*P2;
end

subplot(2,1,1)



plot(B1(:,1),B1(:,2),'g','LineWidth',2); %Curva di Bèzier
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
