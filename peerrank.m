function [X0,count] = peerrank(A)
%{
A = [3.4497   52.4619   51.1844    0.0016   57.2811;
    2.4371   28.0661   27.7024   -0.7156   35.3282;
    3.2632   29.4548   26.7973    0.3554   33.5080;
    0.5858    8.7196    8.6720    1.9849   10.5535;
    1.8857   20.3111   20.4132   -1.2304   24.5832];
%}
s = size(A,1);

col_sum = sum(A,1);

for i = 1:s
    A(:,i) = A(:,i) / col_sum(i);
end 

X0 = sum(A,2)/s;

alpha = 0.1;
delta = zeros(1,s);
del_max = 1;
count = 0;
while del_max > 10e-3
    temp = X0;
    for i = 1:s
        sigma = 0;
        for j = 1:s
            sigma = sigma + temp(j) * A(i,j);
        end
        X0(i) = (1 - alpha)*X0(i) + (alpha / sum(temp)) * sigma;
        delta(i) = abs(temp(i) - X0(i));
        del_max = max(delta);
        %count = count + 1;
    end
    %count
end