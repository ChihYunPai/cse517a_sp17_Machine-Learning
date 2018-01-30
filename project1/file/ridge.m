function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w   dx1 weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
if size(w,1)~=d % w should be size dx1
    w=w';
end
% loss = (w'*xTr-yTr)*(w'*xTr-yTr)' + lambda*(w'*w);
% or
% loss = (w'*xTr)*(xTr'*w)-w'*xTr*yTr'-yTr*xTr'*w+yTr*yTr';
A=w'*xTr-yTr;
loss = A*A' + lambda*(w'*w);
gradient = 2*(xTr*xTr'*w - xTr*yTr' + lambda*w);
end