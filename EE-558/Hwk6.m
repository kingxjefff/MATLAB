close all; clear; clc;

%% Problem 6 (7.13)
sigma = [10e-1 10e-2 10e-3 10e-4];
L = 1000;
sig = zeros([L/2 2]);
bits = randi([0,1], L, 1);
noise = randn([L/2 2]);

for i = 1:L/2

   switch (bits((2*i - 1),1))
       case 0
           
           switch(bits(2*i,1))
               case 0
                   sig(i, 1) = 1;
                   sig(i, 2) = 0;
               case 1
                   sig(i, 1) = 0;
                   sig(i, 2) = 1;
           end
       case 1
           
           switch(bits(2*i, 1))
               case 1
                   sig(i, 1) = -1;
                   sig(i, 2) = 0;
               case 0
                   sig(i, 1) = 0;
                   sig(i, 2) = -1;
           end
   end
end

rSig1 = sig + sigma(1) * noise;
rSig2 = sig + sigma(2) * noise;
rSig3 = sig + sigma(3) * noise;
rSig4 = sig + sigma(4) * noise;
figure(1);
subplot(2,2,1);

scatter(rSig1(1:L/2,1), rSig1(1:L/2,2));
title('noise = 10e-1');
subplot(2,2,2);

scatter(rSig2(1:L/2,1), rSig2(1:L/2,2));
title('noise = 10e-2');
subplot(2,2,3);

scatter(rSig3(1:L/2,1), rSig3(1:L/2,2));
title('noise = 10e-3');
subplot(2,2,4);

scatter(rSig4(1:L/2,1), rSig4(1:L/2,2));
title('noise = 10e-4');



