function  gradient = backprop(W, as,zs, yTr,  der_trans_func)
% function [gradient] = backprop(W, as, zs, yTr,  der_trans_func)
%
% INPUT:
% W weights (cell array)
% as output of forward pass (cell array)
% zs output of forward pass (cell array)
% yTr 1xn matrix (each entry is a label)
% der_trans_func derivative of transition function to apply for inner layers
%
% OUTPUTS:
% 
% gradient = the gradient at w as a cell array of matrices
%

n=length(yTr);
delta=zs{1}-yTr;
% compute gradient with back-prop
gradient = cell(size(W));
for i=1:length(W)
    % INSERT CODE HERE:
    gradient{i}=delta*zs{i+1}'/n;
    delta=der_trans_func(as{i+1}).*((W{i}(:, 1:size(W{i},2)-1))' * delta);
end
end

