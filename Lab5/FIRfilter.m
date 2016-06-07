function y = FIRfilter(x,theta);
%FIRFILTER Summary of this function goes here
%   Detailed explanation goes here
h = [1 -2*cos(theta) 1];
y = conv(x,h);
end

