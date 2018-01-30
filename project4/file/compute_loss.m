function [loss] = compute_loss(zs, yTr)
% function [loss] = compute_loss(zs, yTr)
%
% INPUT:
% zs output of forward pass (cell array)
% yTr 1xn matrix (each entry is a label)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr, or the prediction of yTr is not passed on
%

% INSERT CODE HERE:
loss=.5*mean((zs{1}-yTr).^2);
end