function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% w   dx1 weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
if size(w,1)~=d % w should be size dx1
    w=w';
end
loss = 0;
for i = 1:n
   loss = loss + log(1 + exp(-yTr(i)*(  w'*xTr(:,i)  ) )); 
end
gradient = 0;
for i = 1:n
    gradient = gradient - (yTr(i)*xTr(:,i))./(1 + exp(yTr(i)*(w'*xTr(:,i))));
end
end