% Clean screen and workspace.
clc;
clear;
close all;



% Setup system components.
A = [0.8, 0.1, 0.1;0.1, 0.7, 0.2;0.1, 0.2, 0.7]
[V,D] = eig(A)


% calculating weights and eigenpairs
[V,D] = eig(A)
V = [0,2,1;1,-1,1;-1,-1,1]
X0 = [60000;150000;90000]
[V,D] = eig(A)

% Compute simulation.
kmax    = 20;
X       = zeros(3, kmax+1);
X(:, 1) = X0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k);
end
X = int64(round(X));

% plotting simulation
figure(1);
subplot(3,1,1)
plot(0:kmax, X(1,:))
xlabel('k (Years)');
ylabel('# of Republicans');
title('Evolution of Republicans in Constant Population, Mawtookit');

subplot(3,1,2)
plot(0:kmax, X(2,:))
xlabel('k (Years)');
ylabel('# of Independents');
title('Evolution of Independents in Constant Population, Mawtookit');

subplot(3,1,3)
plot(0:kmax, X(3,:))
xlabel('k (Years)');
ylabel('# of Democrats');
title('Evolution of Democrats in Constant Population, Mawtookit');
