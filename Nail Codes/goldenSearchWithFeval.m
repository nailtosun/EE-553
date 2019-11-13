function out = goldenSearchWithFeval(f,xL,xU,N)
%% USAGE
%f: function to evaluate
%xU: upper bound
%xL: lower bound
%N: the number of allowed function evaluation

% STEP 1: INITIALIZE
rho = (-1+sqrt(5))/2;
d = xU-xL;

% STEP 2: FIND INTERMEDIATE POINTS
x2 = xL + rho*d;
x1 = xU - rho*d;

% STEP 3: FUNCTION EVALUATION AT INTERMEDIATE POINTS
f2 = feval(f,x2);
f1 = feval(f,x1);

numOfLoop = N-2; % since we used 2 function evaluation at intermediate point

for i=1:numOfLoop
    if f1 > f2
        %Update lower bound 
        xL = x1;
        %Swapping 
        x1 = x2;
        f1 = f2;
        %new distance calculation
        d = xU - xL;
        % calculate x2
        x2 = xL + rho*d;
        % evaluate at x1 
        f2 = feval(f,x2);
    elseif f1 < f2
        % Update upper bound
        xU = x2;
        % swapping
        x2 = x1;
        f2 = f1;
        % new distance calculation 
        d = xU - xL;
        % calculate x1 
        x1 = xU-d*rho;
        % evaluate at x1
        f1 = feval(f,x1);
    else
        xL = (x1 + x2)/2;
        xU = xL;
    end
end
out = (x1 + x2) / 2;
end