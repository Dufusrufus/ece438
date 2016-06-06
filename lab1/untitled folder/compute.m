function [maximum,minimum,energy] = compute(t)
%COMPUTE Summary of this function goes here
%   Detailed explanation goes here
    maximum = max(signal1(t));
    minimum = min(signal1(t));
    energy = sum((signal1(t).^2)*(range(t))/(length(t)-1));

end

