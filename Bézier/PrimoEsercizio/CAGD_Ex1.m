% Bézier curve
clear all;
close all;
C1=1; % Variable controlling the number of random points: 1 -> random
C2=0; % Variable controlling random point generation: 1 -> random
C3=0; % Variable controlling the arrangement of random points: 1 -> random
C4=1; % Variable controlling whether the curve is closed: 1 -> closed
if(C1==1)
% Generate a random number of control points m
m = randi([5, 20]);  % Random number of control points between 1 and 20
C2=1; % If m is random, generate random points as well
end

if(C2==1)
% Generate m+1 random control points
P = rand(m+1, 2) * 10;  % Random control points in the interval [0, 10]
C3=0; % The points are randomly generated, so their arrangement is already random
else 
    % Define the control points
P = [0 0; 3 1.5; 2 3.0; 1 2.5; 3.5 0.0];
end

if(C3==1)
% Randomize the order of the points
P = P(randperm(size(P, 1)), :);
end
if(C4==1)
    P(end,1)=P(1,1);
    P(end,2)=P(1,2);
    

end
% Parameter t for computing the curve points (100 points between 0 and 1)
T = linspace(0, 1, 100);

% Compute the Bézier curve
p = CAGD_Bezier(P, T);

% Display the Bézier curve
plot(p(:, 1), p(:, 2), 'g', 'LineWidth', 2);  % Bézier curve
title('Bézier Curve (De Casteljau) and Control Polygon');
xlabel('x');
ylabel('y');
grid on;
axis equal;
hold on;
% Display the control polygon
plot([P(:, 1); P(1, 1)], [P(:, 2); P(1, 2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
xlabel('x');
ylabel('y');
grid on;
axis equal;

