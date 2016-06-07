function [var] = vars(x)
%VARS Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
var = 1/(N-1)*sum((x-mean(x)).^2);

end

