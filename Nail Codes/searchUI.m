function [y itL itS fCount] = searchUI(f,x0,d,maxIteration)
    %% USAGE
    % f: Quasi-Convex function
    % x0: Initial point
    % d: direction of search
    % maxIteration: Maximum iteration allowed
    
    % y: UI Uncertainty Interval
    % itL: how many times step size diminished (LOWERED)
    % itS: how many times step size amplified
    % fCount: how many time cost function is evaluated
    
    % itS+itL: How many iteration spend for UI search 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %initialize iterations
    itL = 1; itS = 1; 
    alpha = 10/norm(d); % Step length relative the direction L2 norm
    
    f0 = feval(f,x0);
    fMid = feval(f,x0 + alpha/2*d);
    fAlpha = feval(f,x0 + alpha*d);
    fCount = 3;
    
    %search for local minima
    while (maxIteration>0)
        % Condition for decreasing alpha: LARGE STEP SIZE
        if f0 < fMid
            alpha = alpha / 2; fMid = feval(f,x0+(alpha/2)*d); fAlpha = feval(f,x0+alpha*d);
            fCount = fCount + 2;
            itL = itL+1;
            maxIteration = maxIteration - 1; 
        elseif fMid < fAlpha %% falpha<fmid<f0
            y = [x0 alpha*d];
            return
        else % f0>fMid fAlpha< fmid %% SMALL STEP SIZE
            alpha = alpha*2; fMid = feval(f,x0+(alpha/2)*d); fAlpha = feval(f,x0+alpha*d);
            fCount = fCount + 2;
            itS = itS+1;
            maxIteration = maxIteration - 1;
        end
    end
end
