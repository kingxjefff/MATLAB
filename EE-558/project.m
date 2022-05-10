clear; close all; clc;


%% Problem 1
xdB = 0:1:10;
x = 10.^(xdB/10);
x1 = sqrt(x);
x2 = sqrt(x*2);

%semilogy(xdB, qfunc(x1), xdB, qfunc(x2));
%title("BER Preformance of BASK and BPSK");
%ylabel("BER");
%xlabel("Eb/No (dB)");


%% Problem 2
L = 10000;
n = 100;         % upsample amount

Eb = 1;
No = 10^-2;

Fc = 1000;       % carrier frequency
Tc = 1/Fc;

Fs = 10000;
Ts = 1/Fs;

t1 = Ts:Ts:Ts*n*L;
t1 = t1.';

% random message
BPSK = randi([0, 1], L, 1);
BASK = randi([0, 1], L, 1);

noise = randn([L*n 1]);

for i = 1:L
   switch(BPSK(i))
       case 0
            BPSK(i) = -1;
       case 1
    end
end

for i = 1:L
    if(BASK(i) == 1)
        BASK(i) = 2^0.5;
    end
end

% up sampling for BPSK
BPSKuS = zeros([L*n, 1]);
for i = 1:L
    switch(BPSK(i))
       case -1
           for j = 1:n
            BPSKuS(j + (i-1)*n) = -1;
           end
       case 1
           for j = 1:n
            BPSKuS(j + (i-1)*n) = 1;
           end
    end
end

% transmitter
figure(2);
subplot(2,2,1);
hold on;
plot(t1, BPSKuS);
sig1 = BPSKuS .* cos(2*pi*Fc*t1);
plot(t1, sig1);

subplot(2,2,2);
tsig1 = sig1 + sqrt(No/2) * noise;
plot(t1, tsig1);
%scatter(sig1(1:L), 1);


% Reciever
subplot(2,2,3);

rsig1 = tsig1 .* cos(2*pi*Fc*t1);  % demodulation
plot(t1, rsig1);

subplot(2,2,4);

rsig1 = lowpass(rsig1, (n/(Fs/2)));

plot(t1, rsig1);

rsig1 = rsig1(n/2:n:L*n-n/2);
figure(3);
hold on;
plot(1:L, rsig1);
for i = 1:L
    if(rsig1(i) <= 0)
        rsig1(i) = -1;
    end
    if(rsig1(i) > 0)
        rsig1(i)  = 1;
    end

end
plot(1:L, rsig1);
errorCount = 0;
% error
for i = 1:L
    if(BPSK(i) ~= rsig1(i))
        errorCount = errorCount + 1;
    end
end
error = errorCount/L


