%Curva di Bezier
clear all;
close all;
C1=1; % variabile per controllo numero di punti random:1->random
C2=0; % variabile per generazione punti random:1->random
C3=0; % variabile per disposizione dei punti random:1-> random
C4=1; % variabile per curva chiusa: 1->chiusa
if(C1==1)
% Genera un numero casuale di punti di controllo m
m = randi([5, 20]);  % Numero casuale di punti di controllo tra 1 e 20
C2=1; % se m è random genero anche i punti random
end

if(C2==1)
% Genera m+1 punti di controllo casuali
P = rand(m+1, 2) * 10;  % Punti di controllo casuali nell'intervallo [0, 10]
C3=0; % i punti sono generati random->la loro disposizione è gia random
else 
    % Definire i punti di controllo
P = [0 0; 3 1.5; 2 3.0; 1 2.5; 3.5 0.0];
end

if(C3==1)
% ordine dei punti casuale
P = P(randperm(size(P, 1)), :);
end
if(C4==1)
    P(end,1)=P(1,1);
    P(end,2)=P(1,2);
    

end
% Parametro t per calcolare i punti sulla curva (100 punti tra 0 e 1)
T = linspace(0, 1, 100);

% Calcola la curva di Bézier
p = CAGD_Bezier(P, T);

% Visualizza la curva di Bézier
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
title('Curva di Bézier(De Casteljau) e Poligono di Controllo ');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Visualizza il poligono di controllo
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
xlabel('x');
ylabel('y');
grid on;
axis equal;

