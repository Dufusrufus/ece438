close all
clear
%2.2
x = randn(1,1000);
plot(x)
mean = means(x)
var = vars(x)
%2.3
x = randn(1,1000);
a = sqrt(9);
b = 3;
y = a*x+b;
figure
plot(y);
mean_y = means(y)
var_y = vars(y)
%3.1
N = 20;
X = rand(1,N);
figure;
t = [-1:0.001:2];
F = empcdf(X,t);
plot(t,F)
title('empcdf of N=20')

N = 200;
X = rand(1,N);
figure;
t = [-1:0.001:2];

F = empcdf(X,t);
plot(t,F)
title('empcdf of N=200')
%4.1
figure
x = [-1:0.001:2];
N = 20;
X = rand(1,N);
Fx = (1-exp(-3*X)).*(X>=0);
t = 0:0.001:1;
F = (1-exp(-3*t)).*(t>=0);
Yx = empcdf(Fx,x);
Y = empcdf(F,x);
plot(x,Yx)
hold on 
plot(x,Y)
title('N=20')

figure
x = [-1:0.001:2];
N = 200;
X = rand(1,N);
Fx = (1-exp(-3*X)).*(X>=0);
t = 0:0.001:1;
F = (1-exp(-3*t)).*(t>=0);
Yx = empcdf(Fx,x);
Y = empcdf(F,x);
plot(x,Yx)
hold on 
plot(x,Y)
title('N=200')

%5.2
figure
x = [0:0.001:1];
U = rand(1,1000);
X = U.^(1/3);
Fx = empcdf(X,x);
subplot(3,1,1)
plot(x,Fx)
title('Fx(x)')

L = 20;
x0 = 0;
xL = 1;
delta = (xL-x0)/L;
x = 0:delta:1;
f = zeros(1,L);
for i = 1:L
    f(i) = empcdf(X,x(i+1))-empcdf(X,x(i));
end
subplot(3,1,2)
stem(f)
title('fx(x)')
subplot(3,1,3)
fx = f / delta;
stem(fx)
title('f~(k)')

figure
N = 1000;
U = rand(1,1000);
X = U.^(1/3);
H = hist(X,(0.5:19.5)/20);
subplot(2,1,1)
stem(H/N)
title('H(k)/N')

subplot(2,1,2)
stem(f)
title('f~(k)')