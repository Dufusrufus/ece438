function [X] = DFTwin(x,L,m,N)
%DFTWIN Summary of this function goes here
%   Detailed explanation goes here
w = hamming(L);
xseg = x(m:m+L-1);
X = fft(xseg.*w,N);
end

