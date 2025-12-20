% Clean screen and workspace.
clc;
clear;
close all;


% Setup system components.
A = [0.60, 0.10, 0.15;
    0.15, 0.90, 0.15;
    0.25, 0.00, 0.70]

X0 = [0.40;0.45;0.15]

[V,D] = eig(A);

% Compute simulation.
kmax    = 35; #each step represents 2 years.
X       = zeros(3, kmax+1);
X(:, 1) = X0;
for k = 1:kmax
    X(:, k+1) = A * X(:, k);
end

% plotting simulation
figure(1);
subplot(3,1,1)
plot(0:kmax, X(1,:))
xlabel('k Steps - 2 Years/step');
ylabel('% Galaxy Users');
title('Galaxy Preference');

subplot(3,1,2)
plot(0:kmax, X(2,:))
xlabel('k Steps - 2 Years/step');
ylabel('% iPhone Users');
title('iPhone Preference');

subplot(3,1,3)
plot(0:kmax, X(3,:))
xlabel('k Steps - 2 Years/step');
ylabel('% Pixel Users');
title('Pixel Preference');


