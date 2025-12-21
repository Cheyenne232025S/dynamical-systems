% Clean screen and workspace.
clc;
clear;
close all;

%global params
t0 = 0;
tend = 10;
x0 = [1;0];

% linear continous pendulum system
f = @(t, x) [0 * x(1) + 1 * x(2);
          -10 * x(1) - 0 * x(2)]

% STEP SIZE h = 0.1
[t1, X1] = forward_euler(f, t0, tend, 0.1, x0);

% STEP SIZE h = 0.01
[t2, X2] = forward_euler(f, t0, tend, 0.01, x0);

% STEP SIZE h = 0.001
[t3, X3] = forward_euler(f, t0, tend, 0.001, x0);

% STEP SIZE h = 0.0001
[t4 , X4] = forward_euler(f, t0, tend, 0.0001, x0);

% ANALYTICAL SOLUTION
%
% e^{i sqrt(10)t}[1;i sqrt(10)] (1/2) + e^{-i sqrt(10)t}[1;-isqrt(10)](1/2)
% Reference (analytic) solution via ODE solver

t_ref = linspace(t0, tend, 500);
[t_ref, Xref] = ode45(@(t, x) f(t, x), t_ref, x0);
Xref = Xref';

% PLOTTING
figure;
subplot(2, 2, 1);
plot(t1, X1(1,:), 'r--', 'LineWidth', 1.5); hold on;
plot(t_ref, Xref(1,:), 'k-', 'LineWidth', 2);
xlabel('t'); ylabel('x_1(t)');
title('Displacement of mass. Simulation step size h = 0.1')
legend('Euler h = 0.1', 'Analytic (ode45)', 'Location', 'northwest');

subplot(2, 2, 2);
plot(t2, X2(1,:), 'r--', 'LineWidth', 1.5); hold on;
plot(t_ref, Xref(1,:), 'k-', 'LineWidth', 2);
xlabel('t'); ylabel('x_1(t)');
title('Displacement of mass. Simulation step size h = 0.01')
legend('Euler h = 0.01', 'Analytic (ode45)', 'Location', 'northwest');

subplot(2, 2, 3);
plot(t3, X3(1,:), 'r--', 'LineWidth', 1.5); hold on;
plot(t_ref, Xref(1,:), 'k-', 'LineWidth', 2);
xlabel('t'); ylabel('x_1(t)');
title('Displacement of mass. Simulation step size h = 0.001')
legend('Euler h = 0.001', 'Analytic (ode45)', 'Location', 'northwest');

subplot(2, 2, 4);
plot(t4, X4(1,:), 'r--', 'LineWidth', 1.5); hold on;
plot(t_ref, Xref(1,:), 'k-', 'LineWidth', 2);
xlabel('t'); ylabel('x_1(t)');
title('Displacement of mass. Simulation step size h = 0.0001')
legend('Euler h = 0.0001', 'Analytic (ode45)', 'Location', 'northwest');

grid on;



