% Clean screen and workspace.
clc;
clear;
close all;

% defininf g(x) and J(x)
g = @(x) [ x(1)^2 + x(1)*x(2)^3 - 9;
           3*x(1)^2*x(2) - x(2)^3 - 4 ];

J = @(x) [ 2*x(1) + x(2)^3,     3*x(1)*x(2)^2;
           6*x(1)*x(2),         3*x(1)^2 - 3*x(2)^2 ];

% ----- Parameters -----
x0      = [3; 3];
maxiter = 100;
tol     = 1e-10;

% ----- Run Newton -----
[xr, res] = newtonmethod_vectorvalue(g, J, x0, maxiter, tol);

% ----- Results-----
fprintf('=== Newton Method (Part b) ===\n');
fprintf('Initial guess x0 = [%g; %g]\n', x0(1), x0(2));
fprintf('Final iterate xr = [%.16g; %.16g]\n', xr(1), xr(2));
fprintf('Final residual norm ||g(xr)||_2 = %.3e\n', norm(g(xr),2));
fprintf('Number of iterations: %d\n', length(res));
