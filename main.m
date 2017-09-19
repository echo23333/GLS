s = 3;
V = eye(s);


P = [0 2 3; 
     4 0 6; 
     6 6 0];
%P = Test;
for i = 1:s
    P(i,i) = 0;
end

P = P';
P1 = P(:, 1);
[M0,V00,fval0] = mini(V,P);


JUDGE = M0'*M0;
[vec,eigs] = eig(JUDGE);


vector = vec(:,s);
SCORE = M0*vector;





