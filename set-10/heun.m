function [t, X] = heun(f, t0, tend, h, x0)
% HEUN'S METHOD  Implements Heun's Method for solving dx/dt = f(t, x(t)).

    % number of steps
    N = round((tend - t0)/h);

    % dimension of the state
    n = length(x0);

    % preallocate
    t = zeros(1, N+1);
    X = zeros(n, N+1);

    % initial conditions
    t(1)   = t0;
    X(:,1) = x0;

    % Heun time stepping loop
    for k = 1:N
        tk = t(k);
        xk = X(:,k);

        % K1
        k1      = f(tk, xk);
        x_tilde = xk + h * k1;

        % K2
        k2 = f(tk + h, x_tilde);

        % update
        X(:,k+1) = xk + (h/2) * (k1 + k2);
        t(k+1)   = tk + h;
    end
end

