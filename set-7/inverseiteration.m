function [lambda, v, res] = inverseiteration(A, mu, x0, maxiter, tol)
%INVERSE ITERATION Computes dominant eigenvalue closest to shift mue
%
% INPUTS:
%   A       - matrix of dimensions n x n
%   x0      - starting vector of dimension n (x 1)
%   maxiter - maximum number of iteration steps
%   tol     - convergence tolerance for the residual.
%   mu      - potentially complex shift
%
% OUTPUTS:
%   lambda - eigenvalue closest to mu
%   v      - corresponding eigenvector
%   res    - array of computed residuals

% Normalize the starting vector and save the result in v.
v =  x0 / norm(x0, 2);

% Residual memory.
res = zeros(1, maxiter);

% Iteration.
for k = 1:maxiter
    % Apply the matrix.
    v = (A - mu*eye(size(A))) \ v;

    % Normalize the iteration vector.
    v = v / norm(v, 2);

    % Compute the eigenvalue estimate.
    lambda = v' * A * v;

    % Convergence criterion.
    res(k) = norm(A * v - lambda * v, 2);
    if res(k) < tol
        break;
    end
end

% Prepare outputs.
res = res(1:k);
