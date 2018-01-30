function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w   dx1 weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
if nargin<4,lambda=0.1;end
[d,n]=size(xTr);
loss = 0;
for i=1:n
    loss = loss + max((1-yTr(i)*(w'*xTr(:,i))), 0);
end
loss = loss + lambda*(w'*w);
gradient = zeros(d,1);
for i=1:n
    if (yTr(i)*(w'*xTr(:,i))) < 1
        gradient = gradient - yTr(i)*xTr(:,i);
    end
end
gradient =  gradient + 2*lambda*w;
end