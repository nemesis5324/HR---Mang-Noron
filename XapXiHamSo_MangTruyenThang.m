%%
clear all; %clf
clc;
%------------- Dieu kien ban dau
p=-2:0.1:2;
n=length(p);
g1=1+sin((1*pi/4)*p);
g2=1+sin((2*pi/4)*p);
g3=1+sin((3*pi/4)*p);
g4=1+sin((4*pi/4)*p);
s2=4; % so luong no ron trong lop an
s3=5;
S = [s2 s3];
% net1=newff([p;p],[g1;g2;g3],[s2 s3],{'tansig','logsig','tansig'});
% view(net1);
net1=newff(p,p,S,{'logsig'});
net2=newff(p,p,S,{'logsig'});
net3=newff(p,p,S,{'logsig'}) ;
net4=newff(p,p,S,{'logsig'});
EPOCHS = 9;
%-----------------------
net1.trainParam.epochs = EPOCHS;
net1.trainParam.max_fail  =  EPOCHS;%	Maximum validation failures
net1 = train(net1,p,g1);

net2.trainParam.epochs = EPOCHS;
net2.trainParam.max_fail  =  EPOCHS;%	Maximum validation failures
net2 = train(net2,p,g2);

net3.trainParam.epochs = EPOCHS;
net3.trainParam.max_fail  =  EPOCHS;%	Maximum validation failures
net3= train(net3,p,g3);

net4.trainParam.epochs = EPOCHS;
net4.trainParam.max_fail  =  EPOCHS;%	Maximum validation failures
net4 = train(net4,p,g4);

p1=0:0.1:4;
Y1=sim(net1,p); % OR Y1 = net1(p);
Y2=sim(net2,p);
Y3=sim(net3,p);
Y4=sim(net4,p);
%----------------------------------?o thi 1

subplot(2,2,1); plot(p,g1,p,Y1,'r'); grid on
subplot(2,2,2); plot(p,g2,p,Y2,'r'); grid on
subplot(2,2,3); plot(p,g3,p,Y3,'r'); grid on
subplot(2,2,4); plot(p,g4,p,Y4,'r'); grid on




