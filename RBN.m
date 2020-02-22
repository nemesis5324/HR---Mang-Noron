%%
clear;clc;

% sim('Sinwave');
% P = tout';
% T = yout';

P=0:0.0318:10;
a = 1;
f = 10;
T=a*sin(2*pi*f*P);

plot(P,T);
spread=0.02;
net=newrbe(P,T,spread);
% view(net);

% Ket Qua luyen
A=sim(net,P);
plot(P,T,P,A);
gensim(net,-1);

%%
net.IW{1,1};%W1=p
net.b{1,1};%b=0.8336/spread
net.IW{2,1};
net.b{2};

spread1=200;
net1=newrbe(P,T,spread1);
A1=sim(net1,P);
plot(P,T,P,A1);

% T2=sin(2*P);
% A2=sim(net1,P);
% plot(P,T,P,A1);
%%
% spread tang=> kha nang xap xi giam
P=0:0.1:10;
T=trapmf(P,[1 5 7 8]);
plot(P,T);
spread1=5;
net1=newrbe(P,T,spread1);
A1=sim(net1,P);
plot(P,T,P,A1);


%% newrb
% Tinh so noron toi thieu
clear;clc;
P=0:0.1:10;
T=trapmf(P,[1 5 7 8]);
plot(P,T);
goal = 0.01;
MN = 101;
DF = 4;
net1=newrb(P,T,goal,MN,DF);
E = mse(T,A1);

%% tao mang truyen thang
% So sanh voi mang truyn thang
s1=10;
net1=newff(P,T,[s1],{'logsig'});
net1.trainParam.epochs = 200;
net1.trainParam.max_fail=200;
net1=train(net1,P,T);
A1=sim(net1,P);
plot(P,T,P,A1);
E = mse(T,A1);
