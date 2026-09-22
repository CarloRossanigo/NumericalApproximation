function [TRI, Q] = sbezier(T, P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Samples the Bézier surface using the de Boor - Cox algorithm
%%   Input :  T sampling values (n x n matrix)
%%            P control points matrix (m x n x 3)
%%   Output : TRI list of triangles composing the surface
%%            Q matrix with the sampled point coordinates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(T, 2);  % Number of sampling points (grid n x n)
n1 = n - 1;      % Number of triangles on one grid (n-1) x (n-1)
n2 = n * n;      % Total number of sampled points

% Initialize Q to store point coordinates
Q = zeros(n2, 3);

% Compute the points on the Bézier surface
for k1 = 1:n
    for k2 = 1:n
        t1 = T(k1);  % Parameter t1
        t2 = T(k2);  % Parameter t2
        q = coox(t1, t2, P);  % Compute the point using the CAGD_coox algorithm
        k = k1 + (k2 - 1) * n;  % Index of the point in Q
        Q(k, :) = q;     % Store the point in Q
    end
end

% Build the triangles (faces of the surface)
m = n1 * n1 * 2;  % Number of triangles
TRI = zeros(m, 3);  % Initialize TRI matrix

% Create triangles between adjacent points
for k1 = 1:n1
    for k2 = 1:n1
        k = k1 + (k2 - 1) * n1;
        kk = k1 + (k2 - 1) * n;  % Current point index
        % First triangle
        TRI(2 * k - 1, 1) = kk;
        TRI(2 * k - 1, 2) = kk + 1;
        TRI(2 * k - 1, 3) = kk + 1 + n;
        % Second triangle
        TRI(2 * k, 1) = kk;
        TRI(2 * k, 2) = kk + n;
        TRI(2 * k, 3) = kk + n + 1;
    end
end
