function X = FFT2(x)
%FFT2 Summary of this function goes here
%   Detailed explanation goes here
X = zeros(1,2);
X(1) = x(1) + x(2);
X(2) = x(1) - x(2);

end

