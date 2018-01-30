function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE

sv_i = find(alphas > 1e-5 & alphas < C);
% bias = mean((1 ./ yTr(sv_i)) - alphas' * diag(yTr) * K(:,sv_i));

bias = mean(1./yTr(sv_i) - alphas' .* yTr *K(:,sv_i));
