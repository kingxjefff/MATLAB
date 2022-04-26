close all; clear; clc;

%% problem 1
K = 0.54;

T = 0.6;
Gp = tf(2, [1 0.5]);
Gp = c2d(Gp, T)

Gc = tf([1 -0.97], [1 -0.999], T)
Gpcl = feedback(Gp, 0.04)
Gcl = feedback(K * Gp * Gc, 0.04)
Ga = K * Gcl;
figure(1);
opt = stepDataOptions;
opt.StepAmplitude = 0.4;
hold on;
step(Gpcl, opt);
step(Gcl, opt);
figure(2);
hold on;
bode(Gpcl)
bode(Gcl)