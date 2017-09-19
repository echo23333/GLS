function [M,V0,fval] = mini(V,P)
s = size(P,1);

[V0, fval] = HarryGuo(V, P);
M = P';

for i = 1:s
    Vi = V(:, i);
    Pi = P(:, i);
    W = dist(V0,Vi,Pi);
    M(i,i) = W(i);
end