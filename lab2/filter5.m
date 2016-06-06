function y = filter5(x);
%FILTER5 Summary of this function goes here
%   Detailed explanation goes here
n=length(x);
y=zeros(1,n);
for i = 1:n
    if i == 1
        y(i) = 0.2*x(i);
    else
        y(i) = 0.8*y(i-1)+0.2*x(i);
        
end

end

