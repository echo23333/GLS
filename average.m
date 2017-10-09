% the function of average method
function [aver] = average(Test)
s = size(Test,1);
aver = sum(Test,2)/s;
