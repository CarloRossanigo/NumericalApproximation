%% Unione di due Curve di Bézier

clear all;
close all;

% Definizione il numero di punti di controllo per entrambe le curve
m1 = 3;  % 3 punti di controllo per la prima curva
m2 = 3;  % 3 punti di controllo per la seconda curva

% Punti di controllo per la prima curva (P)
P = [0, 0; 3, 4;6,0.5];   

% Punti di controllo per la seconda curva (Q)
Q = [6, 0.5;  9,-3  ; 12, 2];  %% 9,-3   9,-4

% Parametri per calcolare i punti sulla curva (100 punti tra 0 e 1)
T = linspace(0, 1, 100);

% Calcola la prima curva di Bézier
p = CAGD_Bezier(P, T);

% Calcola la seconda curva di Bézier
q = CAGD_Bezier(Q, T);

% Visualizza le due curve di Bézier
figure;
subplot(1, 2, 1);
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);
hold on;
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Prima curva di Bézier');
xlabel('x');
ylabel('y');
grid on;
axis equal;

subplot(1, 2, 2);
plot(q(:, 1), q(:, 2), 'g', 'LineWidth', 2);
hold on;
plot([Q(:, 1); Q(1, 1)], [Q(:, 2); Q(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Seconda curva di Bézier');
xlabel('x');
ylabel('y');
grid on;
axis equal;

% Concateno le due curve
p1 = [p; q];
figure;
plot(p1(:, 1), p1(:, 2), 'g', 'LineWidth', 2);
hold on;
P1 = [P; Q];
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Curva di Bézier concatenata');
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
V = cross([seg1, 0], [seg2, 0]);  

% Verifico se prodotto vettoriale è zero (segmenti allineati)
toll = 1e-4;  
if abs(V(3)) < toll
    fprintf('Condizione G1 verificata\n');
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