function p = CAGD_casteljau(t, P)
    % De Casteljau algorithm to compute a point on a Bézier curve
    % Input:
    %   t - Parameter t (between 0 and 1) for computing the point on the curve
    %   P - Control-point matrix (m+1, 2)
    % Output:
    %   p - Point on the Bézier curve corresponding to parameter t
    
    m = size(P, 1) - 1;  % m is the number of control points minus 1
    x = P(:, 1);         % x-coordinate of the control points
    y = P(:, 2);         % y-coordinate of the control points
    
    % Iterate to compute the intermediate points
    for k = 1:m
        xx=x;
        yy=y;
        for kk =k:m
            x(kk+1) =  (1-t)* xx(kk) + t * xx(kk+1);
            y(kk+1) = (1-t) * yy(kk) + t * yy(kk+1);
        end
    end
    
    % The final point is the last one computed
    p = [x(m+1), y(m+1)];
end
