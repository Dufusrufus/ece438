clear
close all

%2.3
%1
N = 20;
w = -pi:0.01:pi;
W = exp(-i*w*(N-1)/2).*sin(w*N/2)./sin(w/2);
subplot(2,1,1)
plot(w, abs(W))
title('magnitude response of W')
subplot(2,1,2)
plot(w, angle(W))
title('phase response of W')

%3
figure
n = -100:100;
x = cos(pi/4*n);
window = (n>=0)-(n>=N);
%window = hamming(length(n));
x_tr = window.*x;
[X,w] = DTFT(x_tr,512);
plot(w,abs(X))
title('Magnitude of Xtr(ejw)')

figure
x = cos(pi/4*n);
[X,w] = DTFT(x,512);
plot(w,abs(X))
title('Magnitude of X(ejw)')


%3.1
%1
clear
N = 10;
n = 0:N-1;
x1 = ((n>=0)-(n>=N)).*(n == 0);
X1 = DFTsum(x1);
figure
subplot(4,1,1)
stem(n,X1)
title('DFT of delta(n)')

%2
x2 = (n>=0)-(n>=N);
X2 = DFTsum(x2);
subplot(4,1,2)
stem(n,X2)
title('DFT of 1')
%3
x3 = ((n>=0)-(n>=N)).*exp(i*2*pi*n/10);
X3 = DFTsum(x3);
subplot(4,1,3)
stem(n,X3)
title('DFT of exp(i*2pi*n/10)')
%4
x4=((n>=0)-(n>=N)).*cos(2*pi*n/10);
X4 = DFTsum(x4);
subplot(4,1,4)
stem(n,X4)
title('DFT of cos(2pi*n/10)')

%1
figure
x1 = IDFTsum(X1);
subplot(4,1,1)
stem(n,abs(x1))
title('x(n)=delta(n)')
%2
x2 = IDFTsum(X2);
subplot(4,1,2)
stem(n,abs(x2))
title('x(n)=1')
%3
x3 = IDFTsum(X3);
subplot(4,1,3)
stem(n,abs(x3))
title('x(n)=|exp(i*2pi*n/10)|')
%4
x4 = IDFTsum(X4);
subplot(4,1,4)
stem(n,(x4))
title('x(n)=cos(2pi*n/10)')

%3.2
A = DFTmatrix(5)
A = DFTmatrix(10);
figure
%a
Xm1 = A * x1.';
subplot(3,1,1)
stem(n,Xm1)
title('DFT of delta(n)')
%b
Xm2 = A * x2.';
subplot(3,1,2)
stem(n,Xm2)
stem(n,X2)
title('DFT of 1')
%c
Xm3 = A * x3.';
subplot(3,1,3)
stem(n,Xm3)
title('DFT of exp(i*2pi*n/10)')

A = DFTmatrix(5);
B = IDFTmatrix(5)
C = B*A

%3.3
N = 512;
n = 0:N-1;
x = cos(2*pi*n/10);
A = DFTmatrix(N);
t=cputime;
X1 = DFTsum(x);
t1=cputime-t

t=cputime;
X2 = A * x.';
t2=cputime-t
