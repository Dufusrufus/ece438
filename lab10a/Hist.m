function [] = Hist(A)
%HIST Summary of this function goes here
%   Detailed explanation goes here
[M,N] = size(A);
x = reshape(A,1,M*N);
hist(x,0:255);


end

