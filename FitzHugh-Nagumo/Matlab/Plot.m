% plot approximate solutions and limit cycle 
close all;
k = load('EI_5000');
x = k(:,1); % time
y = k(:,2); % V
z = k(:,3); % W

figure("Name", 'V e W vs Tempo');
% First Plot: V vs time
subplot(2,1,1) 
plot(x, y, 'r')
grid on;
xlabel('Tempo');
ylabel('V');
title('V vs Tempo');

% Second Plot : W vs time
subplot(2,1,2) 
plot(x, z, 'b')
grid on;
xlabel('Tempo');
ylabel('W');
title('W vs Tempo');

% Limit Cycle (W vs V)
figure("Name", 'Ciclo limite'); 
plot(y, z, 'g')
grid on;
xlabel('V');
ylabel('W');
title('Ciclo limite');
