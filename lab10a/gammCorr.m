function [B] = gammCorr(A,gamma)
%GAMMCORR Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(A);
for i = 1: r
    for j = 1:c
        B(i,j) = (A(i,j)/255)^(1/gamma)*255;
    end
end

end

