function logratio = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);
%% fill in code here
[PY_pos,PY_neg] = naivebayesPY(x,y);
[PXY_pos,PXY_neg] = naivebayesPXY(x,y); % PXY_pos = P(X=x1|Y=+1): dx1, PXY_neg = P(X=x1|Y=-1): dx1
PXY_pos = prod(PXY_pos.^x1);
PXY_neg = prod(PXY_neg.^x1);
PYX_pos = PXY_pos*PY_pos / (PXY_pos*PY_pos + PXY_neg*PY_neg);
PYX_neg = PXY_neg*PY_neg / (PXY_pos*PY_pos + PXY_neg*PY_neg);
logratio = log(PYX_pos/PYX_neg);
end