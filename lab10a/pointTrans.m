function [output] = pointTrans(input, T1, T2)
%POINTTRANS Summary of this function goes here
%   Detailed explanation goes here
if (input<=T1)
    output = 0;
elseif (input>=T2)
    output = 255;
else
    output = 255/(T2-T1)*(input-T1);
end



end

