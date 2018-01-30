clear all
load spiral;
whos
dummy=@(X) sign(mean(X,1));
visdecision(xTr,yTr,dummy);

svmclassify=trainsvm(xTr,yTr,6,'rbf',0.25);
testerr = sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
trainerr = sum(sign(svmclassify(xTr))~=yTr(:))/length(yTr)

[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',2.^[-1:8]);
[xx,yy]=meshgrid(-2:3,-1:8);
surf(xx,yy,allerrs);
xlabel('\gamma'); ylabel('C'); zlabel('Val Error');


svmclassify=trainsvm(xTr,yTr,bestC,'rbf',bestP);
testerr=sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
visdecision(xTe,yTe,svmclassify,'vismargin',true)
