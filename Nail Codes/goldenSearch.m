function y = goldenSearch(f,xU,xL,direction,tol,plot)
% STEP 1: INITIALIZE SOME VARIABLES
rho = (sqrt(5)-1)/2;
d = abs(xU-xL);
it = 0; % iteration number
err = inf; % relative error initialize

% STEP 1.1 CONVERGENCE PLOT (OPTIONAL WITH PARAMATERS)
if plot == 1
    figure; hold on; grid on;
    set(gca, 'YScale', 'log');
    xlabel('Iteration Number'); ylabel('Relative Error')
end

% STEP 2: CALCULATE X1 AND X2
x2 = xL+rho*d;
x1 = xU-rho*d;

% STEP 3: EVALUATE FUNCTION AT X1 AND X2
f1 = f(x1);
f2 = f(x2);
% STEP 4: CHOOSE MINIMIZER OR MAXIMAZER? 

if strcmp(direction, 'min')
    % MINIMIZER %
    while err > tol
        if f1 > f2
            % UPDATE TO LOWER BOUND
            xL = x1;
            % GENERATE X2, REPLACE X2->X1
            x1 = x2;
            f1 = f2;
            d = abs(xU-xL);
            x2 =  xL + d*rho;
            % EVALUATION INTERMEDIATE VALUE
            f2 = f(x2);

        elseif f1 < f2 
            % UPDATE TO UPPER BOUND
            xU = x2;
            % GENERATE X1 REPLACE X1-> X2
            x2 = x1;
            f2 = f1;
            d = abs(xU-xL);
            x1 =  xU - d*rho;
            % EVALUATION INTERMIDATE VALUE
            f1 = f(x1);
        else
            xL = (x1 + x2)/2;
            xU = xL;
        end
        % RELATIVE ERROR CALCULATION
        err = 2*abs(xU-xL)/(xU+xL);
        it = it + 1;
        if plot == 1
            scatter(it,err);
        end
    end 
    % RESULT
    y = xL; 
    
elseif strcmp(direction, 'max')
    % MAXIMAZER %
    it = 0;
    err = inf; % Initializing the error variable
    while err > tol
        if f1 > f2
            % UPDATE TO UPPER BOUND
            xU = x2;
            % GENERATE X1, REPLACE X1->X2
            x2 = x1;
            f2 = f1;
            d = abs(xU-xL);
            x1 =  xU - d*rho;
            % EVALUATION INTERMEDIATE VALUE
            f1 = f(x1);

        elseif f1 < f2 
            % UPDATE TO LOWER BOUND
            xL = x1;
            % GENERATE X2 REPLACE X2-> X1
            x1 = x2;
            f1 = f2;
            d = abs(xU-xL);
            x2 =  xL + d*rho;
            % EVALUATION INTERMIDATE VALUE
            f2 = f(x2);
        else
            xL = (x1 + x2)/2;
            xU = xL;
        end
        % RELATIVE ERROR CALCULATION
        err = 2*abs(xU-xL)/(xU+xL);
        it = it + 1;
        if plot == 1
            scatter(it,err);
        end
    end 
    % RESULT
    y = xL; 
else
    msg = 'You should pass a direction to algorithm i.e. min or max';
    error(msg)
end

end