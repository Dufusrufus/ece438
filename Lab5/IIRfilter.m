function y = IIRfilter(x,theta);
%IIRFILTER Summary of this function goes here
%   Detailed explanation goes here
r = 0.995;
y = zeros(1,length(x));

for i = 1:length(x)
    if i == 1
        y(i) = (1-r)*x(i);
    elseif i == 2
        y(i) = (1-r)*x(i)+2*r*cos(theta)*y(i-1);
    else
        y(i) = (1-r)*x(i)+2*r*cos(theta)*y(i-1)-r^2*y(i-2);
end
end

