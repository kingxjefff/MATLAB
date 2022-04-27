clear; close all; clc;

%% problem 1
K = 118.8;
t = 0.0059;
a = 10;
Gp = tf(2, [1 0.5]);

D = K*tf([t 1], [a*t 1]);
Ks = tf(K, [1 0]);
Gpcl = feedback(Gp*tf(0.4,[1 0]), 0.04);
GDcl = feedback(Gp * Ks, 0.04);

hold on;
bode(Gpcl);
bode(GDcl);
