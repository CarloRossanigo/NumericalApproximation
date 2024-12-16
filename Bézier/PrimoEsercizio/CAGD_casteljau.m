function p = CAGD_casteljau(t, P)
    % Algoritmo di De Casteljau per calcolare un punto su una curva di Bézier
    % Input:
    %   t - Parametro t (tra 0 e 1) per calcolare il punto sulla curva
    %   P - Matrice dei punti di controllo (m+1, 2)
    % Output:
    %   p - Punto sulla curva di Bézier corrispondente al parametro t
    
    m = size(P, 1) - 1;  % m è il numero di punti di controllo - 1
    x = P(:, 1);         % Coordinata x dei punti di controllo
    y = P(:, 2);         % Coordinata y dei punti di controllo
    
    % Iterazione per calcolare i punti intermedi
    for k = 1:m
        xx=x;
        yy=y;
        for kk =k:m
            x(kk+1) =  (1-t)* xx(kk) + t * xx(kk+1);
            y(kk+1) = (1-t) * yy(kk) + t * yy(kk+1);
        end
    end
    
    % Il punto finale è l'ultimo calcolato
    p = [x(m+1), y(m+1)];
end
