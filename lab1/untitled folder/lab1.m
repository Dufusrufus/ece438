%3.2
%DT signal
close all
n = 0:2:60;
y = sin(n/6);
subplot(3,1,1)
stem(n,y)
title('DT signal,Junyan Shi')
xlabel('t')
ylabel('n[t]')
%CT signals
n1 = 0:2:60;
z = sin(n1/6);
subplot(3,1,2)
plot(n1,z)
title('CT signal 1,Junyan Shi')
xlabel('t')
ylabel('n1(t)')

n2 = 0:10:60;
w = sin(n2/6);
subplot(3,1,3)
plot(n2,w)
title('DT signal 2,Junyan Shi')
xlabel('t')
ylabel('n2(t)')


%3.3
figure;
y=[];
x=[];
for N = 1:100
    y = [y,integ1(N)];
    x = [x,N];
end
subplot(2,1,1)
plot(x,y);
xlabel('N')
ylabel('integ1(N)')

y=[];
x=[];
for N = 1:100
    y = [y,integ2(N)];
    x = [x,N];
end
subplot(2,1,2)
plot(x,y);
xlabel('N')
ylabel('integ2(N)')

%4
figure
audio = auread('speech.au');
plot(0:size(audio)-1,audio)
xlabel('t')
ylabel('signal')
sound(audio)

%5
clear
figure
t = -100:1:100;
y=signal1(t);
plot(t,y)
[max,min,energy]=compute(t)

%6
clear
figure
t=-10*pi:0.01:10*pi;
subplot(2,1,1)
plot(t,sinc(t))
xlabel('t')
ylabel('sinc(t)')
t=-2:0.01:2;
subplot(2,1,2)
plot(t,abs(t)<=2)
xlabel('t')
ylabel('rec(t)')

figure
n = -20:20;
subplot(3,1,1);
a = 0.8;
stem(n,(a.^n).*((n>=0)-(n>=10)))
title('a=0.8')
subplot(3,1,2);
a = 1.0;
stem(n,(a.^n).*((n>=0)-(n>=10)))
title('a=1.0')
subplot(3,1,3);
a = 1.5;
stem(n,(a.^n).*((n>=0)-(n>=10)))
title('a=1.5')

figure
w = pi/4;
n = -1:10;
subplot(3,1,1);
a = 0.8;
stem(n, cos(w*n).*(a.^n).*(n>=0))
title('a=0.8')
subplot(3,1,2);
a = 1.0;
stem(n, cos(w*n).*(a.^n).*(n>=0))
title('a=1.0')
subplot(3,1,3);
a = 1.5;
stem(n, cos(w*n).*(a.^n).*(n>=0))
title('a=1.5')

%7
clear
figure
subplot(4,1,1)
Ts = 1/10;
n = 0:100;
stem(n,sin(2*pi*Ts*n))
axis([0,100,-1,1])
title('plot1')

subplot(4,1,2)
Ts = 1/3;
n = 0:30;
stem(n,sin(2*pi*Ts*n))
axis([0,30,-1,1])
title('plot2')

subplot(4,1,3)
Ts = 1/2;
n = 0:20;
stem(n,sin(2*pi*Ts*n))
axis([0,20,-1,1])
title('plot3')

subplot(4,1,4)
Ts = 10/9;
n = 0:9;
stem(n,sin(2*pi*Ts*n))
axis([0,9,-1,1])
title('plot4')

%8
clear
figure
subplot(2,1,1)
sig1 = randn(1,1000);
plot(sig1)
title('sig1')
subplot(2,1,2)
sig2 = 0.2+randn(1,1000);
plot(sig2)
title('sig2')

figure
subplot(2,1,1)
avg1 = [];
for N = 1:1000;
    avg1 = [avg1, mean(sig1(1:N))];
end
plot((1:1000), avg1)
title('avg1')

subplot(2,1,2)
avg2 = [];
for N = 1:1000;
    avg2 = [avg2, mean(sig2(1:N))];
end
plot((1:1000), avg2)
title('avg2')

%9
clear
figure
[m,n] = meshgrid(-50:50, -50:50);
f = 255 * abs(sinc(0.2*m).*sin(0.2*n));
mesh(m,n,f)
figure
image(f);
colormap(gray(256))

