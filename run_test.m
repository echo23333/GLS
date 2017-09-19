s = 50;

round =100;

E_our = 0;
E_peer = 0;
E_average = 0;
E_oly = 0;
count = 0;
for i = 1:round
    [t1,t2,t3,t4] = experiment(s);
    E_our = E_our + t1;
    E_peer = E_peer + t2;
    E_average = E_average + t3;
    E_oly = E_oly + t4;
    count = count + 1
end

A_our = E_our / round;
A_peer = E_peer / round;
A_ave = E_average / round;
%A_oly = E_oly / round;

data2 = ones(1,4);
data2(1) = s;
data2(2) = A_our;
data2(3) = A_peer;
data2(4) = A_ave;
%data2(5) = A_oly;
data2
save data2
