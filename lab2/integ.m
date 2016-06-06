function y = integ(x);
%INTEG Summary of this function goes here
%   Detailed explanation goes here
y = [];
for i = 1: length(x)
    y = [y,sum(x(1:i))];
end
        

end

