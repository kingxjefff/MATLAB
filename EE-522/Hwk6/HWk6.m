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

%% problem 4
figure(3);
Ts = 0.001;
delta = 1/sqrt(2);
wo = 2*pi*60;
hold on;
Gs = tf([1 0 wo^2],[1 2*delta*wo wo^2])
bode(Gs)
Gz = c2d(Gs, Ts, 'tustin')
bode(Gz)
opt = c2dOptions('method', 'tustin', 'PrewarpFrequency', 377)
Gz = c2d(Gs, Ts, opt)
bode(Gz)
Gz = c2d(Gs, Ts, 'matched')
bode(Gz)

Gzdiff = tf([0.682 -1.194 0.597], [1 -1.512 0.597]);
bode(Gzdiff)




hold off;