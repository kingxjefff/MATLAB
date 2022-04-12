clear; close all; clc;
%% Problem 1
figure(1);
Ts = 0.4;

Gs = tf(0.5, [1 0.5])
Gscl = feedback(Gs,1)

Gz = c2d(Gs, Ts)
Gzcl = feedback(Gz, 1)
hold on;
step(Gscl);
step(Gzcl);

hold off;

%% problem 2
figure(2);
Ts = 0.6;

Gs = tf(2,[1 0.5])
Gz = c2d(Gs, Ts)
Gzcl = feedback(Gz, 0.04)

hold on;
step(0.4*Gzcl)
hold off;

%% problem 3
figure(3);
hold on;


Gs = tf(1, [1 1 0])
Gscl = feedback(Gs, 1)
step(Gscl);

% T = 1s
Ts = 1;
Gz = c2d(Gs, Ts);
Gzcl = feedback(Gz, 1)
log(pole(Gzcl))/Ts
step(Gzcl);

% T = 0.5s
Ts = 0.5;
Gz = c2d(Gs, Ts);
Gzcl = feedback(Gz, 1)
log(pole(Gzcl))/Ts
step(Gzcl);

% T = 0.1s
Ts = 0.1;
Gz = c2d(Gs, Ts);
Gzcl = feedback(Gz, 1)
log(pole(Gzcl))/Ts
step(Gzcl);
hold off;

%% problem 4
hold on;
Gs = tf(1, [1 1]);
Ts = 1;
Gz = c2d(Gs, Ts)

hold off;

%% Problem 5
syms z
C = (z-0.9)*(z-0.8)*(z^2-1.9*z+1);
expand(C)
roots([1 -3.6 4.95 -3.068 0.72])


























