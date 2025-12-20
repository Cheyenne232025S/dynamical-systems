function [xr, res] = newtonmethod(g, dg, x0, maxiter, tol)
%Newtons Method Computes roots of scalar non linear equation.
%
% INPUTS:
%   g       - function handle
%   dg      - first derrivative function handle
%   x0      - starting point
%   maxiter - maximum number of iteration steps
%   tol     - tolerance for convergence criterion
%
% OUTPUTS:
%   xr     - root such that g(xr) approx = 0
%   res    - approximation residual

% Not normalizing for scalar root finding.
xr =  x0;

% Residual memory.
res = zeros(1, maxiter);

% Iteration.
for k = 1:maxiter
    gx = g(xr);
    dgx = dg(xr);

    % saving residual
    res(k) = abs(gx);


    if res(k) < tol
       res = res(1:k);
       return;
    end
    % making sure not divide by zero (no zero derrivative)
    dgx = dg(xr);
        if dgx == 0            % safeguard
            error('Newton fails: g''(x) = 0 at x = %g.', xr);
        end

    %newton update/iteration
    xr = xr - gx / dgx;

end

% If here, hit maxiter without meeting tol
    res = res(1:maxiter);
    warning('Max iterations reached: |g(x)| = %g at x = %g.', res(end), xr);
% Prepare outputs.
res = res(1:k);
