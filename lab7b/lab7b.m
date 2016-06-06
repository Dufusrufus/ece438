close all
clear
clc
N=1000;
X = randn(1,N);
Y = randn(1,N);
%1.2
%1
Z = Y;
subplot(2,2,1)
plot(X,Z,'.')
title('Z1')
p1 = sum((X-mean(X)).*(Z-mean(Z)))/sqrt(sum((X-mean(X)).^2).*sum((Z-mean(Z)).^2))

Z = (X+Y)/2;
subplot(2,2,2)
plot(X,Z,'.')
title('Z2')
p2 = sum((X-mean(X)).*(Z-mean(Z)))/sqrt(sum((X-mean(X)).^2).*sum((Z-mean(Z)).^2))

Z=(4*X+Y)/5;
subplot(2,2,3)
plot(X,Z,'.')
title('Z3')
p3 = sum((X-mean(X)).*(Z-mean(Z)))/sqrt(sum((X-mean(X)).^2).*sum((Z-mean(Z)).^2))

Z=(99*X+Y)/100;
subplot(2,2,4)
plot(X,Z,'.')
title('Z4')
p4 = sum((X-mean(X)).*(Z-mean(Z)))/sqrt(sum((X-mean(X)).^2).*sum((Z-mean(Z)).^2))

%2.2
X = randn(1,1000);
Y = zeros(1,1000);
for i = 1:1000
    if i==1
        Y(i) = X(i);
    elseif i==2
        Y(i) = X(i)-X(i-1);
    else
        Y(i) = X(i)-X(i-1)+X(i-2);
    end
end
figure
subplot(2,2,1)
plot(Y(1:900),Y(2:901),'.')
title('Y(i),Y(i+1)')

subplot(2,2,2)
plot(Y(1:900),Y(3:902),'.')
title('Y(i),Y(i+2)')

subplot(2,2,3)
plot(Y(1:900),Y(4:903),'.')
title('Y(i),Y(i+3)')

subplot(2,2,4)
plot(Y(1:900),Y(5:904),'.')
title('Y(i),Y(i+4)')

m = -20:20;
figure
subplot(2,1,1)
ryy1 = (3*(m==0)-2*(m==1)-2*(m==-1)+(m==-2)+(m==2));
stem(m,ryy1)
title('ryy(m)')
subplot(2,1,2)
m = -(N-1):N-1;
for i = 1:length(m)
    ryy2(i) = 1/(N-abs(m(i)))*(Y(1:N-abs(m(i)))*Y(1+abs(m(i)):N)');
end
stem((-20:20),ryy2([-20+1000:20+1000]));
title('ryy''(m)')
%3.2
X = randn(1,1000);
Z = randn(1,1000);
Y = X+Z;
i = 1;

for m = -10:10
    C(i) = CorR(X,Y,m);
    i = i+1;
end
m = -10:10;
figure
stem(m,C)
title('sample cross-correlation between X and Y')
xlabel('m')
ylabel('Cxy')


load radar;
figure
subplot(2,1,1)
plot(trans)
title('transimitted signal')
subplot(2,1,2)
plot(received)
title('received signal')

i = 1;
for m = -100:100
    rxx(i) = CorR(trans,trans,m);
    cxy(i) = CorR(trans,received,m);
    i = i+1;
end
m = -100:100;
figure
stem(m,rxx)
title('sample autocorrelation of trans signal')
figure
stem(m,cxy)
title('sample cross-correlation of trans and recv signal')

D = find(cxy==max(cxy)) - 100