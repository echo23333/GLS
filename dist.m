function W = dist(V0,Vi,Pi)
X = Vi*Pi'*V0*V0'*Vi;
Y = 1 - (Vi'*V0)*(Vi'*V0);
W = X ./ Y;

