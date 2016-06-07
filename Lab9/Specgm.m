function [A] = Specgm(x,L,overlap,N)
%SPECGM Summary of this function goes here
%   Detailed explanation goes here
A = zeros(N,ceil(2*length(x)/L));
inds = 1;
inde = L;
cnt = 1;
while(inde < length(x))
    X = DFTwin(x(inds:inde)',L,1,N);
    A(:,cnt) = X    ;
    cnt = cnt + 1;
    inds = inde - overlap + 1;
    inde = inds + L - 1;
end
A = A(1:N/2+1,1:cnt-2);
   
end

