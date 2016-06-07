function X = DTFT(x,n0,dw);
%DTF Summary of this function goes here
%   Detailed explanation goes here
w = -pi:dw:pi;
n = 1:length(x);
X = zeros(1,length(w));
for i = 1:length(w)
    X(i) = sum(x.*exp(-sqrt(-1)*w(i).*(n+n0-1)));
end


end

