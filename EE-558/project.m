clear; close all; clc;


%% Problem 1
x = 1:0.01:10^0.5;
x = 20*log10(x);
x1 = x.^0.5;
x2 = (x*2).^0.5;

loglog(x, qfunc(x1), x, qfunc(x2));
title("BER Preformance of BASK and BPSK");
ylabel("BER");
xlabel("Eb/No (dB)");


%% Problem 2
L = 10000;
Eb = 1;
No = 10^-3;

BPSK = randi([0, 1], L, 1);
BASK = randi([0, 1], L, 1);

noise = randn([L 1]);

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

sig1 = BPSK + sqrt(No/2) * noise;
%scatter(sig1(1:L), 1);


% Reciever

rsig1 = zeros([L, 1]);
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


