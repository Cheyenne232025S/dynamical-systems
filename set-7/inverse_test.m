% Clean screen and workspace.
clc;
clear;
close all;

% load in A transition matrix, A
load("railmatrix.mat","A");

x0 = ones(371,1);
mu = 0
maxiter = 100

tol = 1e-10;

% Run Power Method
[lambda, v, res] = inverseiteration(A, mu, x0, maxiter, tol)

 % Display results
disp('eigenvalue clostest to mu shift 0:')
disp(lambda)

#disp('Corresponding eigenvector (normalized):')
#disp(v)

figure;
semilogy(res, 'LineWidth', 2);
xlabel('Iteration number');
ylabel('Residual norm ||A v_k - \lambda_k v_k||_2');
title('Inverse Iteration Residual Per Iteration');
grid on;
