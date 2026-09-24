k = load('RK4_5000');
x = k(:,1); % tempo
y = k(:,2); % V
z = k(:,3); % W

%%if step = 1000 the treshold=10-3, otheriws treshold=10-4 
toll=1e-3; % toll 2
% Finding 100 index where |min(y)-y|< treshold
tempo=find(abs(min(y)-y)<toll,100);
inizio=x(tempo(1));
fprintf('Tempo di inizio del ciclo limite: %.6f\n',inizio);
%
n = size(tempo, 1);  % Number of index found 
Indici = zeros(n, 1);  % Vector for new index 
j = 1;  %INdex for vector index 
Indici(j) = tempo(1);  % Adding the first index 

% Cycle to find the non consecutive index 
for i = 2:n
    % If the difference between the current value and the precedent is higher than the treshold 
    if tempo(i) > tempo(i-1) + 1  % Adding if the difference is higher than 1  
        j = j + 1;  % Adding the index 
        Indici(j) = tempo(i);  % Adding the current index 
    end
end

% Reducing the dimensin of Index Vector  
Indici = Indici(1:j);  % Maintening only the good values  
Periodo=x(Indici(2))-x(Indici(1));

        fprintf('Periodicità del ciclo limite: %.6f\n',Periodo);
        % Plot limit cycle 
        figure("Name", 'Ciclo Limite Evidenziato');
        plot(y, z, 'c'); 
        hold on;
        
        plot(y(tempo(1):end), z(tempo(1):end), 'r', 'LineWidth', 2);
        grid on;
        xlabel('V');
        ylabel('W');
        title('Ciclo limite (evidenziato)');
