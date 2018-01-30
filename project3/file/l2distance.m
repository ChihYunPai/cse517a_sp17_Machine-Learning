function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

[d,n]=size(X);
if (nargin==1) % case when there is only one input (X)
	D = triu(repmat(sum(X'.*X',2),1,n),1) + triu(X'*X,1) + triu(repmat(sum(X.*X,1),n,1),1);
    D = real(sqrt(D+D'));
else  % case when there are two inputs (X,Z)
    m = size(Z,2); % number of input vectors in Z
    D = real(sqrt(repmat(sum(X'.*X',2),1,m)-2*(X'*Z)+repmat(sum(Z.*Z,1),n,1)));
end

if (isequal(X,Z))
    D(logical(eye(size(D)))) = 0;
end
end



