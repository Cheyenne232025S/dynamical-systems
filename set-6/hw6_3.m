% Clean screen and workspace.
clc;
clear;
close all;

% Set up
A = [0,0,1,0;
     0,0,0,1;
     1,3,0,0;
     1,7,0,0]

[V, D] = eig(A)
