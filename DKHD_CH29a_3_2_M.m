clear all; clf
P=0:0.01:5;
n=length(P)
T=sin(2*pi*P);
net=newff(P,T,[10 5], {'tansig', 'tansig'},'traincgp');
%net=newff([0 10],[5,2,2],{'tansig','purelin','purelin'},'trainlm');% khai bao theo kieu cu
%gensim(net);
net=init(net);
A=sim(net,P);
net.trainParam.epochs = 500;
net.trainParam.max_fail=100;
% net.trainParam.goal = 1e-3;
NET= train(net,P,T);
Y = sim(NET,P);
e=T-Y;
plot(P,T,P,A,'k',P,Y,'r');
E = mse(e)
