%Curva di Bezier,test:punti di controllo ripetuti
clear all;
close all;
m=5; % m+1 punti di controllo
C1=0; %%m casuale?->1= m random,0 no
C2=0; %punti di controllo casuali: 1->random, 0 no
C3=0; % disposizione dei punti random:1->random,0 no
if(C1==1)
% Genera un numero casuale di punti di controllo m
m = randi([1, 20]);  % Numero casuale di punti di controllo tra 1 e 20
C2=1; % se m è random genero anche i punti random
else
    % Definisco i punti di controllo se m non è casuale
P = [0 0; 3 1.5; 2 3.0; 1 2.5; 3.5 0.0];
end
if(C2==1)
% Genera m+1 punti di controllo casuali
P = rand(m+1, 2) * 10;  % Punti di controllo casuali nell'intervallo [0, 10]
C3=0; % i punti sono generati random->la loro disposizione è gia random
end
if(C3==1)
% Disposizione casuale dell'ordine dei punti
P = P(randperm(size(P, 1)), :);
end

%aggiungo punto di controllo
P1=[P;P(1,:)]; % Curva chiusa
% Parametro t per calcolare i punti sulla curva 
T = linspace(0, 1, 100);

% Calcola la curva di Bézier
p = CAGD_Bezier(P1, T);
subplot(2,2,1)
% % Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% % Visualizza il poligono di controllo
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

% % Ripeto l'esperimento aggiungendo un altro punto

P2=[P;P(2,:)];
% Calcola la curva di Bézier
p = CAGD_Bezier(P2, T);
subplot(2,2,2)
% Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([P2(:, 1); P2(1, 1)], [P2(:, 2); P2(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

P3=[P;P(3,:)];
% Calcola la curva di Bézier
p = CAGD_Bezier(P3, T);
subplot(2,2,3)
% Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([P3(:, 1); P3(1, 1)], [P3(:, 2); P3(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
if(m>=5)
%%Ultima prova
P4=[P;P(3,:);P(4,:);P(5,:)];
% Calcola la curva di Bézier
p = CAGD_Bezier(P4, T);
subplot(2,2,4)
% Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([P4(:, 1); P4(1, 1)], [P4(:, 2); P4(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
end