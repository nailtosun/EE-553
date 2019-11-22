syms x1;
syms x2;
%% Function definition
f = -(-x1^2-x2^2+x1*x2+7*x1+4*x2);

%Partial diff respect to x and y
dfx = diff(f,x1);
dfy = diff(f,x2);

gradf = [dfx;dfy]
%Hessian matrix calculation
A = hessian(f,[x1,x2])

%%
dfx1 = @(x1,x2) 2*x1 - x2 - 7
dfx2 = @(x1,x2)  2*x2 - x1 - 4
hess = @(x1,x2) [ 1200*x1^2 - 400*x2 + 2, -400*x1; -400*x1,    200]
%% Gradient Calculation
x1 = 1;
x2 = 1;
gradf = [dfx1(x1,x2) dfx2(x1,x2)]
hessResult = hess(x1,x2)
%% Defineteness of hessian matrix
display(eig(hessResult))
try chol(hessResult)
    disp('Matrix is symmetric positive definite.')
catch ME
    disp('Matrix is not symmetric positive definite')
end