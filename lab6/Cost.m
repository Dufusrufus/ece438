function cost = Cost(theta);
%COST Summary of this function goes here
%   Detailed explanation goes here
dw = 0.01;
w = -pi:dw:pi;

Hsh = sinc(w./(2*pi));
H_theta = prefilter(w,theta);
cost = sum((abs(1./Hsh)-abs(H_theta)).^2*dw);

end

