function CAGD_Plot_Bezier(P,p);
 % Funzione per graficare la curva di Bézier 
    % Input:
    %   P - Matrice dei punti di controllo (m+1, 2)
    %   p - matrice dei punti della curva di Bézier
    % Output:
    %   grafico della curva di Bézier e del poligono di controllo
% Grafico dei punti di controllo p e della curva P
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

