function [ERROR_our,ERROR_Peerrank,ERROR_average,ERROR_oly] = experiment(s)
%s = 50;
E0 = rand(1,s) + 0.001;
E0 = E0 / norm(E0,2);

Actual = round(89*rand(1,s)+1);
%Actual = 50 * ones(1,s);
E = rand(s,s);
for i = 1:s
    E(i,:) = Actual(i) * E0 + 10 * ones(1,s);
end

R = normrnd(0,1,s,s);

Test = E + R;
%Test

bound = min(min(Test));
if bound < 0
    a = 1111111
end
for i = 1:s
    Test(i,i) = 0;
end
ave = ones(1,s);
%Test
[SCORE,fval0,M0,V0] = OUR(Test);
[X0] = peerrank(Test);
ave = average(Test);
oly = olympic(Test);
alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + X0(i)^2;
    beta = beta + X0(i)*Actual(i);
end

coefficient = beta /alpha;

X0 = coefficient * X0;
%coefficient


alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + SCORE(i)^2;
    beta = beta + SCORE(i)*Actual(i);
end

coefficient1 = beta /alpha;

alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + ave(i)^2;
    beta = beta + ave(i)*Actual(i);
end

coefficient2 = beta /alpha;

alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + oly(i)^2;
    beta = beta + oly(i)*Actual(i);
end

coefficient3 = beta /alpha;

SCORE = coefficient1 * SCORE;
ave = coefficient2 * ave;
oly = coefficient3 * oly;


ERROR_Peerrank = norm(X0 - Actual', 2);
%X0
ERROR_our = norm(SCORE - Actual', 2);
ERROR_average = norm(ave - Actual',2);
ERROR_oly = norm(oly - Actual',2);
%ERROR_our = 0;
