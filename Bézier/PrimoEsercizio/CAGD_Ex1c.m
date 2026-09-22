%% Joining two Bézier curves

% Randomly generate a Bézier curve
% Randomly generate a second Bézier curve, with its first control point
% equal to the last control point of the first curve

clear all;
close all;
m1 = randi([2, 20]);
m2=randi([2,20]);
% Define the control points
P = rand(m1+1, 2) * 10;
Q=rand(m2,2)*10;
Q(1,1)=P(end,end);
% Parameter t for computing the curve points (100 points between 0 and 1)
T = linspace(0, 1, 100);

% Compute the first Bézier curve
p = CAGD_Bezier(P, T);
% Compute the second Bézier curve
q=CAGD_Bezier(Q,T);
figure();

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
figure();
% Display the Bézier curve
plot(q(:, 1), q(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier usando De Casteljau');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([Q(:, 1); Q(1, 1)], [Q(:, 2); Q(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Poligono di Controllo');
xlabel('x');
ylabel('y');
grid on;
axis equal;

% Concatenate the two curves
p1=[p;q];
figure();
plot(p1(:, 1), p1(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Curva di Bézier concatenata');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
P1=[P;Q];
% Display the control polygon
plot([P1(:, 1); P1(1, 1)], [P1(:, 2); P1(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
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
Vprod = cross([seg1, 0], [seg2, 0]);  

% Check whether the cross product is zero (aligned segments)
toll = 1e-4;  
if abs(Vprod(3)) < toll
    fprintf('Condizione G1 verificata \n');
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
