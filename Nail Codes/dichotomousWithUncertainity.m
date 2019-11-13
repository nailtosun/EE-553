%% Dichotomous Search Algorithm with given the length of uncertainity
function out = dichotomousWithUncertainity(f,epsilon,a,b)
%f : function
%epsilon : The length of uncertainity
%a : Lower Bound
%b : Upper Bound

% Calculation of the number of iteration

n = log((b-a)/epsilon)/log(2); % iteration number
l = (b+a)/2-epsilon; 
u = (b+a)/2+epsilon;

for k = 1:n
    if feval(f,l)>feval(f,u)
        a = l;
    elseif feval(f,l)<feval(f,u)
        b = u;
    else
        out = (l+u)/2;
    end
    l = (b+a)/2-epsilon;
    u = (b+a)/2+epsilon;
end
out = (l+u)/2;
end

