% Clean screen and workspace.
clc;
clear;
close all;

load('websearch_cmda.mat');

n = size(G, 2);
p = 0.85;
delta = (1-p) / n;
c = sum(G, 1);
k = find(not(c == 0));
D = sparse(k, k, 1 ./ c(k), n, n);
e = ones(n, 1);
z = ((1-p) * not(c == 0) + (c == 0)) / n;
A = p * (G * D) + e * z;

x0 = ones(n,1);       % starting vector (all ones)
maxiter = 1000;
tol = 1e-8;


[lambda, v, res] = powermethod(A, x0, maxiter, tol);
# normalizing computed vector 1-norm
v = v / sum(v);


disp('Dominant eigenvalue:')
disp(lambda)

[~, idx] = sort(v, 'descend');
disp('Top 10 ranked websites and their scores:')
for i = 1:10
    fprintf('%2d. %s  ->  %.6f\n', i, U{idx(i)}, v(idx(i)));
end
