clear; close all; clc;

%% problem 1
Ts = 0.6;
K = 59.4;
t = 5.2;
a = 22.7;
Gp = tf(2, [1 0.5]);

D = K*tf([t 1], [a*t 1]);
Ks = tf(K, [1 0]);
Gpcl = feedback(Gp, 0.04);
GDcl = feedback(D * Gp, 0.04);
Gzcl = c2d(GDcl, Ts);
Gp * D
figure(1);
hold on;
bode(Gpcl);
bode(GDcl);
bode(D);
hold off;

figure(2);
opt = stepDataOptions;
opt.StepAmplitude = 0.4;
hold on;
step(Gzcl);
step(c2d(Gpcl, Ts));
