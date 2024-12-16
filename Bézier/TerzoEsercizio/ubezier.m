function ubezier(TRI, Q, P, color)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Visualizzazione della superficie Bézier con punti di controllo
%%   e poligono di controllo
%%
%%   Input : TRI lista dei triangoli che compongono la superficie
%%           Q matrice (n^2 x 3) con le coordinate dei punti campionati
%%           P matrice (m x n x 3) con le coordinate dei punti di controllo
%%           color colore per i punti di controllo
%%
%%   Output : Visualizza la superficie Bézier, il poligono di controllo
%%            e la combinazione di entrambi
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Visualizza la superficie Bézier in una nuova figura
figure; % Crea una nuova figura
hold on;
trisurf(TRI, Q(:,1), Q(:,2), Q(:,3)); % Superficie Bézier
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Superficie Bézier');
view(3);  % Visualizzazione in 3D
grid on;
hold off;

% 2. Visualizza il poligono di controllo come superficie in una nuova figura
figure; % Nuova figura
hold on;

np1 = size(P, 1);  % Numero di righe (m)
np2 = size(P, 2);  % Numero di colonne (n)

% Disegna il poligono di controllo come una superficie trasparente
for k1 = 1:np1-1
    for k2 = 1:np2-1
        % Definisci i vertici del quadrato tra i punti di controllo
        Xv = [P(k1, k2, 1), P(k1+1, k2, 1), P(k1+1, k2+1, 1), P(k1, k2+1, 1)];
        Yv = [P(k1, k2, 2), P(k1+1, k2, 2), P(k1+1, k2+1, 2), P(k1, k2+1, 2)];
        Zv = [P(k1, k2, 3), P(k1+1, k2, 3), P(k1+1, k2+1, 3), P(k1, k2+1, 3)];
        
        % Disegna la superficie tra i quadrati (trasparente)
        patch(Xv, Yv, Zv, 'r', 'FaceAlpha', 0.2, 'EdgeColor', 'none'); % Superficie rossa trasparente
    end
end

% Visualizza i punti di controllo come cerchi neri, con il riempimento colorato
plot3(P(:,:,1), P(:,:,2), P(:,:,3), 'ko', 'MarkerFaceColor', color);

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Poligono di Controllo ');
view(3);  % Visualizzazione in 3D
grid on;
hold off;

% Visualizza sia la superficie Bézier che il poligono di controllo insieme in una nuova figura
% figure; % Nuova figura
% hold on;
% 
% % Mostra la superficie Bézier
% trisurf(TRI, Q(:,1), Q(:,2), Q(:,3)); % Superficie Bézier
% 
% % Disegna il poligono di controllo come superficie trasparente
% for k1 = 1:np1-1
%     for k2 = 1:np2-1
%         % Definisci i vertici del quadrato tra i punti di controllo
%         Xv = [P(k1, k2, 1), P(k1+1, k2, 1), P(k1+1, k2+1, 1), P(k1, k2+1, 1)];
%         Yv = [P(k1, k2, 2), P(k1+1, k2, 2), P(k1+1, k2+1, 2), P(k1, k2+1, 2)];
%         Zv = [P(k1, k2, 3), P(k1+1, k2, 3), P(k1+1, k2+1, 3), P(k1, k2+1, 3)];
% 
%         % Disegna la superficie tra i quadrati (trasparente)
%         patch(Xv, Yv, Zv, 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'red'); % Superficie rossa 
%     end
% end
% 
% % Visualizza i punti di controllo come cerchi neri, con il riempimento colorato
% plot3(P(:,:,1), P(:,:,2), P(:,:,3), 'ko', 'MarkerFaceColor', color);
% 
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Superficie Bézier + Poligono di Controllo');
% view(3);  % Visualizzazione in 3D
% grid on;
% hold off;
