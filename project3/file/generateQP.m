function [H,q,Aeq,beq,lb,ub]=generateQP(K,yTr,C);
% function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% C : regularization constant
% 
% Output:
% H,q,Aeq,beq,lb,ub as defined in the MATLAB function 'quadprog'
%
% A call of quadprog (H, q, A, b,Aeq,beq,lb, ub,alpha0); should return the solution of the SVM specified by K,yTr,C
% for any valid alpha0 initialization.
%

% alpha = quadprog(H,q,A,b,Aeq,beq,lb, ub,alpha0) attempts to solve the quadratic programming 
%     problem:
%  
%              min 0.5*alpha'*H*alpha + q'*alpha   subject to: Aeq*alpha = beq
%              alpha   
%              lb<= x <= ub
%              alpha0 : initialization of alpha


[m,n]=size(K);
assert(m==n);
m = size(yTr,2);
assert(m==n);

% YOUR CODE
H   = .5 * (yTr'*yTr) .* K;
% H   = .5 * diag(yTr) * K * diag(yTr);
if (~issymmetric(H))
    H=(H+H')/2;
end
q   = -ones(n,1);
Aeq = yTr;
beq = 0;
lb  = zeros(n,1);
ub  = C * ones(n,1);
end