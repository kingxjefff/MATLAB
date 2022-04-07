clear; close all; clc;

%% problem 1
syms k T s z;
assume(T > 0);
g = 1;
ukT = heaviside(g);
xkT = exp(-2*k+2)*ukT;

pretty(ztrans(xkT))

%% problem 2

[a,b,c,d] = tf2ss([2 1],[1 -0.5])

[v,d] = eig([0.5 1; -0.05 -0.2])
%[v,d,w] = eig([0 1; -0.125 0.75])

%% problem 5

a = [0.1 -0.25; 1 -0.3]
b = [1; 0];
c = [1 -0.1];
d = 0;
g = s*eye(2)-a;
h = inv(g);

G = c*h*b;
pretty(G);

[n2, d2] = ss2tf(a, b, c, d);

n = [1 0.2];
n1 = -0.1;
d = [1 0.2 0.22];
G1 = tf(n,d);
%G2 = tf(n1, d)
G3 = tf(n2, d2);
G3 = c2d(G3, 0.1);
%hold on;
%step(G1)
%step(G3)

%part c
%a = [0 1; -0.2 -0.22]

[P, D] = eig(a)
D = vpa(D^k, 4)
Ak = vpa(P*D*(P^-1), 4)












