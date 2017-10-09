% 
function res = E(phi, V, P)
[n, m] = size(phi);
n = n + 1;
V0 = zeros(n, 1);
V0(1) = 1;
for i = 2 : n
    V0(i) = V0(i - 1) * sin(phi(i - 1));
end
for i = 1 : n - 1
    V0(i) = V0(i) * cos(phi(i));
end

res = 0;
for i = 1 : n
    Vi = V(:, i);
    Pi = P(:, i);
    alpha = 1 - (Vi' * V0) ^ 2;
    B = (Pi' * V0) * (V0' * Vi) / alpha;
    A = Pi' * V0 / alpha;
    D = A * V0 - B * Vi - Pi;
    D2 = D' * D;
    res = res + D2;
end
return
    