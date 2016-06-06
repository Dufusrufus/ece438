function A = DFTmatrix(N)
%DFTMATRIX Summary of this function goes here
%   Detailed explanation goes here
A = zeros(N,N);
for k = 1:N
    for n = 1:N
        A(k,n) = exp(-i*2*pi*(k-1)*(n-1)/N);
    end
end

end

