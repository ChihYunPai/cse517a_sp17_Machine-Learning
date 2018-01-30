function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% maxiter = max iteration times
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end
if nargin<4,maxiter=10^5;end
if nargin<3,stepsize=0.1;end
loss=inf;
w=w0;%Initialize the weights at tiem step t=0 to w0
for t = 0:maxiter
    loss_old = loss;
   [loss,gradient]=func(w); %Compute loss and gradient
   if loss <= loss_old
       stepsize = 1.01*stepsize;
   else %loss > loss_old
       stepsize = 0.5*stepsize;
   end
   w = w - stepsize*gradient; %Update the weights
   if (norm(gradient)<tolerance) %If ||gradient|| reaches tolerance, stop
       break;
   end
end
end