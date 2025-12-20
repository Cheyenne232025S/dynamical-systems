% Clean screen and workspace.
clc;
clear;
close all;

### This is a test for newtonmethod.m

g = @(x) exp(x) - x  - 2;
dg = @(x) exp(x) - 1;

[x1, r1] = newtonmethod(g, dg, 3, 50, 1e-10);
[x2, r2] = newtonmethod(g, dg, -3, 50, 1e-10);

# display restuls
#disp("two different roots of the function")
#disp(x1)
#disp(x2)

disp("how many steps it took:")
disp("For X0 = 3:")
disp(r1)
# converged on seventh step
disp("For x0 = -3:")
disp(r2)
# converged on fourth step
#my implementation converges faster to the root -1.8414
