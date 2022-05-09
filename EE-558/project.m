clear; close all; clc;


%% Problem 1
x = 1:0.01:10^0.5;
x = 20*log10(x);
x1 = x.^0.5;
x2 = (x*2).^0.5;

%loglog(x, qfunc(x1), x, qfunc(x2));
%title("BER Preformance of BASK and BPSK");
%ylabel("BER");
%xlabel("Eb/No (dB)");


%% Problem 2
L = 10;
n = 100;         % upsample amount
Eb = 1;
No = 10^-3;
Fc = 100;       % carrier frequency
Tc = 1/Fc;

t1 = Tc:Tc:Tc*n*L;
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
sig1 = BPSKuS .* cos(2*pi*t1);
plot(t1, sig1);

subplot(2,2,2);
tsig1 = sig1 + sqrt(No/2) * noise;
plot(t1, tsig1);
%scatter(sig1(1:L), 1);


% Reciever
subplot(2,2,3);
rsig1 = tsig1 .* cos(2*pi*t1);  % demodulation
plot(t1, rsig1);

subplot(2,2,4);
rsig1 = lowpass(rsig1, 1, 10);
plot(t1, rsig1);
for i = 1:L
    if(sig1(i) <= 0)
        rsig1(i) = -1;
    end
    if(sig1(i) > 0)
        rsig1(i)  = 1;
    end

end
errorCount = 0;
% error
for i = 1:L
    if(BPSK(i) ~= rsig1(i))
        errorCount = errorCount + 1;
    end
end
error = errorCount/L


