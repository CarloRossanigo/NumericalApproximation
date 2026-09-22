function [xmin,xmax,ymin,ymax]=drectan(P);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Function [xmin,xmax,ymin,ymax]=drectan(P)
%
%%   Calculate the bounding rectangle of the control points
%%
%%   Input : P control points matrix
%%
%%   Output : xmin,xmax,ymin,ymax vertex coordinates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XP=P(:,1)';YP=P(:,2)';
xmin=min(XP);xmax=max(XP);
ymin=min(YP);ymax=max(YP);
