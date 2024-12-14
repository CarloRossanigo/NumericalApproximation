k = load('EE_5000');
x = k(:,1); % tempo
y = k(:,2); % V
z = k(:,3); % W

%%Se i passi sono 1000 toll a 10-3, altrimenti a 10-4 (entrambe)
toll = 1e-4; % toll
toll2=1e-3; % toll 2
%Trovo (100) indici per cui la |min(y)-y|<soglia
tempo=find(abs(min(y)-y)<toll,100);
inizio=x(tempo(1));

fprintf('Tempo di inizio del ciclo limite: %.6f\n',inizio);
%
inizio_ciclo=y(tempo(1)+1);
fine_ciclo = find(abs(y(tempo(1)+2:end) - inizio_ciclo) < toll,2) + tempo(1);
    % Calcolo della periodicità del ciclo limite
   %5 Per EE 1000 passi prendi fine_ciclo(1)
    repeat_indice=fine_ciclo(2);
    periodo=x(repeat_indice) - inizio;
        fprintf('Periodicità del ciclo limite: %.6f\n',periodo);

        % Plot del ciclo limite evidenziato
        figure("Name", 'Ciclo Limite Evidenziato');
        plot(y, z, 'c'); 
        hold on;
        % Evidenzia il ciclo in rosso
        plot(y(tempo(1):end), z(tempo(1):end), 'r', 'LineWidth', 2);
        grid on;
        xlabel('V');
        ylabel('W');
        title('Ciclo limite (evidenziato)');
