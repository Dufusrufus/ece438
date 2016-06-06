function H = prefilter(w,theta);
%PREFILTER Summary of this function goes here
%   Detailed explanation goes here
%one = ones(1,length(w));
z = exp(i*w);
H = (theta(1)+theta(2)*z.^(-1)+theta(3)*z.^(-2))./(1+theta(4)*z.^(-1)+theta(5)*z.^(-2));

%H = (theta(1) + theta(2)*z.^(-1) + theta(3)*z.^(-2)) ./ (1 + theta(4) * z.^(-1) + theta(5) * z.^(-2));

end

