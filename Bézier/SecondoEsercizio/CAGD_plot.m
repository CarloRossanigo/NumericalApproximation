function CAGD_plot(P, p)
    % Plot control points p and Bézier curve P
    % Display the Bézier curve
    figure();
   tiledlayout(3,1);
  nexttile
    % Bézier curve
    plot(P(:, 1), P(:, 2), 'g', 'LineWidth', 2);
    title('Bézier Curve using De Casteljau');
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;

    nexttile
    % Display the control polygon
    plot([p(:, 1); p(1, 1)], [p(:, 2); p(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon

    title('Control Polygon');
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;

    nexttile
     plot(P(:, 1), P(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
    title('Bézier Curve using De Casteljau and Control Polygon');
    hold on;
    plot([p(:, 1); p(1, 1)], [p(:, 2); p(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;

  hold off;
end
