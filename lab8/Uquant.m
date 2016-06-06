function [Y] = Uquant(X,N)
%UQUANT Summary of this function goes here
%   Detailed explanation goes here
delta = (max(X(:))-min(X(:)))/(N-1);
Y = (X-min(X(:)))/delta;
Y = round(Y);
Y = Y*delta + min(X(:));


end

