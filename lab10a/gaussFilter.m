function [h] = gaussFilter(N,var)
%GAUSSFILTER Summary of this function goes here
%   Detailed explanation goes here
i_mid = ceil(N/2);
j_mid = ceil(N/2);
for i = 1:N
    for j = 1:N
        h(i,j) = exp(-1*((i-i_mid)^2+(j-j_mid)^2)/(2*var));
    end
end
C = 1/sum(sum(h));
h = C * h;

end

