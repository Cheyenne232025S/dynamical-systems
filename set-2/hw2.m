% Clean screen and workspace.
clc;
clear;
close all;

% Setup system components.
A  = [0,1;1,1];
eig(A)
x0 = [0;1];

% Compute simulation.
kmax    = 15;
X       = zeros(2, kmax+1);
X(:, 1) = x0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k);
end

% Get first 16 numbers of the Fibonacci Sequence
Fib = X(1,1:16)

semilogy(1:16, Fib, '-')
title('Fibonacci numbers PLotted on Log scale');
xlabel('Fibonacci Numbers'); ylabel('Log Scale')

r = Fib(3:end) ./ Fib(2:end-1);       % ratios from F2/F1 onward
k_rat = 2:kmax;                   % aligns with r
figure; plot(k_rat, r, '-'); grid on
xlabel('k'); ylabel('F_{k+1} / F_k');
title('Consecutive Fibonacci ratios');


