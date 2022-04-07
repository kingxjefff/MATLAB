close all; clear; clc;
% wasn't able to get this working
% tried to replicate the code in the solution manual
% still learned some new matlab commands though...

% EE 558 Hw 4 problem 5
k = [1 2 3 4 5];
L = 100 * 10.^k;

V = [10^-1 10^-2 10^-3 10^-4 10^-5];

N0 = 1;
Tb = 1;

% modulation
for i=1:length(V)
    b = round(rand(1,L(i)));
    s = V(i)*(2*b-1);

w = randn(1,length(years));

r = s + w;

A =  sign(r);
A(find(A==0)) = 1;

b2 = (A + 1)/2;

BER(i) = length(find(b2 - b))/length(b);

end


% plot

semilogy(20*log10(V), BER);

