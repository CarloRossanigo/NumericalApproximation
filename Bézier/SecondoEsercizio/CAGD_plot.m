function CAGD_plot(P, p)
    % Grafico dei punti di controllo p e della curva P
    % Visualizza la curva di Bézier
    figure();
   tiledlayout(3,1);
  nexttile
    % Curva di Bézier
    plot(P(:, 1), P(:, 2), 'g', 'LineWidth', 2); 
    title('Curva di Bézier usando De Casteljau');
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;
    
    nexttile
    % Visualizza il poligono di controllo
    plot([p(:, 1); p(1, 1)], [p(:, 2); p(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
    
    title('Poligono di Controllo');
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;

    nexttile
     plot(P(:, 1), P(:, 2), 'g', 'LineWidth', 2);  % Curva di Bézier
    title('Curva di Bézier usando De Casteljau e Poligono di controllo');
    hold on;
    plot([p(:, 1); p(1, 1)], [p(:, 2); p(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Poligono di controllo
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;

  hold off;
end
