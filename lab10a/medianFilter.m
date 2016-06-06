function [Y] = medianFilter(X)
%MEDIANFILTER Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(X);
Y = X;
for i = 2:r-1
    for j = 2:c-1
        Y(i,j) = median([X(i-1,j-1),X(i-1,j),X(i-1,j+1),X(i,j-1),X(i,j+1),X(i+1,j-1),X(i+1,j),X(i+1,j+1)]);
    end
end
end

