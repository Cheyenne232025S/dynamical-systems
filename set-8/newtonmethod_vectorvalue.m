function [xr, res] = newtonmethod_vectorvalue(g, J, x0, maxiter, tol)
%Newtons Method Computes roots of scalar non linear equation.
%
% INPUTS:
%   g       - function handle: g(x) returns n-by-1 vector
%   J       - function handle: J(x) returns n-by-n Jacobian matrix
%   x0      - n-by-1 starting vector
%   maxiter - maximum number of iteration steps
%   tol     - tolerance for convergence criterion
%
% OUTPUTS:
%   xr     - root such that g(xr) approx = 0
%   res    - approximation residual

% Not normalizing for scalar root finding.
xr =  x0(:);

% Residual memory.
res = zeros(1, maxiter);

% Iteration.
for k = 1:maxiter
    gx = g(xr);


    % saving residual
    res(k) = norm(gx,2);


    if res(k) < tol
       res = res(1:k);
       return;
    end

    % jaccobian matrix
    Jx = J(xr);

    % solving J(xk) * z = -g(xk)
    p = - Jx \ gx;

    % Update
    xr = xr + p;

end

% If here, hit maxiter without meeting tol
    res = res(1:maxiter);
    warning('Max iterations reached: |g(x)| = %g at x = %g.', res(end), xr);
% Prepare outputs.
res = res(1:k);
