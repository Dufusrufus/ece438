function y = differen(x);
%DIFFEREN Summary of this function goes here
%   Detailed explanation goes here

y = [x,0]-[0,x];
y = y(1:length(x));

end
