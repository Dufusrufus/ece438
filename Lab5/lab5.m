%3.1
close all
w = -pi:0.01:pi;
Hf = 1-2*cos(pi/6)*(exp(-i*w))+exp(-2*i*w);
subplot(3,1,1)
plot(w,abs(Hf));


Hf = 1-2*cos(pi/3)*(exp(-i*w))+exp(-2*i*w);
subplot(3,1,2)
plot(w,abs(Hf));


Hf = 1-2*cos(pi/2)*(exp(-i*w))+exp(-2*i*w);
subplot(3,1,3)
plot(w,abs(Hf));


%3.2
load nspeech1;
%sound(nspeech1)
figure
plot((1:101),nspeech1(100:200))
title('101 samples of nspeech1')
[X, w] = DTFT(nspeech1(100:1100),0);
figure
plot(w,abs(X))
title('DTF of 1001 samples of nspeech1')
[Xmax,Imax] = max(abs(X));
theta = max(w(Imax));

y = FIRfilter(nspeech1, theta);
%sound(y)
figure
plot((1:length(y)),y)
[X, w] = DTFT(y(100:1100),0);
plot(w,abs(X))

%4
figure
w = -pi:0.01:pi;
subplot(3,1,1)
r = 0.99;
Hi = (1-r)./(1-2*r*cos(pi/3)*exp(-i*w)+r^2*exp(-2*i*w));
plot(w,abs(Hi))

subplot(3,1,2)
r = 0.9;
Hi = (1-r)./(1-2*r*cos(pi/3)*exp(-i*w)+r^2*exp(-2*i*w));
plot(w,abs(Hi))

subplot(3,1,3)
r = 0.7;
Hi = (1-r)./(1-2*r*cos(pi/3)*exp(-i*w)+r^2*exp(-2*i*w));
plot(w,abs(Hi))

load pcm
%sound(pcm)
figure
plot((1:101), pcm(100:200))
title('101 samples of pcm')
[X, w] = DTFT(pcm(100:1100),0);
figure
plot(w,abs(X))
title('DTFT of 1001 samples of pcm')
theta = 3146/8000;
y = IIRfilter(pcm, theta);
%sound(y)
figure
plot((1:101),pcm(100:200));
title('filtered PCM');
figure
[X, w] = DTFT(y(100:1100),0);
plot(w,abs(X))
title('DTFT of filtered PCM')

%5
load nspeech2
%sound(nspeech2)

%5.1
N = 21;
h1 = LPFtrunc(N);
[X1,w1] = DTFT(h1,512);
N = 101;
h2 = LPFtrunc(N);
[X2,w2] = DTFT(h2, 512);
subplot(2,1,1)
plot(w1,abs(X1))
title('mag resp of N = 21');
subplot(2,1,2)
plot(w2,abs(X2))
title('mag resp of N = 101');

figure
%[X1,w1] = DTFT(log10(h1),512);
subplot(2,1,1)
plot(w1,20*log10(X1))
title('mag resp of N = 21 in decibels');
%[X2,w2] = DTFT(log10(h2),512);
subplot(2,1,2)
plot(w2,20*log10(X2))
title('mag resp of N = 101 in decibels');

y1 = conv(nspeech2, h1);
%sound(y1)

y2 = conv(nspeech2, h2);
sound(y2)

