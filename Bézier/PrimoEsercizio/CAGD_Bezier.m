function PP = CAGD_Bezier(P, t)
    % Funzione per calcolare la curva di Bézier utilizzando l'algoritmo di Casteljau
    % Input:
    %   P - Matrice dei punti di controllo (m+1, 2)
    %   t - Vettore di parametri t (tra 0 e 1)
    % Output:
    %   PP - Matrice con i punti calcolati sulla curva di Bézier
    
    n = length(t);  % Numero di punti da calcolare sulla curva
    PP = zeros(n, 2);  % Matrice per memorizzare i punti della curva
    
    % Calcola la curva per ciascun valore di t
    for k = 1:n
        T = t(k);  % Parametro t per il punto corrente
        PP(k, :) = CAGD_casteljau(T, P);  % Calcola il punto sulla curva usando De Casteljau
  
    end
end
