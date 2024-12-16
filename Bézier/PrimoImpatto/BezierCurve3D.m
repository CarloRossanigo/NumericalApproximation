%% Bézier generico in 3D-> 
% Numero di punti di controllo: m+1 punti
clear all;
close all;

m = 6;  % Numero di punti di controllo
C1 = 1;  %% m casuale? -> 1 = m random, 0 no
C2 = 0;  % Punti di controllo casuali: 1 -> random, 0 no
C3 = 0;  % Disposizione dei punti random: 1 -> random, 0 no
C4 = 0;  % Curva chiusa? 1 -> si, 0 no

if (C1 == 1)
    % Genera un numero casuale di punti di controllo m
    m = randi([1, 20]);  % Numero casuale di punti di controllo tra 1 e 20
    C2 = 1;  % se m è random genero anche i punti random
end

% Inizializzazione dei punti di controllo in 3D
P = [0, 1, 1;   % P0
     1, 0, 2;   % P1
     3, 4, 0;   % P2
     2, 3, 3;   % P3
     1, 1, 1;   % P4
     4, 3, 4;   % P5
     9, 0, 2;   % P6
     2, 8, 1];  % P7

if (C2 == 1)
    % Genera m+1 punti di controllo casuali
    P = rand(m+1, 3) * 10;  % Punti di controllo casuali nell'intervallo [0, 10]
end

% Visualizza i punti di controllo
%fprintf('Numero di punti di controllo: %d\n', m+1);
%fprintf('Punti di controllo generati:\n');
%disp(P);

if (C3 == 1)
    % Mescolare casualmente l'ordine dei punti
    P = P(randperm(size(P, 1)), :);

    % Visualizza i punti di controllo mescolati
    %fprintf('Punti di controllo mescolati:\n');
end
%disp(P);

if (C4 == 1)
    % Se la curva deve essere chiusa, impostiamo l'ultimo punto uguale al primo
    P(end, 1) = P(1, 1);
    P(end, 2) = P(1, 2);
    P(end, 3) = P(1, 3);
   % fprintf('Curva chiusa:\n');
   % display(P);
end

n = 100;  % Numero di punti da calcolare sulla curva
t = linspace(0, 1, n);  % Vettore dei parametri t
B = zeros(n, 3);  % Matrice per memorizzare i punti della curva

% Ciclo per calcolare la curva di Bézier
for i = 1:n
    t_i = t(i);
    B_i = [0, 0, 0];  % Punto della curva inizialmente a [0,0,0]
    
    % Somma pesata dei punti di controllo
    for k = 0:m
        B_i = B_i + nchoosek(m, k) * (t_i^k) * ((1 - t_i)^(m - k)) * P(k+1, :);
    end
    
    % Memorizza il punto calcolato
    B(i, :) = B_i;
end

% Grafico della curva di Bézier in 3D
subplot(2, 1, 1);
plot3(B(:, 1), B(:, 2), B(:, 3), 'g', 'LineWidth', 2);
title('Curva di Bézier in 3D');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
axis equal;

% Grafico del poligono di controllo in 3D
subplot(2, 1, 2);
hold on;
plot3([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], [P(:, 3); P(1, 3)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
axis equal;
