function y = sys(x);
%SYS Summary of this function goes here
%   Detailed explanation goes here
y = zeros(1,length(x));

for i = 1:length(x)
    if i == 1
        y(i) = 0.3*x(i);
    else
        y(i) = 0.9*y(i-1)+0.3*x(i)+0.24*x(i-1);
end

end

