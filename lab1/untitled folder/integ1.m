function I = integ1(N)
%INTEG1 Summary of this function goes here
%   Detailed explanation goes here

dt = 2*pi/N;
t = 0:dt:2*pi-dt;
I = dt*sum((sin(5*t)).^2);
end

