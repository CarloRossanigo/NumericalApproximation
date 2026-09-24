clearvars, close all

% Loading the data referred to the methods used
% Explicit Euler: case 1
EE_1000 = load("EE_1000");
EE_2000 = load("EE_2000");

% Explicit Euler: case 2
EE_5000 = load("EE_5000");
EE_10000 = load("EE_10000");

% Implicit Euler: case 1
EI_1000 = load("EI_1000");
EI_2000 = load("EI_2000");

% Implicit Euler: case 2
 EI_5000 = load("EI_5000");
 EI_10000 = load("EI_10000");


% Runge-Kutta 4: case 1
RK_1000 = load("RK4_1000");
RK_2000 = load("RK4_2000");

% Runge-Kutta 4: case 2
RK_5000 = load("RK4_5000");
RK_10000 = load("RK4_10000");

% Parameters p for the method order 
pe = 1;    % Eulero (Esplicito e Implicito)
prk = 4;   % Runge-Kutta 4

fprintf("\nEE caso 1\n");

% Explicit Euler (EE) - Evaluating the max error case 1 
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
EE_2000_ridotto = EE_2000(1:2:end, 2:3);  

diff_EE = vecnorm(EE_1000(:, 2:3) - EE_2000_ridotto, 2, 2);  
max_norma_EE_1000 = max(diff_EE) * 2^pe / (2^pe - 1);
fprintf("EE n=1000 Errore= %e \n", max_norma_EE_1000);

fprintf("\nEE caso 2\n");
% Explicit Euler (EE) - Evaluating the max error case 2
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
EE_10000_ridotto = EE_10000(1:2:end, 2:3); 
diff_EE2 = vecnorm(EE_5000(:, 2:3) - EE_10000_ridotto, 2, 2);  
max_norma_EE_5000 = max(diff_EE2) * 2^pe / (2^pe - 1);
fprintf("EE n=5000 Errore= %e \n", max_norma_EE_5000);

fprintf("\nEI caso 1\n");
% Implicit Euler (EI) - Evaluating the max error case 1
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
EI_2000_ridotto = EI_2000(1:2:end, 2:3);  
diff_EI = vecnorm(EI_1000(1:end, 2:3) - EI_2000_ridotto, 2, 2);  
max_norma_EI_1000 = max(diff_EI) * 2^pe / (2^pe - 1);
fprintf("EI  n=1000 Errore  = %e \n", max_norma_EI_1000);

fprintf("\nEI caso 2\n");
% % Implicit Euler (EI) - Evaluating the max error case 2
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
EI_10000_ridotto = EI_10000(1:2:end, 2:3);  
diff_EI2 = vecnorm(EI_5000(1:end, 2:3) - EI_10000_ridotto, 2, 2);  
max_norma_EI_5000 = max(diff_EI2) * 2^pe / (2^pe - 1);
fprintf("EE n=5000 Errore= %e \n", max_norma_EI_5000);


fprintf("\nRK4 caso 1\n");
% Runge-Kutta 4 (RK4) with n=1000 - Evaluating the max error case
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
RK_2000_ridotto = RK_2000(1:2:end, 2:3);  
diff_RK_1000 = vecnorm(RK_1000(:, 2:3) - RK_2000_ridotto, 2, 2);  
max_norma_RK_1000 = max(diff_RK_1000) * 2^prk / (2^prk - 1);
fprintf("RK4 n=1000 Errore = %e \n", max_norma_RK_1000);

fprintf("\nRK4 caso 2\n");
% Runge-Kutta 4 (RK4) with n=5000 - Evaluating the max error case
Take the odd-indexed points of the 2n step solution
% Calculate the norms of the differences between rows
% Norms for each row
% Calculate the maximum error
RK_10000_ridotto = RK_10000(1:2:end, 2:3);  
diff_RK_5000 = vecnorm(RK_5000(:, 2:3) - RK_10000_ridotto, 2, 2);  
max_norma_RK_5000 = max(diff_RK_5000) * 2^prk / (2^prk - 1);
fprintf("RK4 n=5000 Errore = %e \n", max_norma_RK_5000);
