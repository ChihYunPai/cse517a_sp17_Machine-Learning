clear all;
addpath('data');
load data_train;
valsplit;
whos
f=@(w) ridge(w,xTr,yTr,0.1);
w=grdescent(f,zeros(size(xTr,1),1),1e-6,1000);

trainspamfilter(xTr,yTr);
spamfilter(xTv,yTv,0.1);