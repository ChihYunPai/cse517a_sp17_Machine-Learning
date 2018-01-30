function svmclassify=autosvm(xTr,yTr);
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
%
%
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%

Cs=2.^[-1:8];
kpar_rbf=2.^[-4:4];
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',Cs,kpar_rbf);
svmclassify=trainsvm(xTr,yTr,Cs(bestC),'rbf',kpar_rbf(bestP));
warning('off','all');
end