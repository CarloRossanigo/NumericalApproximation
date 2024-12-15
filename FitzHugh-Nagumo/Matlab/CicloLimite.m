k = load('RK4_5000');
x = k(:,1); % tempo
y = k(:,2); % V
z = k(:,3); % W

%%Se i passi sono 1000 toll a 10-3, altrimenti a 10-4 (entrambe)
toll=1e-3; % toll 2
%Trovo (100) indici per cui la |min(y)-y|<soglia
tempo=find(abs(min(y)-y)<toll,100);
inizio=x(tempo(1));
fprintf('Tempo di inizio del ciclo limite: %.6f\n',inizio);
%
n = size(tempo, 1);  % Numero di indici trovati
Indici = zeros(n, 1);  % Vettore per i nuovi indici
j = 1;  % Indice per il vettore Indici
Indici(j) = tempo(1);  % Aggiungo il primo indice

% Ciclo per selezionare solo indici non consecutivi
for i = 2:n
    % Se la differenza tra il valore corrente e il precedente è maggiore di una soglia
    if tempo(i) > tempo(i-1) + 1  % Aggiungo solo se la differenza è maggiore di 1
        j = j + 1;  % Incrementa l'indice
        Indici(j) = tempo(i);  % Aggiungo l'indice corrente
    end
end

% Riduco la dimensione di Indici 
Indici = Indici(1:j);  % Mantieni solo i valori validi
Periodo=x(Indici(2))-x(Indici(1));

        fprintf('Periodicità del ciclo limite: %.6f\n',Periodo);
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
