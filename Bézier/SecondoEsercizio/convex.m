function h=convex(P);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Function h=convex(P)
%%   Check convexity of the Bézier curve
%%
%%   Input  : P control points matrix
%%
%%   Output : h approximation of the curve convexity
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=P(:,1)';Y=P(:,2)';
n=size(X,2);h=0.;tol=1.e-06;
for k=2:n-1
    xx=X(k-1)-X(k+1);yy=Y(k-1)-Y(k+1);
    if ( abs(xx) > tol )
        yy=Y(k-1)*(X(k)-X(k+1))-Y(k+1)*(X(k)-X(k-1));
        yk=yy/xx;
        h=max(h,abs(yk-Y(k)));
    else 
        if ( abs(yy) > tol )
            xx=X(k-1)*(Y(k)-Y(k+1))-X(k+1)*(Y(k)-Y(k-1));
            xk=xx/yy;
            h=max(h,abs(xk-X(k)));
        end
    end
end
