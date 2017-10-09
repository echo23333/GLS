%The experiment to test the performance of the three method.
%ERROR_GLS,ERROR_Peerrank,ERROR_average is the error distance caused by GLS
%method,PeerRank method and the average method. And s is the size of the
%matrix.



function [ERROR_GLS,ERROR_Peerrank,ERROR_average] = experiment(s)


%%Generate the random instance
E0 = rand(1,s) + 0.001;
E0 = E0 / norm(E0,2);

Actual = round(89*rand(1,s)+1);
E = rand(s,s);
for i = 1:s
    E(i,:) = Actual(i) * E0 + 10 * ones(1,s);
end

R = normrnd(0,1,s,s);

Test = E + R;

for i = 1:s
    Test(i,i) = 0;
end
ave = ones(1,s);

%%
%The result of GLS method
[SCORE,fval0,M0,V0] = GLS(Test);
alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + SCORE(i)^2;
    beta = beta + SCORE(i)*Actual(i);
end
coefficient1 = beta /alpha;
SCORE = coefficient1 * SCORE;
ERROR_GLS = norm(SCORE - Actual', 2);

%%
%%The result of PeerRank method
[X0] = peerrank(Test);
alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + X0(i)^2;
    beta = beta + X0(i)*Actual(i);
end
coefficient = beta /alpha;
X0 = coefficient * X0;

ERROR_Peerrank = norm(X0 - Actual', 2);

%%
%%The result of average method
ave = average(Test);
alpha = 0;
beta = 0;
for i = 1:s
    alpha = alpha + ave(i)^2;
    beta = beta + ave(i)*Actual(i);
end
coefficient2 = beta /alpha;
ave = coefficient2 * ave;
ERROR_average = norm(ave - Actual',2);

