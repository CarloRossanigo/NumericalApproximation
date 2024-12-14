clearvars, close all

% Carico i dati relativi ai metodi utilizzati
% Eulero Esplicito: caso 1
EE_1000 = load("EE_1000");
EE_2000 = load("EE_2000");

% Eulero Esplicito: caso 2
EE_5000 = load("EE_5000");
EE_10000 = load("EE_10000");

% Eulero Implicito: caso 1
EI_1000 = load("EI_1000");
EI_2000 = load("EI_2000");

% Eulero Implicito: caso 2
 EI_5000 = load("EI_5000");
 EI_10000 = load("EI_10000");


% Runge-Kutta 4: caso 1
RK_1000 = load("RK4_1000");
RK_2000 = load("RK4_2000");

% Runge-Kutta 4: caso 2
RK_5000 = load("RK4_5000");
RK_10000 = load("RK4_10000");

% Parametri p per gli ordini dei metodi
pe = 1;    % Eulero (Esplicito e Implicito)
prk = 4;   % Runge-Kutta 4

fprintf("\nEE caso 1\n");

% Eulero Esplicito (EE) - Calcolo errore massimo caso 1
EE_2000_ridotto = EE_2000(1:2:end, 2:3);  % Prendiamo i punti dispari della soluzione a passo 2n
% Calcolo delle norme delle differenze tra le righe
diff_EE = vecnorm(EE_1000(:, 2:3) - EE_2000_ridotto, 2, 2);  % Norme su ogni riga
% Calcolo dell'errore massimo
max_norma_EE_1000 = max(diff_EE) * 2^pe / (2^pe - 1);
fprintf("EE n=1000 Errore= %e \n", max_norma_EE_1000);

fprintf("\nEE caso 2\n");
% Eulero Esplicito (EE) - Calcolo errore massimo caso 2
EE_10000_ridotto = EE_10000(1:2:end, 2:3); % Prendiamo i punti dispari della soluzione a passo 2n
% Calcolo delle norme delle differenze tra le righe
diff_EE2 = vecnorm(EE_5000(:, 2:3) - EE_10000_ridotto, 2, 2);  % Norme su ogni riga
% Calcolo dell'errore massimo
max_norma_EE_5000 = max(diff_EE2) * 2^pe / (2^pe - 1);
fprintf("EE n=5000 Errore= %e \n", max_norma_EE_5000);

fprintf("\nEI caso 1\n");
% Eulero Implicito (EI) - Calcolo errore massimo
EI_2000_ridotto = EI_2000(1:2:end, 2:3);  % Prendiamo i punti dispari della soluzione a passo 2n, esclusa l'ultima riga
% Calcolo delle norme delle differenze tra le righe
diff_EI = vecnorm(EI_1000(1:end, 2:3) - EI_2000_ridotto, 2, 2);  % Norme su ogni riga, esclusa l'ultima riga
% Calcolo dell'errore massimo
max_norma_EI_1000 = max(diff_EI) * 2^pe / (2^pe - 1);
fprintf("EI  n=1000 Errore  = %e \n", max_norma_EI_1000);

fprintf("\nEI caso 2\n");
% % Eulero Implicito (EI) - Calcolo errore massimo caso 2
EI_10000_ridotto = EI_10000(1:2:end, 2:3);  % Prendiamo i punti dispari della soluzione a passo 2n, esclusa l'ultima riga
% Calcolo delle norme delle differenze tra le righe
diff_EI2 = vecnorm(EI_5000(1:end, 2:3) - EI_10000_ridotto, 2, 2);  % Norme su ogni riga, esclusa l'ultima riga
% % Calcolo dell'errore massimo
max_norma_EI_5000 = max(diff_EI2) * 2^pe / (2^pe - 1);
fprintf("EE n=5000 Errore= %e \n", max_norma_EI_5000);


fprintf("\nRK4 caso 1\n");
% Runge-Kutta 4 (RK4) con n=1000 - Calcolo errore massimo
RK_2000_ridotto = RK_2000(1:2:end, 2:3);  % Prendiamo i punti dispari della soluzione a passo 2n
% Calcolo delle norme delle differenze tra le righe
diff_RK_1000 = vecnorm(RK_1000(:, 2:3) - RK_2000_ridotto, 2, 2);  % Norme su ogni riga
% Calcolo dell'errore massimo
max_norma_RK_1000 = max(diff_RK_1000) * 2^prk / (2^prk - 1);
fprintf("RK4 n=1000 Errore = %e \n", max_norma_RK_1000);

fprintf("\nRK4 caso 2\n");
% Runge-Kutta 4 (RK4) con n=5000 - Calcolo errore massimo
RK_10000_ridotto = RK_10000(1:2:end, 2:3);  % Prendiamo i punti dispari della soluzione a passo 2n
% Calcolo delle norme delle differenze tra le righe
diff_RK_5000 = vecnorm(RK_5000(:, 2:3) - RK_10000_ridotto, 2, 2);  % Norme su ogni riga
% Calcolo dell'errore massimo
max_norma_RK_5000 = max(diff_RK_5000) * 2^prk / (2^prk - 1);
fprintf("RK4 n=5000 Errore = %e \n", max_norma_RK_5000);
