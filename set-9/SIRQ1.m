% Clean screen and workspace.
clc;
clear;
close all;


% SIR model.
f = @(x, alpha, beta) [ ...
    x(1) - x(1) * x(2) * beta; ...
    x(2) + x(1) * x(2) * beta - alpha * x(2); ...
    x(3) + alpha * x(2) ...
];

% Parameters.
beta = 0.001 % Infection rate
alpha = 0.007 % recovery rate

x0 = [99; 1; 0]

% Simulation.
kmax = 744;
X = zeros(3, kmax + 1);
X(:, 1) = x0;
for k = 1:kmax
X(:, k + 1) = f(X(:, k), ...
alpha, ...
beta);
end

% Plot convergence results.
figure(1);
plot(0:kmax, X(1, :), 'o-');
hold on;
plot(0:kmax, X(2, :), 's-');
plot(0:kmax, X(3, :), 'x-');
hold off;
xlabel('Hour k');
ylabel('Population numbers');
title('Hokie Plague Simulation');
legend('S', 'I', 'R');

