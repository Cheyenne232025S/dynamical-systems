% Clean screen and workspace.
clc;
clear;
close all;

% Setup system components.
A = [0.85, 0.05, 0.05;
    0.01, 0.90, 0.05;
    0.09, 0.01, 0.85]
b = [10; 2; 50];
x01 = [500; 500; 500]
x02 = [250; 250; 1000]

% Compute simulation.
kmax    = 60;
X1       = zeros(3, kmax+1);
X1(:, 1) = x01;
for k = 1:kmax
    X1(:, k+1) = A * X1(:, k) + b;
end

kmax    = 60;
X2       = zeros(3, kmax+1);
X2(:, 1) = x02;
for k = 1:kmax
    X2(:, k+1) = A * X2(:, k) + b;
end

% Plot the solution.
# x_01
figure(1);
subplot(3,2,1);
plot(0:kmax, X1(1, :), '-.');
xlabel('k (months)');
ylabel('x_{CA}(k)');
title('Cars in CA over time with x_{0,1}');

subplot(3,2,3);
plot(0:kmax, X1(2, :), '-.');
xlabel('k (months)');
ylabel('x_{DT}(k)');
title('Cars in DT over time with x_{0,1}');

subplot(3,2,5);
plot(0:kmax, X1(3, :), '-.');
xlabel('k (months)');
ylabel('x_{MA}(k)');
title('Cars in MA over time with x_{0,1}');
#x_02
subplot(3,2,2);
plot(0:kmax, X2(1, :), '-.');
xlabel('k (months)');
ylabel('x_{CA}(k)');
title('Cars in CA over time with x_{0,2}');

subplot(3,2,4);
plot(0:kmax, X2(2, :), '-.');
xlabel('k (months)');
ylabel('x_{DT}(k)');
title('Cars in DT over time with x_{0,2}');

subplot(3,2,6);
plot(0:kmax, X2(3, :), '-.');
xlabel('k (months)');
ylabel('x_{MA}(k)');
title('Cars in MA over time with x_{0,2}');


eig(A)
I = eye(size(A));
x1_hat = (I - A) \b;



