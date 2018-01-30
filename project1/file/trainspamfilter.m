function trainspamfilter(xTr,yTr);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

[d,n]=size(xTr);

% Feel free to change this code any way you want
% f=@(w) logistic(w,xTr,yTr);
% w0=normrnd(0,0.1,[size(xTr,1),1]); % initialize with normal distribution with small variance vector
% w=grdescent(f,w0,1e-05,10000);

% Hinge loss
% f=@(w) hinge(w,xTr,yTr);
% w0=normrnd(0,0.1,[size(xTr,1),1]); % initialize with normal distribution with small variance vector
% w=grdescent(f,w0,1e-05,10000);
% save('w0','w');

% Losgistic loss
f=@(w) logistic(w,xTr,yTr);
w0=normrnd(0,0.1,[size(xTr,1),1]); % initialize with normal distribution with small variance vector
w=grdescent(f,w0,1e-05,10000);
save('w0','w');
