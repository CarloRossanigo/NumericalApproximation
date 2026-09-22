%% Joining two Bézier curves

clear all;
close all;

% Define the number of control points for both curves
m1 = 3;  % 3 control points for the first curve
m2 = 3;  % 3 control points for the second curve

% Control points for the first curve (P)
P = [0, 0; 3, 4;6,0.5];   

% Control points for the second curve (Q)
Q = [6, 0.5;  9,-3  ; 12, 2];  %% 9,-3   9,-4

% Parameters for computing the curve points (100 points between 0 and 1)
T = linspace(0, 1, 100);

% Compute the first Bézier curve
p = CAGD_Bezier(P, T);

% Compute the second Bézier curve
q = CAGD_Bezier(Q, T);

% Display the two Bézier curves
figure;
subplot(1, 2, 1);
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);
hold on;
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Prima curva di Bézier');
xlabel('x');
ylabel('y');
grid on;
axis equal;

subplot(1, 2, 2);
plot(q(:, 1), q(:, 2), 'g', 'LineWidth', 2);
hold on;
plot([Q(:, 1); Q(1, 1)], [Q(:, 2); Q(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Seconda curva di Bézier');
xlabel('x');
ylabel('y');
grid on;
axis equal;

% Concatenate the two curves
p1 = [p; q];
figure;
plot(p1(:, 1), p1(:, 2), 'g', 'LineWidth', 2);
hold on;
P1 = [P; Q];
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');
title('Curva di Bézier concatenata');
xlabel('x');
ylabel('y');
grid on;
axis equal;

%% Verify the G1 continuity condition
% Segment P_m-1 P_m (first curve)
seg1 = P(end, :) - P(end-1, :);  

% Segment P_0' P_1' (second curve)
seg2 = Q(1, :) - P(end-1, :);  

% Compute the cross product of the two segments (alignment)
V = cross([seg1, 0], [seg2, 0]);  

% Check whether the cross product is zero (aligned segments)
toll = 1e-4;  
if abs(V(3)) < toll
    fprintf('Condizione G1 verificata\n');
else
    fprintf('Condizione G1 NON verificata \n');
end

%% Verify the C1 continuity condition

% Check that Pm is the midpoint of P_m-1 and P1'
pm = (P(end-1, :) + Q(2, :)) / 2;

% Check the C1 condition (P_m must equal (P_m-1 + P1') / 2)
if norm(P(end,:)- pm) < toll
    fprintf('Condizione C1 verificata');
else
    fprintf('Condizione C1 NON verificata');
end
