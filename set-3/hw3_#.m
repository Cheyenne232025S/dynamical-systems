% Clean screen and workspace.
clc;
clear;
close all;


% Setup system components.
A = [0.8,0.6,0,0; -0.6, 0.8, 0,0; 0,0,1,0;0,0,0,1.3]
X0 = [1;1;1;1]
eig(A)
% Compute simulation.
kmax    = 200;
X       = zeros(4, kmax+1);
X(:, 1) = X0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k);
end


% plotting simulation
figure(1);
subplot(4,1,1)
plot(0:kmax, X(1,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 1');

subplot(4,1,2)
plot(0:kmax, X(2,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 2');

subplot(4,1,3)
plot(0:kmax, X(3,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 3');

subplot(4,1,4)
plot(0:kmax, X(4,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 3');
