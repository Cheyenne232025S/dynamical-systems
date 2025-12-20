% Test for powermethod.m
clear; clc;

% Define matrix A
A = [0.44 0.49 0.15;
     0.55 0.13 0.33;
     0.01 0.38 0.52];

% Initial vector x0 = ones(3,1)
x0 = ones(3,1);

% Parameters
maxiter = 1000;
tol = 1e-8;

% Run Power Method
[lambda, v, res] = powermethod(A, x0, maxiter, tol);

% Display results
disp('Dominant eigenvalue:')
disp(lambda)

disp('Corresponding eigenvector (normalized):')
disp(v)
