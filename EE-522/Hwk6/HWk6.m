clear; close all; clc;

%% Problem 2
Ts = 0.6;
K = 1;
K = 1.68;
%K = 10;
Gs = tf(2, [1 0.5])

Gz = c2d(Gs, Ts)
Gzcl = feedback(K*Gz, 0.04)
%rlocus(Gz)
figure(1);
hold on;
bode(Gzcl)
hold off;

%% problem 3
Ts = 0.05;
Gs = tf(20, [1 6 0])
Gz = c2d(Gs, Ts)
Gzcl = feedback(Gz, 0.4)
figure(2);
hold on;
bode(Gzcl)

hold off;