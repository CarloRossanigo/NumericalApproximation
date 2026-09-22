%% Generic Bézier Curve in 3D
% Number of control points: m+1 points
clear all;
close all;

m = 6;  % Number of control points
C1 = 1;  %% Random m? -> 1 = random m, 0 = no
C2 = 0;  % Random control points: 1 -> random, 0 = no
C3 = 0;  % Random point arrangement: 1 -> random, 0 = no
C4 = 0;  % Closed curve? 1 -> yes, 0 = no

if (C1 == 1)
    % Generate a random number of control points m
    m = randi([1, 20]);  % Random number of control points between 1 and 20
    C2 = 1;  % If m is random, generate random points as well
end

% Initialize control points in 3D
P = [0, 1, 1;   % P0
     1, 0, 2;   % P1
     3, 4, 0;   % P2
     2, 3, 3;   % P3
     1, 1, 1;   % P4
     4, 3, 4;   % P5
     9, 0, 2;   % P6
     2, 8, 1];  % P7

if (C2 == 1)
    % Generate m+1 random control points
    P = rand(m+1, 3) * 10;  % Random control points in the range [0, 10]
end

% Display control points
%fprintf('Number of control points: %d\n', m+1);
%fprintf('Generated control points:\n');
%disp(P);

if (C3 == 1)
    % Randomly shuffle the point order
    P = P(randperm(size(P, 1)), :);

    % Display shuffled control points
    %fprintf('Shuffled control points:\n');
end
%disp(P);

if (C4 == 1)
    % If the curve should be closed, set the last point equal to the first
    P(end, 1) = P(1, 1);
    P(end, 2) = P(1, 2);
    P(end, 3) = P(1, 3);
   % fprintf('Closed curve:\n');
   % display(P);
end

n = 100;  % Number of points to calculate on the curve
t = linspace(0, 1, n);  % Parameter vector t
B = zeros(n, 3);  % Matrix to store the curve points

% Loop to calculate the Bézier curve
for i = 1:n
    t_i = t(i);
    B_i = [0, 0, 0];  % Curve point initially at [0,0,0]

    % Weighted sum of control points
    for k = 0:m
        B_i = B_i + nchoosek(m, k) * (t_i^k) * ((1 - t_i)^(m - k)) * P(k+1, :);
    end

    % Store the calculated point
    B(i, :) = B_i;
end

% Plot the Bézier curve in 3D
subplot(2, 1, 1);
plot3(B(:, 1), B(:, 2), B(:, 3), 'g', 'LineWidth', 2);
title('3D Bézier Curve');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
axis equal;

% Plot the control polygon in 3D
subplot(2, 1, 2);
hold on;
plot3([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], [P(:, 3); P(1, 3)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Control Polygon');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
axis equal;
