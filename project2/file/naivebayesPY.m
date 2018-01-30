function [pos,neg] = naivebayesPY(x,y)
% function [pos,neg] = naivebayesPY(x,y);
%
% Computation of P(Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% pos: probability p(y=1)
% neg: probability p(y=-1)
%

% add one all-ones positive and negative example
x=[x ones(size(x,1),2)];
y=[y -1 1];
[d,n] = size(x);
%% fill in code here
pos = sum(y==1)/n;
neg = sum(y==-1)/n;
end