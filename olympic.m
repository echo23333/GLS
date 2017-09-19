function [olym] = olympic(A)
s = size(A,1);

for i = 1:s
    [nmax,ind1] = max(A(i,:));
    A(i,i) = 1000;
    [nmin,ind2] = min(A(i,:));
    A(i,ind1) = 0;
    A(i,ind2) = 0;
    A(i,i) = 0;
end

olym = sum(A,2)/s;