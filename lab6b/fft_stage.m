function X = fft_stage(x)
%FFT_STAGE Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
X = zeros(1,N);
if (N == 2)
    X(1) = x(1) + x(2);
    X(2) = x(1) - x(2);
else
    x0 = x(1:2:N);
    x1 = x(2:2:N);
    X0 = fft_stage(x0);
    X1 = fft_stage(x1);
    for k = 1:N/2
        X(k) = X0(k) + exp(-i*2*pi*(k-1)/N) * X1(k);
        X(k+N/2) = X0(k) - exp(-i*2*pi*(k-1)/N) * X1(k);
    end

        
        


end

