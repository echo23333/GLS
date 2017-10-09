%%The final codes to get the result of three different methods.

%Set the parameter of the random instances
%s is the size of the matrix
s= 5;
%round is the number of repetition of the experiments.
round =100;

E_GLS = 0;
E_peer = 0;
E_average = 0;
count = 0;

%Test the performance of these three methods.
for i = 1:round
    [t1,t2,t3] = experiment(s);
    E_GLS = E_GLS + t1;
    E_peer = E_peer + t2;
    E_average = E_average + t3;
    count = count + 1
end

A_GLS = E_GLS / round;
A_peer = E_peer / round;
A_ave = E_average / round;

%Save the result.
data2 = ones(1,4);
data2(1) = s;
data2(2) = A_GLS;
data2(3) = A_peer;
data2(4) = A_ave;

save data2
