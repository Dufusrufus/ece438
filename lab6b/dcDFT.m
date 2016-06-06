function X = dcDFT(x)
%DCDFT Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
X = zeros(1,N);
x0 = x(1:2:N);
x1 = x(2:2:N);
X0 = DFTsum(x0);
X1 = DFTsum(x1);

for k = 1:N/2
        X(k) = X0(k) + exp(-i*2*pi*(k-1)/N) * X1(k);
        X(k+N/2) = X0(k) - exp(-i*2*pi*(k-1)/N) * X1(k);


end

