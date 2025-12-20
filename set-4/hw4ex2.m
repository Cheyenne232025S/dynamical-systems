% Clean screen and workspace.
clc;
clear;
close all;

% Setup system components.
A = [0.3, 0.5, 0.1, 0.1;
    0.4, 0.3, 0.2, 0.1;
    0.2, 0.1, 0.6, 0.1;
    0.1, 0.1, 0.1, 0.7]

X01 = [0.31;
      0.18;
      0.50;
      0.01]
X02 = [0.00;
      0.00;
      0.00;
      1.00]
X03 = [0.25;
      0.25;
      0.25;
      0.25]

% Compute simulations
#for x01
kmax    = 50;
X1       = zeros(4, kmax+1);
X1(:, 1) = X01;
for k = 1:kmax
    X1(:, k+1) = A * X1(:, k);
end

#for x02
X2       = zeros(4, kmax+1);
X2(:, 1) = X02;
for k = 1:kmax
    X2(:, k+1) = A * X2(:, k);
end

#for x03
X3       = zeros(4, kmax+1);
X3(:, 1) = X03;
for k = 1:kmax
    X3(:, k+1) = A * X3(:, k);
end


% Display Results

#for x01
#disp("System with x01")
#disp("     ")
#disp( "x(1) for x01 = ")
#disp(X1(:,2))

#disp( "x(2) for x01 = ")
#disp(X1(:,3))

#disp( "The steady state system converges to = ")
#disp(X1(:,50))
#disp("   ")
#for x02
#disp("System with x02")
#disp("    ")
#disp( "x(1) for x02 = ")
#disp(X2(:,2))

##disp( "x(2) for x02 = ")
#disp(X2(:,3))

#disp( "The steady state system converges to = ")
#disp(X2(:,50))
#disp("    ")
#for x03
disp("System with x03")
disp("    ")
disp( "x(1) for x03 = ")
disp(X3(:,2))

disp( "x(2) for x03 = ")
disp(X3(:,3))

disp( "The steady state system converges to = ")
disp(X3(:,50))




