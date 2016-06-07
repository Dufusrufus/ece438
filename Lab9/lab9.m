close all
clear
clc
%2.2
[y,Fs] = audioread('go.au');
plot(y)
zoom xon

VoicedSig = y(4000:4299);
UnvoicedSig = y(6200:6499);
figure
subplot(2,1,1)
plot(VoicedSig)
title('voiced segment')
subplot(2,1,2)
plot(UnvoicedSig)
title('unvoiced segment')

%1) pitch period = 8ms
% speaker is male
%2) 
P_v = 1/length(VoicedSig)*sum(VoicedSig.^2);
zero_v = zero_cross(VoicedSig);
P_u = 1/length(UnvoicedSig)*sum(UnvoicedSig.^2);
zero_u = zero_cross(UnvoicedSig);
% voiced segment has a greater avg energy and a greater zero-crossing rate

%3.1
L = 0.008*6*Fs;
X = DFTwin(y,L,3000,512);
figure
subplot(2,1,1)
plot(y(3000:3000+L-1))
title('chosen segment')
subplot(2,1,2)
plot([0:255]/512*8000,abs(X(1:256)))
xlabel('Hz')
title('STDTFT')

%3.2
load('signal.mat')
N = 512;
A = Specgm(signal,40,20,N);
[r,c] = size(A);
w = pi/N * [0:N/2];
f = w / (2*pi) * Fs;
t = [0:c-1] * length(y) / (Fs*c);
figure
imagesc(t,f,20*log10(abs(A)+eps))
axis xy
title('wideband spectrogram')
xlabel('time(sec)')
ylabel('freq(Hz)')

A = Specgm(signal,320,60,N);
[r,c] = size(A);
w = pi/N * [0:N/2];
f = w / (2*pi) * Fs;
t = [0:c-1] * length(y) / (Fs*c);
figure
imagesc(t,f,20*log10(abs(A)+eps))
axis xy
title('narrowband spectrogram')
xlabel('time(sec)')
ylabel('freq(Hz)')

%3.3
load('vowels.mat')
A = Specgm(a,320,60,N);
[r,c] = size(A);
w = pi/N * [0:N/2];
f = w / (2*pi) * Fs;
t = [0:c-1] * length(y) / (Fs*c);
figure
imagesc(t,f,20*log10(abs(A)+eps))
%colormap(1-gray)
axis xy
title('narrowband spectrogram of a')
xlabel('time(sec)')
ylabel('freq(Hz)')

U = Specgm(u,320,60,N);
[r,c] = size(U);
w = pi/N * [0:N/2];
f = w / (2*pi) * Fs;
t = [0:c-1] * length(y) / (Fs*c);
figure
imagesc(t,f,20*log10(abs(U)+eps))
%colormap(1-gray)
axis xy
title('narrowband spectrogram of u')
xlabel('time(sec)')
ylabel('freq(Hz)')

F1s_a = 100;
F2s_a = 200;
F1e_a = 110;
F2e_a = 250;

F1s_u = 100;
F2s_u = 200;
F1e_u = 120;
F2e_u = 220;

figure
xlabel('F1(Hz)')
ylabel('F2(Hz)')
grid on
plot(F1s_a,F2s_a,'o')
hold on
plot(F1e_a,F2e_a,'o')
hold on
plot(F1s_u,F2s_u,'o')
hold on
plot(F1e_u,F2e_u,'o')
axis([0 300 0 400])
title('vowel triangle')

