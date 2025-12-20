% Clean screen and workspace.
clc;
clear;
close all;

% Setup system components.
A = [1.01, 0.02;
    0, 1.005]

b = [50; 0]
x0 = [0, 4000]

% Compute simulation.
kmax    = 360;
X       = zeros(2, kmax+1);
X(:, 1) = x0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k) + b;
end

% plotting simulation
figure(1);
subplot(2,1,1)
plot(0:kmax, X(1,:))
xlabel('k Steps - months');
ylabel('Money');
title('Retirement Account');

subplot(2,1,2)
plot(0:kmax, X(2,:))
xlabel('k Steps - months');
ylabel('Money');
title('Savings');

# prepare next sim
m0        = 50;
growth    = 1.005;
bseq      = m0 * growth.^(0:kmax-1);


% Compute simulation.
kmax    = 360;
X1       = zeros(2, kmax+1);
X1(:, 1) = x0;

for k = 1:kmax
    b_k = [bseq(k);0]
    X1(:, k+1) = A * X1(:, k) + b_k;
end


X_contrib = zeros(2, kmax+1);
for k = 1:kmax
    b_k = [bseq(k); 0];
    X_contrib(:,k+1) = A * X_contrib(:,k) + b_k;
end
% plotting simulation
figure(1);

subplot(2,2,1)
plot(0:kmax, X(1,:))
xlabel('k Steps - months');
ylabel('Money');
title('Retirement Account');

subplot(2,2,3)
plot(0:kmax, X(2,:))
xlabel('k Steps - months');
ylabel('Money');
title('Savings');

subplot(2,2,2)
plot(0:kmax, X1(1,:))
xlabel('k Steps - months');
ylabel('Money');
title('Retirement Account new');

subplot(2,2,4)
plot(0:kmax, X1(2,:))
xlabel('k Steps - months');
ylabel('Money');
title('Savings new');

