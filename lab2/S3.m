function y = S3(x);
%S3 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
y = zeros(1,N);

for i = 1: N
   if(i == 1)
       y(i) = x(i);
   else
       y(i) = x(i)-0.5*x(i-1); 
end


end

