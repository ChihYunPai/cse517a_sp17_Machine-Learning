clear all
[x,y]=genTrainFeatures();
[w,b]=naivebayesCL(x,y);
preds=classifyLinear(x,w,b);
trainingerror=sum(preds~=y)/length(y)