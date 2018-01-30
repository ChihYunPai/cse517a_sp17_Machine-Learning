function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%

[d,n]=size(xTr);
crossvalidate_times=10;
r=1/crossvalidate_times;
allvalerrs=zeros(length(Cs),length(paras),crossvalidate_times);
for validate_itr = 1:crossvalidate_times
    %% Split off validation data set. 
    %  Randomly choose r% of data set as validation set, the other (100-r)% as training set
%     r=0.3;
%     index_val = randperm(n);
%     index_val = index_val(1:round(r*n));
    if validate_itr==1
        index_val = 1:round(r*n);
    else
        index_val = round((validate_itr-1)*r*n)+1:round((validate_itr*r)*n);
    end
    X_val     = xTr(:,index_val);
    Y_val     = yTr(:,index_val);
    X_train   = xTr;
    Y_train   = yTr;
    X_train(:,index_val)=[];
    Y_train(:,index_val)=[];
    %% Evaluate all parameter settings
    for i = 1:length(Cs)
       for j = 1:length(paras)
           % validation
           [svmclassify,sv_i,alphas]    = trainsvm(X_train,Y_train, Cs(i),ktype,paras(j));
           allvalerrs(i,j,validate_itr) = sum(sign(svmclassify(X_val))~=Y_val')/length(Y_val);
       end
    end
end
%% Find best parameter through comparing the averages of all crossvalidate errors
allvalerrs=mean(allvalerrs,3);
bestval=min(min(allvalerrs));
[bestC,bestP] = find(allvalerrs==bestval);
% optimal points might more than one.
bestC=bestC(1);
bestP=bestP(1);

end