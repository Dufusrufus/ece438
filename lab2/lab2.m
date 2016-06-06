%3 
close all;
n = -10:20;
x = (n == 0) - (n==5);
y = differen(x);
subplot(6,1,1)
stem(n,x)
title('input1')
subplot(6,1,2)
stem(n,y)
title('diff1')
y = integ(x);
subplot(6,1,3)
stem(n,y)
title('integ1')
n = -10:20;
N=10;
x = (n>=0) - (n>=(N+1));
y = differen(x);
subplot(6,1,4)
stem(n,x)
title('input2')
subplot(6,1,5)
stem(n,y)
title('diff2')
y = integ(x);
subplot(6,1,6)
stem(n,y)
title('integ2')

%4
clear
n = -10:20;
delta = (n==0);
figure
n = -10:20;
%S1
subplot(5,1,1)
y = S1(delta);
stem(n,y)
title('impulse response of S1')
%S2
subplot(5,1,2)
y = S2(delta);
stem(n,y)
title('impulse response of S1')
%S3
subplot(5,1,3)
y = S1(S2(delta));
stem(n,y)
title('impulse response of S3')
%S4
subplot(5,1,4)
y = S2(S1(delta));
stem(n,y)
title('impulse response of S4')
%S5
subplot(5,1,5)
y = S1(delta)+S2(delta);
stem(n,y)
title('impulse response of S5')
%5
clear
music = auread('music.au');
%sound(music);
F1 = (S1(music'))';
n = -10:20;
sound(F1);
F2 = (S2(music'))';
sound(F2);
%6
clear
figure
n = -10:20;
delta = (n==0);
subplot(2,1,1)
y = S3(delta);
stem(n,y)
title('impulse response for S3')
subplot(2,1,2)
y = S3(S2(delta));
stem(n,y);
title('impulse response for S3(S2)')
%7
clear
figure
n = -20:20;
x1 = exp(i*2*pi*n);
x2 = exp(i*3/2*pi*n);
x3 = x1+x2;
y1 = bbox3(x1);
y2 = bbox3(x2);
y3 = bbox3(x3);
subplot(2,1,1)
stem(n,y1+y2)
title('bbox3: y1+y2')
subplot(2,1,2)
stem(n,y3)
title('bbox3: y3')
%bbox3 is not linear
x1 = sin(2*pi*n);
x1(1) = 0;
x2 = zeros(1,length(n));
for i = 1: length(n)-1
    x2(i) = x1(i+1);
end
y1 = bbox2(x1);
y2 = bbox2(x2);
figure
subplot(2,1,1)
stem(n,y1)
title('bbox2: y1')
subplot(2,1,2)
stem(n,y2)
title('bbox2: y2')
%bbox2 is time varying
%8
clear
figure
load('stockrates.mat')
subplot(3,1,1)
n = 0:length(rate)-1;
stem(n,rate)

title('original exchange-rates')
subplot(3,1,2)
y1 = filter5(rate);
hold on
stem(n,y1)
title('filtered(5) exchange-rates')
subplot(3,1,3)
y2 = filter6(rate);
stem(n,y2)
title('filtered(6) exchange-rates')
figure
plot(n,rate,n,y1,'o',n,y2,'x')
legend('original','filter5','filter6')