function B = IDFTmatrix(N)
%IDFTMATRIX Summary of this function goes here
%   Detailed explanation goes here
B = zeros(N,N);
for k = 1:N
    for n = 1:N
        B(k,n) = exp(i*2*pi*(k-1)*(n-1)/N)/N;
    end
end
end

