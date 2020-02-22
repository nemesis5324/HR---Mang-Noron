clear all; clf
P=-1:0.01:1;
T1=sin(2*P);
T2=cos(2*P);
T=[T1; T2];
net=newff(P,T,[5 2], {'tansig', 'tansig'},'trainlm');

%net=newff([0 10],[5,2,2],{'tansig','purelin','purelin'},'trainlm');% khai bao theo kieu cu
%gensim(net);
%net=init(net);
%net.IW{1,1}=[ 1 1 1 1 1 ]';
%net.b{1,1}= [1 1 1 1 1]';
%net.LW{2,1}=[ 0.3233   -0.6658   -0.8869   -1.0468    0.3950;   -0.6501    0.5395    0.7162    1.0633   -0.4785];
%net.b{2,1}= [-1.6082;   0];
%net.LW{3,2}= [ 0.7345    0.5219;   -0.9397    1];
%net.b{3}= [0.2377;    0.4415];
A=sim(net,P);
plot(P,T1,P,A(1,:),P,T2,P,A(2,:));
legend('T1','Output 1','T2','Output 2');

net.trainParam.epochs = 200;
net.trainParam.max_fail=50;
net.trainParam.goal = 1e-5;
NET= train(net,P,T);
Y = sim(NET,P);
e1=T1-Y(1,:);
e2=T2-Y(2,:);

plot(P,T1,P,A(1,:),'k*',P,Y(1,:),'r');
title('T1=sin(2*P)');
legend('T1','No train','Trained');
figure;
plot(P,T2,P,A(2,:),'k*',P,Y(2,:),'r');
title('T2=cos(2*P)');
legend('T2','No train','Trained');

E1 = mse(e1)
E2 = mse(e2)
view(NET)