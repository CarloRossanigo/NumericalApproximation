function q = coox(t1, t2, P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Costruzione di un punto della superficie di Bézier 
%%   usando l'algoritmo di Boor - Coox 
%%
%%   P è una matrice di dimensioni (m x n x 3), dove ogni elemento
%%   P(k, l, :) contiene le coordinate (x, y, z) del punto di controllo
%%
%%   Input:
%%       t1, t2   : parametri sulla superficie (tipicamente tra 0 e 1)
%%       P        : matrice (m x n x 3) di punti di controllo
%%
%%   Output:
%%       q        : punto [x, y, z] sulla superficie di Bézier
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dimensioni della matrice dei punti di controllo
np1 = size(P, 1); % Numero di righe (m)
np2 = size(P, 2); % Numero di colonne (n)

% Inizializzazione dei vettori
xx1 = zeros(np1, 1);
yy1 = zeros(np1, 1);
zz1 = zeros(np1, 1);

% Costruzione dei punti P_q1 (approssimazione lungo la direzione 2)
for k1 = 1:np1
    % Costruzione di un vettore temporaneo per ogni riga P(k1, 1:n)
    xx2 = zeros(np2, 1);
    yy2 = zeros(np2, 1);
    zz2 = zeros(np2, 1);
    
    % Estrazione dei punti dalla matrice P
    for k2 = 1:np2
        % Punti lungo la direzione 2
        xx2(k2) = P(k1, k2, 1);  % x
        yy2(k2) = P(k1, k2, 2);  % y
        zz2(k2) = P(k1, k2, 3);  % z
    end
    
    % Calcolo del punto sulla curva di Bézier nella direzione 2
    q = cast3d(t2, [xx2, yy2, zz2]);
    
    % Memorizzazione del risultato
    xx1(k1) = q(1);
    yy1(k1) = q(2);
    zz1(k1) = q(3);
end

% Calcolo finale del punto sulla superficie di Bézier
q = cast3d(t1, [xx1, yy1, zz1]);
