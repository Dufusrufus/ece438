function y = S2(x);
%S2 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
y = zeros(1,N);
for i = 1: N
   if(i == 1)
       y(i) = x(i);
   else
       y(i) = 0.5 * y(i-1)+ x(i);
end

end

