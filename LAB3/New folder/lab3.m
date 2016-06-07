%2.2
close all
w = -pi:0.01:pi;
H = (0.3+0.24*exp(-i*w))./(1-0.9*exp(-i*w));
subplot(2,1,1)
plot(w,abs(H));
title('magnitude response');
subplot(2,1,2)
plot(w,phase(H));
title('phase response');
%Lab3;
%orient('tall');
%5.1
%1.
clear
figure
n = -10:10;
x = (n==0);
dw = 0.01;
w = -pi:dw:pi;
X = DTFT(x,n(1),dw);
subplot(2,1,1)
plot(w,abs(X))
title('magnitude response 1')
subplot(2,1,2)
plot(w,angle(X))
title('phase response 1')
%2.
figure
x = (n==5);
X = DTFT(x,n(1),dw);
subplot(2,1,1)
plot(w,abs(X))
title('magnitude response 2')
subplot(2,1,2)
plot(w,angle(X))
title('phase response 2')
%3.
figure
x = (0.5.^n).*(n>=0);
X = DTFT(x,n(1),dw);
subplot(2,1,1)
plot(w,abs(X))
title('magnitude response 3')
subplot(2,1,2)
plot(w,angle(X))
title('phase response 3')
%5.2
figure
n = -50:50;
w = -pi:0.01:pi;
x = (n==0);
y = sys(x);
subplot(3,1,1)
stem(n,y);
title('impulse response')
Y = DTFT(y,n(1),0.01);
subplot(3,1,2)
plot(w,abs(Y));
title('magnitude response')
subplot(3,1,3)
plot(w,angle(Y));
title('phase response')
