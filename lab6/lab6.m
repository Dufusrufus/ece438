%1
close all
N = 21;
n = -100:100;
w_rect= (n>=0) - (n>=N);
w_hann = hann(N);
w_hamm = hamming(N);
w_black = blackman(N);

[X1,w1] =DTFT(w_rect,512);
[X2,w2] =DTFT(w_hann,512);
[X3,w3] =DTFT(w_hamm,512);
[X4,w4] =DTFT(w_black,512);

figure

subplot(4,1,1)
plot(w1, 20*log10(abs(X1)));
subplot(4,1,2)
plot(w2, 20*log10(abs(X2)));
subplot(4,1,3)
plot(w3, 20*log10(abs(X3)));
subplot(4,1,4)
plot(w4, 20*log10(abs(X4)));

%2
figure
wc = 2;
n = 0:20;
h_ideal = wc/pi * sinc(wc/pi*(n-(N-1)/2));
h = h_ideal .* (w_hamm)'; 

subplot(2,1,1)
plot(n, h);
subplot(2,1,2)
[X5,w5] = DTFT(h,512);
plot(w5, 20*log10(abs(X5)));

%3
clear
n = 0:20;
N = 21;
figure
subplot(2,1,1)
beta = 0;
w = kaiser(N,beta);
plot(n,w);
subplot(2,1,2)
[X,w] = DTFT(w,512);
plot(w,20*log10(X));

figure
subplot(2,1,1)
beta = 1;
w = kaiser(N,beta);
plot(n,w);
subplot(2,1,2)
[X,w] = DTFT(w,512);
plot(w,20*log10(X));

figure
subplot(2,1,1)
beta = 5;
w = kaiser(N,beta);
plot(n,w);
subplot(2,1,2)
[X,w] = DTFT(w,512);
plot(w,20*log10(X));


clear
load nspeech2.mat;
%sound(nspeech2)
wp=1.8;
wc=2;
ws=2.2;
deltap=0.05;
deltas=0.005;
delta = min(deltap,deltas);
A = - 20 * log10(delta);
beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
N=floor(1+(A-8)/(2.285*(ws-wp)))+1;
window = kaiser(N,beta);
n = 0:N-1;
h_ideal = wc/pi * sinc(wc/pi*(n-(N-1)/2));
h = h_ideal .* (window)'; 
[X,w] = DTFT(h,512);
figure;
subplot(3,1,1)
plot(w,abs(X))
passband_ripple = range(abs(X(abs(w)<=wp)))/2
stopband_ripple = range(X(abs(w)>=ws))

figure
y =conv(h, nspeech2);
[Y,w] = DTFT(y(20001:20400),512);
plot(w,20*log10(Y))
%sound(y);
%4
f = [wp ws];
m = [1 0];
ripple = [deltap deltas];
[n,fo,mo,w] = firpmord(f,m,ripple,2*pi);
b =firpm(n,fo,mo,w);
figure
[X,w] = DTFT(b,512);
plot(w,abs(X));
deltap = range(abs(X(abs(w)<=wp)))/2
deltas = range(abs(X(abs(w)>=ws)))
figure
y2 =conv(b, nspeech2);
[Y2,w] = DTFT(y2(20001:20400),512);
plot(w,20*log10(Y2))
sound(y2)
%5
%cost = Cost([1,0,0,0,0]);
X = fminsearch('Cost',[1,0,0,0,0]);
figure
subplot(3,1,1)
w = -pi:0.01:pi;
Hsh = sinc(w/(2*pi));
plot(w, abs(1./Hsh))

subplot(3,1,2)
H_theta = prefilter(w,X);
plot(w, abs(H_theta))

subplot(3,1,3)
err = 20*log10(Hsh .* abs(H_theta));
plot(w, (err));