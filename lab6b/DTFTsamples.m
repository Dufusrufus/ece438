function [X,w] = DTFTsamples(x)
%DTFTSAMPLES Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
X = DFTsum(x);
k = 0:N-1;
w = 2*pi*k/N;
w(w>=pi) = w(w>=pi)-2*pi;
X = fftshift(X);
w = fftshift(w);
end

