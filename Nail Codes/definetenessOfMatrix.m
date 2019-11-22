A = [-2 2 6; 2 -2 0; 6 0 -2];
%% Attempt 1 Cholesky Factorization
try chol(A)
    disp('Matrix is symmetric positive definite.')
catch ME
    disp('Matrix is not symmetric positive definite')
end
%% Attempt 2 Check the Eigenvalues 
d = eig(A)