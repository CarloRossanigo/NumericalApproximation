function CAGD_Plot_Bezier(P,p);
 % Function to plot the Bézier curve
    % Input:
    %   P - Control-point matrix (m+1, 2)
    %   p - Matrix of points on the Bézier curve
    % Output:
    %   Plot of the Bézier curve and the control polygon
% Plot the control points p and curve P
% Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

