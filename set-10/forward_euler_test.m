% Clean screen and workspace.
clc;
clear;
close all;

% global params
t0 = 0
tend = 20
h = 0.01
x0 = [0.5; 0.5]

% SIMULATION 1:

% parameters (gamme / beta < P) x1 is unstable
beta = 1
gamma = 0.5
mu = 0.5
P = 1

% SIR model for sim 1

f = @(t, x) [-beta * x(1) * x(2) + mu * (P - x(1) - x(2));
          beta * x(1) * x(2) - gamma * x(2)]


[t, X] = forward_euler(f, t0, tend, h, x0);

% SIMULATION 2:

% parameters (gamme/beta > P) x1 is as stable
beta = 0.5
gamma = 1
mu = 0.5
P = 1

% SIR model for sim 2

f2 = @(t, x) [-beta * x(1) * x(2) + mu * (P - x(1) - x(2));
          beta * x(1) * x(2) - gamma * x(2)]

[t2, X2] = forward_euler(f2, t0, tend, h, x0);

% Ploting
figure;
subplot(2, 1, 1)
plot(t, X(1,:), 'b-', 'LineWidth', 2);  hold on;
plot(t, X(2,:), 'r-', 'LineWidth', 2);

xlabel('Time t');
ylabel('Population');
title('SIR Model Simulation 1 (Euler Method)');
legend('S(t) Susceptible', 'I(t) Infected');

subplot(2, 1, 2)
plot(t2, X2(1,:), 'b-', 'LineWidth', 2);  hold on;
plot(t2, X2(2,:), 'r-', 'LineWidth', 2);

xlabel('Time t');
ylabel('Population');
title('SIR Model Simulation 2X (Euler Method)');
legend('S(t) Susceptible', 'I(t) Infected');

grid on;
