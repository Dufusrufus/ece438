function [C] = CorR(X,Y,m)
%CORR Summary of this function goes here
%   Detailed explanation goes here
N = length(X);
if (m >= 0 & m <= N-1)
    C = 1/(N-m)*X(1:N-m)*Y(1+m:N)';
elseif (m >= 1-N & m <0)
    C = 1/(N-abs(m))*X(abs(m)+1:N)*Y(1:N+m)';
    

end

