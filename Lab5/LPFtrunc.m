function y = LPFtrunc(N);
%LPFTRUNC Summary of this function goes here
%   Detailed explanation goes here
wc = 2;
n = 0:N-1;
y = (wc/pi)*sinc(wc/pi*(n-(N-1)/2));

end

