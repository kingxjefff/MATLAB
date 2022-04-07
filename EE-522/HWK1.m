clear; close all; clc;

%% Problem 7
k = 1:1:5;
e(2:1:5) = ones;

N = e(k);
D = [1 -0.75 0.125];

y1 = filter(N,D,e)


%% Problem 8

N = [1 0];
D = [1 -3.2 3.77 -1.93 0.36];

x = 3:1:25;

y2 =filter(N,D,x)



