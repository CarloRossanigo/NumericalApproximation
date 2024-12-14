% Grafici delle soluzioni approssimate e del ciclo limite
close all;
k = load('EI_5000');
x = k(:,1); % tempo
y = k(:,2); % V
z = k(:,3); % W

figure("Name", 'V e W vs Tempo');
% Primo grafico: V vs tempo
subplot(2,1,1) 
plot(x, y, 'r')
grid on;
xlabel('Tempo');
ylabel('V');
title('V vs Tempo');

% Secondo grafico: W vs tempo
subplot(2,1,2) 
plot(x, z, 'b')
grid on;
xlabel('Tempo');
ylabel('W');
title('W vs Tempo');

% ciclo limite (W vs V)
figure("Name", 'Ciclo limite'); 
plot(y, z, 'g')
grid on;
xlabel('V');
ylabel('W');
title('Ciclo limite');
