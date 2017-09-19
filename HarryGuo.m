function [V0, fval] = HarryGuo(V, P)
[n, m] = size(V);
LB = zeros(n - 1, 1);
UB = ones(n - 1, 1) * pi/2;
UB(n - 1) = pi/2;
phi0 = rand(n - 1, 1) * pi/2;
phi0(n - 1) = phi0(n - 1) * 2;
OPTIONS = optimoptions('fmincon','Algorithm','sqp');
[phi, fval] = fmincon(@(phi) E(phi, V, P), phi0, [], [], [], [], LB, UB);
V0 = zeros(n, 1);
V0(1) = 1;
for i = 2 : n
    V0(i) = V0(i - 1) * sin(phi(i - 1));
end
for i = 1 : n - 1
    V0(i) = V0(i) * cos(phi(i));
end
return
