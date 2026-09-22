function Q=cast2(t,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Function Q=cast2(t,P)
%%   Convex hull of a Bézier curve
%%   Build control points
%%   Step 2: t in [0.5, 1]
%%
%%   Input  : t parameter value
%%            P control points matrix
%%
%%   Output : Q control points matrix
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
m=size(P,1)-1;  % P is the 2D control points matrix (XP, YP)
XP = P(:,1)';  % Extract the X column from matrix P
YP = P(:,2)';  % Extract the Y column from matrix P

xx = XP;  % Assign XP to the temporary variable xx
yy = YP;  % Assign YP to the temporary variable yy

for k = 1:m+1
    xx(m+2-k) = XP(k);  % Initialize values in the xx variable
    yy(m+2-k) = YP(k);  % Initialize values in the yy variable
end

for kk = 1:m
    xxx = xx;
    yyy = yy;
    XPP(m+2-kk) = xx(kk);
    YPP(m+2-kk) = yy(kk);

    for k = kk:m
        xx(k+1)=t*xxx(k)+(1-t)*xxx(k+1);
        yy(k+1)=t*yyy(k)+(1-t)*yyy(k+1);
    end
end

XPP(1) = xx(m+1);  % Assign the final value to XPP
YPP(1) = yy(m+1);  % Assign the final value to YPP

% The function returns an output XPP and YPP
Q = [XPP', YPP'];
