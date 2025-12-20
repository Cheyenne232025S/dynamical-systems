% Clean screen and workspace.
clc;
clear;
close all;
% Parameters.
x0 = 100.0;
a  = 0.65;

% Simulating difference equation.
kmax = 100;
x    = zeros(1, kmax + 1);
x(1) = x0;
for k = 1:kmax
    x(k + 1) = a * x(k);
end

% Plot results.
plot(0:kmax, x, '.', 'MarkerSize', 14);
title(sprintf('x0 = %.2f,\t a = %.2f', x0, a));
xlabel('k');
ylabel('x(k)');
