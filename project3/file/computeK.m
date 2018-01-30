function [K] = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxm);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%
[d1,m]=size(X);
[d2,n]=size(Z);
assert(d1==d2);

assert( nargin >= 2);
if nargin < 4
    param = 1;
end
if nargin < 3
	Z=X;
end

switch kernel_type
    case {'linear','LINEAR','Linear'}
        K = X' * Z;
    case {'polynomial','poly','Polynomial','Poly'}
        K = (X' * Z + 1) .^ param;
    case {'rbf','RBF'}
        K = exp(-param * l2distance(X,Z));
%     case {'comb','combination'}
%         K = param1*exp(-param * l2distance(X,Z)) + param2*(X' * Z + 1) .^ param3;
    otherwise
        error('kernel_type should be either linear,poly or rbf')
end
if (~issymmetric(K)) && m==n
    K=(K+K')/2;
end
end