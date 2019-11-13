%% Dichotomous Search Algorithm with given function evaluations
function out = dichotomousWithFeval(f,N,a,b)
%f : function
%N : The number of function evaluations
%a : Lower Bound
%b : Upper Bound

% Calculation of the length of uncertainty
FUNCTION_EVALUATION = N;
n = FUNCTION_EVALUATION/2; % n is the iteration number 
epsilon = (b-a)/exp(n*log(2)); % the length of uncertainty

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