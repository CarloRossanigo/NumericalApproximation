%% Bézier Curve with 4 Points
clear all;
close all;
m=3; % Number of points: m+1 = 4
C1=0; %% Variable for random points: 1 -> random points
C2=0; %% Control variable for random point order: 1 -> random
if(C1==0)
P0=[2,3];
P1=[1,2];
P2=[5,0];
P3=[0,6];
P=[P3;P1;P2;P0];
else
 P=rand(m+1,2)*10;
 C2=0; % Points are randomly generated, so they already have a random order
end
%fprintf('Generated control points:');
%display(P);
n=100; % Step size
t=linspace(0,1,n);
if(C2==1)
% Random order
P = P(randperm(size(P, 1)), :);
% Display arrangement
%fprintf('Shuffled control points:');

end
%display(P);

B1=zeros(n,2);
for i=1:n
    t_i=t(i);
    B1(i,:)=(1-t_i)^3*P(1,:)+2*t_i*(1-t_i)*P(2,:)+t_i^2*P(3,:);
end

subplot(2,1,1)
plot(B1(:,1),B1(:,2),'g','LineWidth',2);
title("Bézier Curve");
xlabel('x');
ylabel('y');
grid on;

subplot(2,1,2)
plot([P(:, 1);P(1,1)], [P(:, 2);P(1,2)], 'ro-', 'MarkerFaceColor', 'r');  % Control polygon
title('Control Polygon');
xlabel('x');
ylabel('y');
grid on;
axis equal;
