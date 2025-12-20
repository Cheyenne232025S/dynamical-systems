% Clean screen and workspace.
clc;
clear;
close all;

g = @(x) [ x(1)^2 + x(1)*x(2)^3 - 9;
           3*x(1)^2*x(2) - x(2)^3 - 4 ];

J = @(x) [ 2*x(1) + x(2)^3,     3*x(1)*x(2)^2;
           6*x(1)*x(2),         3*x(1)^2 - 3*x(2)^2 ];

x01 = [-3; -3];
x02 = [-3; 3];
x03 = [4; 0];

maxiter = 100;
tol     = 1e-10;

starts = {x01, x02, x03};

fprintf('=== Part (c): Roots from different initial guesses ===\n\n');

for i = 1:numel(starts)
    x0 = starts{i};
    [xr, res] = newtonmethod_vectorvalue(g, J, x0, maxiter, tol);

    gx = g(xr);
    fprintf('Start %d: x0 = [%g; %g]\n', i, x0(1), x0(2));
    fprintf('  Iterations: %d\n', length(res));
    fprintf('  Root xr = [%.12g; %.12g]\n', xr(1), xr(2));
    fprintf('  g(xr)   = [%.3e; %.3e]\n', gx(1), gx(2));
    fprintf('  ||g(xr)||_2 = %.3e\n\n', norm(gx,2));
end
