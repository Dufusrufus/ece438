%2.1
close all
Ts = 1;
fc = 0.45;
N = 20;
f = -1:0.01:1;
Hb = 1./(1+(f/fc).^N);
subplot(2,1,1)
plot(f,Hb.*Hb)
title('magnitude response of system without sample-and-hold device')
H = Hb.^2.*abs(sinc(f*Ts));
subplot(2,1,2)
plot(f,H)
title('magnitude response of complete system')
%6
music = audioread('music.au');
%sound(music);
sig1 = music(1:2:end);
sound(sig1)
LPF = fir1(20,1/2);
y = conv(music,LPF);
sig2 = y(1:2:end);
%sound(sig2)