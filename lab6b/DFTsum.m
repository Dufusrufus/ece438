function X = DFTsum(x)
%DFTSUM Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
X = zeros(1,N);
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-i*2*pi*(k-1)*(n-1)/N);
        
        
    end

end
        
end

