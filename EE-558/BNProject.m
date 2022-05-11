close
clear all
%%% Belinda Nguyen %%%

%Question 1
%Part a, b, and c
snrDB = 0:1:10;
snr = 10.^(snrDB/10);

berBASK = qfunc(sqrt(snr));
berBPSK = qfunc(sqrt(2*snr));

berPerformance = semilogy(snrDB, berBASK, snrDB, berBPSK);
legend('BASK' , 'BPSK and QPSK'),
xlabel('Eb/No (dB)');
ylabel('P[error]');

%Question 2
L = 100; %bit sequence number
info = round(rand(1,L));

fc = 1;
Tc = 1/fc;
sps = 10; 
tb = 1/sps;
wo = 2*pi*fc;
t = tb:tb:L;

upT = repelem(info, sps); %Pulse train through samples per symbol (1 bit per symbol)

for n = 1:length(upT) %BPSK does 1 bit per sample
    BP = upT(n);
        if BP == [0]
            p1(n)=  -1;
        elseif BP == [1]
            p1(n)= 1;  
        end
end

carrier = cos(wo.*t); %NRZ-L Signal w a resultant phase either 0 or pi
modSignal = p1.*carrier;

No = 1; %Eb = 1  Eb/No related to SNR (dimensionless) distance is 2
sigma = sqrt(No/2);

for i = 1:length(modSignal) %threshold is zero
    noisySignal(i) = modSignal(i) + sigma*rand(1);
    multipliedSignal = noisySignal(i).*carrier(i);
    cleanedSignal = lowpass(multipliedSignal, .5);
%     cleanedSignal = round((2*rSignal/Tc));
    if (cleanedSignal >= 0)
       demodSignal(i) = 1;
    elseif (cleanedSignal <= 0)
        demodSignal(i) = 0;
    end
end

for j = 1:length(modSignal)
    if demodSignal(j) == upT(j)
        differenceSignal(j) = 0; %ignoring true
    elseif demodSignal(j) ~= upT(j)
        differenceSignal(j) = 1; %count false
    end 
end

error = sum(differenceSignal == 1);

figure (2);
subplot(411);
plot(t, modSignal, t, p1);
legend('BPSK Signal' , 'Binary Data'),
xlabel('time');
ylabel('Amplitude');

subplot(412);
plot(t, noisySignal);
xlabel('time');
ylabel('Amplitude');

subplot(413);
plot(t, demodSignal);
xlabel('time');
ylabel('Amplitude');