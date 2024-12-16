function [TRI, Q] = sbezier(T, P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Campiona la superficie di Bézier utilizzando l'algoritmo di de Boor - Coox
%%   Input :  T valori di campionamento (matrice n x n)
%%            P matrice (m x n x 3) dei punti di controllo
%%   Output : TRI lista dei triangoli che compongono la superficie
%%            Q matrice con le coordinate dei punti campionati
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(T, 2);  % Numero di punti di campionamento (griglia n x n)
n1 = n - 1;      % Numero di triangoli su una griglia (n-1) x (n-1)
n2 = n * n;      % Numero totale di punti campionati

% Inizializzo Q per memorizzare le coordinate dei punti
Q = zeros(n2, 3);

% Calcolo i punti sulla superficie Bézier
for k1 = 1:n
    for k2 = 1:n
        t1 = T(k1);  % Parametro t1
        t2 = T(k2);  % Parametro t2
        q = coox(t1, t2, P);  % Calcolo il punto usando l'algoritmo CAGD_coox
        k = k1 + (k2 - 1) * n;  % Indice del punto nella matrice Q
        Q(k, :) = q;     % Memorizzo il punto in Q
    end
end

% Costruisco i triangoli (facce della superficie)
m = n1 * n1 * 2;  % Numero di triangoli
TRI = zeros(m, 3);  % Inizializzo la matrice TRI

% Creo i triangoli tra i punti adiacenti
for k1 = 1:n1
    for k2 = 1:n1
        k = k1 + (k2 - 1) * n1;
        kk = k1 + (k2 - 1) * n;  % Indice del punto corrente
        % Primo triangolo
        TRI(2 * k - 1, 1) = kk;
        TRI(2 * k - 1, 2) = kk + 1;
        TRI(2 * k - 1, 3) = kk + 1 + n;
        % Secondo triangolo
        TRI(2 * k, 1) = kk;
        TRI(2 * k, 2) = kk + n;
        TRI(2 * k, 3) = kk + n + 1;
    end
end
