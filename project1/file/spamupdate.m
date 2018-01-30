function w=spamupdate(w,email,truth);
%	function w=spamupdate(w,email,truth);
%
% Input:
% w 	weight vector
% email instance vector
% truth label
%
% Output:
%
% updated weight vector

% INSERT CODE HERE:
x=email;
y=truth;
%[d,~]=size(x);
[~,n]=size(y);
for m = 1:1000
    ii = randperm(n);
    mistake = 0;
    for i = 1:n
        if y(:,ii(i))*(w' * x(:,ii(i))) <= 0
            w = w + y(:,ii(i))*x(:,ii(i)); 
            mistake = mistake + 1;
        end
    end
    
    if mistake == 0
        break;
    end
end