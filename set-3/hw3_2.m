% Clean screen and workspace.
clc;
clear;
close all;


% Setup system components.
A = [1,1,1; 0,0.65,0.7;0,-0.7,.65]
X0 = [1;1;1]
[V,D] = eig(A,'nobalance');

% Compute simulation.
kmax    = 200;
X       = zeros(3, kmax+1);
X(:, 1) = X0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k);
end


% plotting simulation
figure(1);
subplot(3,1,1)
plot(0:kmax, X(1,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 1');

subplot(3,1,2)
plot(0:kmax, X(2,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 2');

subplot(3,1,3)
plot(0:kmax, X(3,:))
xlabel('k Steps');
ylabel('Value');
title('Stage 3');
