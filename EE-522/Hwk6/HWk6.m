clear; close all; clc;

%% Problem 2
Ts = 0.6;
K = 1;
K = 1.68;
%K = 10;
Gs = tf(2, [1 0.5])

Gz = c2d(Gs, Ts)
Gzcl = feedback(K*Gz, 0.04)

figure(1);
hold on;
grid on;
bode(Gzcl);
hold off;


%% Problem 4
figure(3);
Ts = 0.001;
delta = 1/sqrt(2);
wo = 2*pi*60;

Gs = tf([1 0 wo^2],[1 2*delta*wo wo^2])

Gz1 = c2d(Gs, Ts, 'tustin')

opt = c2dOptions('method', 'tustin', 'PrewarpFrequency', 377);
Gz2 = c2d(Gs, Ts, opt);

Gz3 = c2d(Gs, Ts, 'matched')


Gzdiff = tf([0.682 -1.194 0.597], [1 -1.512 0.597]);
t = 0:Ts:0.1;
% plots for problem 4
sig = sin(2*pi*60*t)+sin(2*pi*10*t);

% plot a
subplot(2,2,1);
title('Backwards Difference Approximation');
xlabel('Time (s)');
ylabel('Response');
grid on;
hold on;
plot(t, sig);
[n,d] = tfdata(Gzdiff);
n = cell2mat(n);
d = cell2mat(d);
plot(t, filter(n,d, sig));
hold off;

% plot b
subplot(2,2,2);
title('Bilinear Transform');
xlabel('Time (s)');
ylabel('Response');
grid on;
hold on;
plot(t, sig);
[n,d] = tfdata(Gz1);
n = cell2mat(n);
d = cell2mat(d);
plot(t, filter(n,d, sig));
hold off;

% plot c
subplot(2,2,3);
title('Bilinear Transform with pre-warping');
xlabel('Time (s)');
ylabel('Response');
grid on;
hold on;
plot(t, sig);
[n,d] = tfdata(Gz2);
n = cell2mat(n);
d = cell2mat(d);
plot(t, filter(n,d, sig));
hold off;

% plot b
subplot(2,2,4);
title('Matched Pole-Zero Method');
xlabel('Time (s)');
ylabel('Response');
grid on;
hold on;
plot(t, sig);
[n,d] = tfdata(Gz3);
n = cell2mat(n);
d = cell2mat(d);
plot(t, filter(n,d, sig));
hold off;






















