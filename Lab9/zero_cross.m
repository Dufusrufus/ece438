function [y] = zero_cross(x)
%ZERO_CROSS Summary of this function goes here
%   Detailed explanation goes here
y = 0;
for i = 1:length(x)-1
    if (x(i)*x(i+1)<0)
        y = y + 1;
    end
end
    

end

