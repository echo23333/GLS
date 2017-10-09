close all;
clc;
load data.mat

x = data2(:,1:1); 



xlabel('Number of Agents');
ylabel('Average Relaxed Distances');
%title('Mean ratio with 100 candidates, 7 voters');
hold on

y4= data2(:,4:4);%Peer
plot(x,y4,'k*-')
hold on

y3= data2(:,3:3);%Ave
plot(x,y3,'ko-')
hold on



y2 = data2(:,2:2);%our
plot(x,y2,'ks-')

%{
y5= data(:,5:5);%peerrank
plot(x,y5,'k+-')
hold on
%}
legend('PeerRank','Average','GLS');

hold on