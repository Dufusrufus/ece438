clc
close all
clear
%2.1
x = hamming(20);
X = dcDFT(x);
k = 0:19;
stem((0:19), abs(X))
title('|X20(k)|')
figure
[Xs,w] = DTFTsamples(x);
stem(w,abs(Xs))
title('DTFT samples')

%2.2
figure
N = 50;
n = 1:N-1;
x1 = ((n>=0)-(n>49)).*(sin(-0.1*pi*n));
[X1,w] = DTFTsamples(x1);
subplot(2,1,1)
stem(w,abs(X1))
title('N=50')

N = 200;
n = 1:N-1;
x2 = ((n>=0)-(n>49)).*(sin(-0.1*pi*n));
[X2,w] = DTFTsamples(x2);
subplot(2,1,2)
stem(w,abs(X2))
title('N=200')

%3
clear
figure
N = 10
n = 0:N-1;
x1 = (n==0);
X1 = dcDFT(x1);
subplot(3,1,1)
stem(n,X1)
title('delta(n)')

x2 = (n>=0)-(n>=N);
X2 = dcDFT(x2);
subplot(3,1,2)
stem(n,X2)
title('1')

x3 = ((n>=0)-(n>=N)) .* (exp(i*2*pi*n/10));
X3 = dcDFT(x3);
subplot(3,1,3)
stem(n,X3)
title('exp(i*2pi*n/10)')

%3.2
clear
N = 8;
n = 0:N-1;
x = ((n>=0)-(n>N));
X = FFT8(x)


