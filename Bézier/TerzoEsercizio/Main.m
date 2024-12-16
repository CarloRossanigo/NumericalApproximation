%% Superfici di Bèzier

clear all; close all;
C1=1; C2=0; C3=1;
if(C1==1)
    np1=randi([2,7]);
    np2=randi([2,7]);
    C2=1;
else
    np1=4; np2=5;
end
%disp(['Numero di punti di controllo: ', num2str((np1+1)*(np2+1))]);

% Definizione dei punti di controllo (griglia rettangolare)
P = zeros(np1, np2, 3); % matrice di punti di controllo di dimensione (np1 x np2 x 3)
if(C2==1)
    P(:,:,1) = rand(np1, np2) * 10;  % Coordinate X
    P(:,:,2) = rand(np1, np2) * 10;  % Coordinate Y
    P(:,:,3) = rand(np1, np2) * 10;  % Coordinate Z
else
    P(:,:,1) = [ 1., 0.2, 2., 1.2, 3.;
                 0.7, 1.5, 2.5, 3.5, 0.5;
                 1., 0., 7., 2.9, 1.1;
                 2.1, 3., 4., 2., 0. ];
    P(:,:,2) = [0.1 , 1. , 8. , 9. , 4. ;
      0.5 , 1. , 6. , 3. , 4.3 ;
      0. , 1. , 3.2 , 3.1 , 5. ;
      1. , 1. , 2.2 , 2. , 4.2];
    P(:,:,3)=[1.,4.,5.,0.4,6.0;
    1., 0., 7., 2.9, 1.1;
    1. , 1. , 2.2 , 2. , 4.2;
    2.1, 3., 4., 2., 0.];
end
% disp('Punti di controllo generati:');
% disp(P(:,:,1))  % Visualizza le coordinate X
% disp(P(:,:,2))  % Visualizza le coordinate Y
% disp(P(:,:,3))  % Visualizza le coordinate Z

%% Scegliamo una superficie per ZP
plan=0; % Superficie piana
if (plan==1)
    P(:,:,3) = [ 0., 0., 0., 0., 0.;
                  1., 1., 1., 1., 1.;
                  2., 2., 2., 2., 2.;
                  3., 3., 3., 3., 3. ];
end

%% Superficie cilindrica (selezione opzionale)
cyl=0;
if (cyl==1)
    xc1=0.; yc1=4.; zc1=1.; r1=4.;
    for k1=1:np1
        r1=r1 - (k1-1)*0.2;
        for k2=1:np2
            ddx = (P(k1,k2,1)-xc1)^2;
            ddy = (P(k1,k2,2)-yc1)^2;
            P(k1,k2,3) = zc1 + real(sqrt(r1^2 - ddy));  % Calcola Z in base alla forma cilindrica
        end
    end
end

if(C3==1)
    % Mischia i punti di controllo
    P(:,:,1) = P(randperm(np1), randperm(np2), 1);
    P(:,:,2) = P(randperm(np1), randperm(np2), 2);
    P(:,:,3) = P(randperm(np1), randperm(np2), 3);

    % disp('Punti di controllo generati random:');
    % disp(P(:,:,1))  % Coordinate X
    % disp(P(:,:,2))  % Coordinate Y
    % disp(P(:,:,3))  % Coordinate Z
end

%% Definizione del patch di Bézier
T1 = 0:0.05:1.;  % Parametri di campionamento
[TR1,Q] = sbezier(T1, P);

%% Visualizzazione del patch di Bézier
ubezier(TR1, Q, P, 'k');
%%title('Esempio di Patch di Bézier ', 'FontSize', 14);
