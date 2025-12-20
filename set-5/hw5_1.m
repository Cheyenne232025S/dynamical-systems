% Clean screen and workspace.
clc;
clear;
close all;

% Setup system components.
M = [0, 1/3, 1/3, 1/4;
    0, 0, 1/3, 1/4;
    1, 1/3, 0, 1/4;
    0, 1/3, 1/3, 1/4]

L = [0.0375, 0.0375, 0.0375, 0.0375;
    0.0375, 0.0375, 0.0375, 0.0375;
    0.0375, 0.0375, 0.0375, 0.0375;
    0.0375, 0.0375, 0.0375, 0.0375]
A = ((0.85*M) + L)
[V, D] = eig(A);

% Find the index of the eigenvalue equal to 1
[~, idx] = min(abs(diag(D) - 1));

% Extract the corresponding eigenvector
v = V(:, idx);

% Normalize so the entries sum to 1
v = v / sum(v);

disp(v)
