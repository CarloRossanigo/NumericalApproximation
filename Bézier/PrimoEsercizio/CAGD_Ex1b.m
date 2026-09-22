% Bézier curve, test: repeated control points
clear all;
close all;
m=5; % m+1 control points
C1=0; %% Is m random? -> 1 = m random, 0 = no
C2=0; % Random control points: 1 -> random, 0 -> no
C3=0; % Random arrangement of points: 1 -> random, 0 -> no
if(C1==1)
% Generate a random number of control points m
m = randi([1, 20]);  % Random number of control points between 1 and 20
C2=1; % If m is random, generate random points as well
else
    % Define the control points if m is not random
P = [0 0; 3 1.5; 2 3.0; 1 2.5; 3.5 0.0];
end
if(C2==1)
% Generate m+1 random control points
P = rand(m+1, 2) * 10;  % Random control points in the interval [0, 10]
C3=0; % The points are randomly generated, so their arrangement is already random
end
if(C3==1)
% Randomly arrange the order of the points
P = P(randperm(size(P, 1)), :);
end

% Add a control point
P1=[P;P(1,:)]; % Closed curve
% Parameter t for computing the curve points
T = linspace(0, 1, 100);

% Compute the Bézier curve
p = CAGD_Bezier(P1, T);
subplot(2,2,1)
% % Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% % Display the control polygon
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

% % Repeat the experiment by adding another point

P2=[P;P(2,:)];
% Compute the Bézier curve
p = CAGD_Bezier(P2, T);
subplot(2,2,2)
% Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([P2(:, 1); P2(1, 1)], [P2(:, 2); P2(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

P3=[P;P(3,:)];
% Compute the Bézier curve
p = CAGD_Bezier(P3, T);
subplot(2,2,3)
% Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([P3(:, 1); P3(1, 1)], [P3(:, 2); P3(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
if(m>=5)
%% Final test
P4=[P;P(3,:);P(4,:);P(5,:)];
% Compute the Bézier curve
p = CAGD_Bezier(P4, T);
subplot(2,2,4)
% Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([P4(:, 1); P4(1, 1)], [P4(:, 2); P4(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;
end
