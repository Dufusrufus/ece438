function [C] = ycbcr2RGB(A)
%YCBCR2RGB Summary of this function goes here
%   Detailed explanation goes here
A = double(A);
Y = A(:,:,1);
Cb = A(:,:,2);
Cr = A(:,:,3);
R = Y + 1.4025 * (Cr - 128);
G = Y - 0.3443 * (Cb - 128) - 0.7144 * (Cr - 128);
B = Y + 1.773 * (Cb - 128);

C(:,:,1) = R;
C(:,:,2) = G;
C(:,:,3) = B;

C = uint8(C);
end

