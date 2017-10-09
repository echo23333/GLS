%The function of peerrank method

function [X0,count] = peerrank(A)

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