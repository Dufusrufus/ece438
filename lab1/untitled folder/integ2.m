function J = integ2(N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dt = 1/N;
t = 0:dt:1-dt;
J = dt*sum(exp(t));

end

