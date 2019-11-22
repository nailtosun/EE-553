function [x,it,fcall,T] = fibonacciSearch(f,UI,tolerance,display)
% func: objective function
% UI: initial interval of uncertainity or given boundaries in array form[]
% tolerance:
% display: Logic value -> 1: Show iteration table 0:No display

% x: local minima
% it: iteration number
% fcall: How many function evaluation is done
% T: Table of xL xU x1 x2
tic;
fcall = 0;
n = (UI(2)-UI(1))/tolerance; %Array Length
T = 0;
m = 0;  %Fibonacci Index

% Creating fibonacci sequence
while (true)
    if fibonacci(m) > n
        break;
    else
        m = m + 1;
    end
end


% Boundary evaluations
xL = UI(1);
xU = UI(2);
fL = feval(f,UI(1)); fcall = fcall + 1;
fU = feval(f,UI(2));fcall = fcall + 1;


% Anonymous function definition of intermediate value calculation
fx1 = @(m,i,xU,xL) (fibonacci(m-i-2)/fibonacci(m))*(xU-xL)+xL;
fx2 = @(m,i,xU,xL) (fibonacci(m-i-1)/fibonacci(m))*(xU-xL)+xL;

% Inýtial intermediate points
i = 0;
x1 = fx1(m,i,xU,xL);
x2 = fx2(m,i,xU,xL);
f1 = feval(f,x1); fcall = fcall + 1;
f2 = feval(f,x2); fcall = fcall + 1;
if display == 1
    xL_memory(i+1) = xL;
    xU_memory(i+1) = xU;
    x1_memory(i+1) = x1;
    x2_memory(i+1) = x2;
end
i = i + 1; 
it = 1;
% Indefinite function evaluation to satisfy tolerance
while (abs(xL - xU) > tolerance)
    if f1 > f2
        xL = x1; % Lower bound update
        x1 = x2;  f1 = f2; % Swapping intermediate values
        x2 = fx2(m,i,xU,xL); % Intermediate value calculation
        f2 = feval(f,x2); fcall = fcall + 1; % Intermediate value calculation
        if display == 1
            xL_memory(i+1) = xL;
            xU_memory(i+1) = xU;
            x1_memory(i+1) = x1;
            x2_memory(i+1) = x2;
        end
    else
        xU = x2; % Upper bound update
        x2 = x1; f2 = f1; % Swapping intermediate values
        x1 = fx1(m,i,xU,xL);  % Intermediate value calculation
        f1 = feval(f,x1); fcall = fcall + 1;
        if display == 1
            xL_memory(i+1) = xL;
            xU_memory(i+1) = xU;
            x1_memory(i+1) = x1;
            x2_memory(i+1) = x2;
        end
    end
    i = i + 1;  it = it + 1;
end
toc;
x = (xL+xU)/2;
if display == 1
    try
        T = table(xL_memory, x1_memory, x2_memory,xU_memory,'VariableNames', {'xL','x1','x2','xU'});
    catch
        display('Bug')
    end
end

end
