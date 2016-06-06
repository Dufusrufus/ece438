function x = IDFTsum(X)
%IDFTSUM Summary of this function goes here
%   Detailed explanation goes here
N = length(X);
x = zeros(1,N);
for k = 1:N
    for n = 1:N
        x(k) = x(k) + X(n) * exp(i*2*pi*(k-1)*(n-1)/N);
      
    end

end
x = x / N;   

end

