function [SCORE,fval0,M0,V0] = OUR(P)
s = size(P,1);
V = eye(s);

for i = 1:s
    P(i,i) = 0;
end

P = P';

[M0,V0,fval0] = mini(V,P);


JUDGE = M0'*M0;
[vec,eigs] = eig(JUDGE);


vector = vec(:,s);
SCORE = M0*vector;
%V0
%vector





