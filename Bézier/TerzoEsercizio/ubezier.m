function ubezier(TRI, Q, P, color)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Visualization of the Bézier surface with control points
%%   and control polygon
%%
%%   Input : TRI list of triangles composing the surface
%%           Q matrix (n^2 x 3) with the sampled point coordinates
%%           P matrix (m x n x 3) with the control point coordinates
%%           color color for the control points
%%
%%   Output : Displays the Bézier surface, the control polygon,
%%            and the combination of both
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Display the Bézier surface in a new figure
figure; % Create a new figure
hold on;
trisurf(TRI, Q(:,1), Q(:,2), Q(:,3)); % Bézier surface
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Bézier Surface');
view(3);  % 3D view
grid on;
hold off;

% 2. Display the control polygon as a surface in a new figure
figure; % New figure
hold on;

np1 = size(P, 1);  % Number of rows (m)
np2 = size(P, 2);  % Number of columns (n)

% Draw the control polygon as a transparent surface
for k1 = 1:np1-1
    for k2 = 1:np2-1
        % Define the vertices of the square between control points
        Xv = [P(k1, k2, 1), P(k1+1, k2, 1), P(k1+1, k2+1, 1), P(k1, k2+1, 1)];
        Yv = [P(k1, k2, 2), P(k1+1, k2, 2), P(k1+1, k2+1, 2), P(k1, k2+1, 2)];
        Zv = [P(k1, k2, 3), P(k1+1, k2, 3), P(k1+1, k2+1, 3), P(k1, k2+1, 3)];
        
        % Draw the surface between the patches (transparent)
        patch(Xv, Yv, Zv, 'r', 'FaceAlpha', 0.2, 'EdgeColor', 'none'); % Transparent red surface
    end
end

% Display the control points as black circles with colored fill
plot3(P(:,:,1), P(:,:,2), P(:,:,3), 'ko', 'MarkerFaceColor', color);

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Control Polygon');
view(3);  % 3D view
grid on;
hold off;

% Display both the Bézier surface and the control polygon together in a new figure
% figure; % New figure
% hold on;
% 
% % Show the Bézier surface
% trisurf(TRI, Q(:,1), Q(:,2), Q(:,3)); % Bézier surface
% 
% % Draw the control polygon as a transparent surface
% for k1 = 1:np1-1
%     for k2 = 1:np2-1
%         % Define the vertices of the square between control points
%         Xv = [P(k1, k2, 1), P(k1+1, k2, 1), P(k1+1, k2+1, 1), P(k1, k2+1, 1)];
%         Yv = [P(k1, k2, 2), P(k1+1, k2, 2), P(k1+1, k2+1, 2), P(k1, k2+1, 2)];
%         Zv = [P(k1, k2, 3), P(k1+1, k2, 3), P(k1+1, k2+1, 3), P(k1, k2+1, 3)];
% 
%         % Draw the surface between the patches (transparent)
%         patch(Xv, Yv, Zv, 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'red'); % Surface
%     end
% end
% 
% % Display the control points as black circles with colored fill
% plot3(P(:,:,1), P(:,:,2), P(:,:,3), 'ko', 'MarkerFaceColor', color);
% 
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Bézier Surface + Control Polygon');
% view(3);  % 3D view
% grid on;
% hold off;
