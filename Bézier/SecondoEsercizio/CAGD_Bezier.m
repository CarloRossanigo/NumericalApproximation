function PP = CAGD_Bezier(P, t)
    % Function to compute the Bézier curve using Casteljau's algorithm
    % Input:
    %   P - Control-point matrix (m+1, 2)
    %   t - Parameter vector t (between 0 and 1)
    % Output:
    %   PP - Matrix containing the points computed on the Bézier curve
    
    n = length(t);  % Number of points to compute on the curve
    PP = zeros(n, 2);  % Matrix for storing the curve points
    
    % Compute the curve for each value of t
    for k = 1:n
        T = t(k);  % Parameter t for the current point
        PP(k, :) = CAGD_casteljau(T, P);  % Compute the point on the curve using Casteljau
  
    end
end
