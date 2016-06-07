function [F] = empcdf(X,t)
%EMPCDF Summary of this function goes here
%   Detailed explanation goes here
N = length(t);
F = zeros(1,N);
for i = 1:N    
    F(i) = 1 / length(X) * sum(X<=t(i));
end

