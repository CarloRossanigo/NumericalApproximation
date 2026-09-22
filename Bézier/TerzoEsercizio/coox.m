function q = coox(t1, t2, P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction of a point on the Bézier surface
%%   using the Boor - Coox algorithm
%%
%%   P is a matrix of size (m x n x 3), where each element
%%   P(k, l, :) contains the coordinates (x, y, z) of a control point
%%
%%   Input:
%%       t1, t2   : parameters on the surface (typically between 0 and 1)
%%       P        : matrix (m x n x 3) of control points
%%
%%   Output:
%%       q        : point [x, y, z] on the Bézier surface
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dimensions of the control point matrix
np1 = size(P, 1); % Number of rows (m)
np2 = size(P, 2); % Number of columns (n)

% Initialization of vectors
xx1 = zeros(np1, 1);
yy1 = zeros(np1, 1);
zz1 = zeros(np1, 1);

% Construction of points P_q1 (approximation along direction 2)
for k1 = 1:np1
    % Construction of a temporary vector for each row P(k1, 1:n)
    xx2 = zeros(np2, 1);
    yy2 = zeros(np2, 1);
    zz2 = zeros(np2, 1);
    
    % Extraction of points from matrix P
    for k2 = 1:np2
        % Points along direction 2
        xx2(k2) = P(k1, k2, 1);  % x
        yy2(k2) = P(k1, k2, 2);  % y
        zz2(k2) = P(k1, k2, 3);  % z
    end
    
    % Computation of the point on the Bézier curve in direction 2
    q = cast3d(t2, [xx2, yy2, zz2]);
    
    % Storage of the result
    xx1(k1) = q(1);
    yy1(k1) = q(2);
    zz1(k1) = q(3);
end

% Final computation of the point on the Bézier surface
q = cast3d(t1, [xx1, yy1, zz1]);
