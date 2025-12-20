% Clean screen and workspace.
clc;
clear;
close all;

% Set font size for lecture screen.
set(0, ...
    'defaultaxesfontsize'  , 14, ...
    'defaultaxeslinewidth' , 1.0, ...
    'defaultlinelinewidth' , 2.0, ...
    'defaultpatchlinewidth', 1.0, ...
    'defaulttextfontsize'  , 18, ...
    'DefaultLineMarkerSize', 10);

% Function of root finding problem.
g = @(x) x^3 + 4 * x^2 - 10;

f1  = @(x) x - g(x);
f2  = @(x) 0.5 * (10 - x^3)^0.5;
f3  = @(x) x - (x^3 + 4*x^2 - 10) / (3*x^2 + 8*x);
fnm = @(x) x - g(x) / (exp(x) - 2);

x0 = 1.5;

% Solution for comparison.
xhat = 1.365230013414097;

% Iteration.
kmax = 50;
x    = zeros(1, kmax + 1);
x(1) = x0;

for k = 1:kmax
    x(k + 1) = f3(x(k));
end

% Plot convergence results.
figure(1);
subplot(2, 1, 1);
plot(0:kmax, g(x), '.-');
xlabel('iteration step k');
ylabel('g(x)');
title('Convergence of fixed point iteration')

subplot(2, 1, 2);
semilogy(0:kmax, abs(x - xhat) + eps, '.-');
xlabel('iteration step k');
ylabel('x(k) - xhat');
