function [t, X] = forward_euler(f, t0, tend, h, x0)
% FORWARD_EULER  Implements the Forward Euler Method for solving
%                (non-linear discrete-time system)
%
% The Forward Euler update rule is:
%          x_{k+1} = x_k + h * f(t_k, x_k)


% number of steps
N = (tend - t0) / h;

% dimension of the state
n = length(x0);

% give outputs empty values
t = zeros(1, N+1);
X = zeros(n, N+1);

% initial conditions
t(1) = t0;
X(:,1) = x0;

% Euler time-stepping loop
for k =  1:N
  X(:, k+1) = X(:,k) + h * f(t(k), X(:, k));
  t(k+1)    = t(k) + h;
end




