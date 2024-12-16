%% Unione di due Curve di Bèzier

%Genero casualmente una curva di Bèzier
%Genero una seconda curva di Bèzier casuale, con primo punto di
%controllo=ultimo punto di controllo della prima

clear all;
close all;
m1 = randi([2, 20]);
m2=randi([2,20]);
% Definizione dei punti di controllo
P = rand(m1+1, 2) * 10;
Q=rand(m2,2)*10;
Q(1,1)=P(end,end);
% Parametro t per calcolare i punti sulla curva (100 punti tra 0 e 1)
T = linspace(0, 1, 100);

% Calcola la prima curva di Bézier
p = CAGD_Bezier(P, T);
% Calcola la seconda curva di Bézier
q=CAGD_Bezier(Q,T);
figure();

% Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
figure();
% Visualizza la curva di Bézier
plot(q(:, 1), q(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([Q(:, 1); Q(1, 1)], [Q(:, 2); Q(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

%Concateno le due curve
p1=[p;q];
figure();
plot(p1(:, 1), p1(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier concatenata');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
P1=[P;Q];
% Visualizzare il poligono di controllo
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
xlabel('x');
ylabel('y');
grid on;
axis equal;
%% Verifica della condizione G1
% Segmento P_m-1 P_m (prima curva)
seg1 = P(end, :) - P(end-1, :);  

% Segmento P_0' P_1' (seconda curva)
seg2 = Q(1, :) - P(end-1, :);  

% Calcolo il prodotto vettoriale tra i due segmenti (allineamento)
Vprod = cross([seg1, 0], [seg2, 0]);  

% Verifico se prodotto vettoriale è zero (segmenti allineati)
toll = 1e-4;  
if abs(Vprod(3)) < toll
    fprintf('Condizione G1 verificata \n');
else
    fprintf('Condizione G1 NON verificata \n');
end

%% Verifica della condizione C1

% Verifico che Pm sia il punto medio di P_m-1 e P1'
pm = (P(end-1, :) + Q(2, :)) / 2;

% Verifico condizione C1 (P_m deve essere uguale a (P_m-1 + P1') / 2)
if norm(P(end,:)- pm) < toll
    fprintf('Condizione C1 verificata');
else
    fprintf('Condizione C1 NON verificata');
end