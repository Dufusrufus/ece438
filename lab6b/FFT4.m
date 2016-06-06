function X = FFT4(x)
%FFT4 Summary of this function goes here
%   Detailed explanation goes here
N =4;
X = zeros(1,N);
x0 = x(1:2:N);
x1 = x(2:2:N);
X0 = FFT2(x0);
X1 = FFT2(x1);

for k = 1:N/2
        X(k) = X0(k) + exp(-i*2*pi*(k-1)/N) * X1(k);
        X(k+N/2) = X0(k) - exp(-i*2*pi*(k-1)/N) * X1(k);



end

