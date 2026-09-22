function Q=cast1(t,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Function Q=cast1(t,P)
%%   Convex hull of a Bézier curve
%%   Build control points
%%   Step 1: t in [0, 0.5]
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
XPP=XP;
YPP=YP;
xx=XP;yy=YP;
XPP(1)=xx(1);YPP(1)=yy(1);
for kk=1:m
    xxx=xx;
    yyy=yy;
    for k=kk:m
        xx(k+1)=(1-t)*xxx(k)+t*xxx(k+1);
        yy(k+1)=(1-t)*yyy(k)+t*yyy(k+1);
    end
    XPP(kk+1)=xx(kk+1);YPP(kk+1)=yy(kk+1);
end
Q=[XPP',YPP'];
