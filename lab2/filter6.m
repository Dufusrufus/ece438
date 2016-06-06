function y = filter6(x)
%FILTER6 Summary of this function goes here
%   Detailed explanation goes here
n = length(x);
y = zeros(1,n);
for i = 1:n
    if i == 1
        y(i) = 1/3*x(i);
    elseif i <= 3
        y(i) = y(i-1)+1/3*x(i);
    else
        y(i) = y(i-1)-1/3*(x(i)-x(i-3));
    
end


end

