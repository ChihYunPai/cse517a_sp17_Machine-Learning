function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (1x1)
%
% Output:
% preds: predictions
%

%% fill in code here
preds = sign(w'*x+b);
end