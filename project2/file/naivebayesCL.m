function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[d,n]=size(x);
%% fill in code here
[Y_pos,Y_neg] = naivebayesPY(x,y);
[PXY_pos,PXY_neg] = naivebayesPXY(x,y);
w = log(PXY_pos./PXY_neg);
b = log(Y_pos/Y_neg);
end