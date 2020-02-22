%%
clear all; %clf
t=0:0.5:19.5;
n=length(t);
P1 = sin(t);
P2 = 2*sin(t);
T1 = ones(1,n);
T2 = 2*ones(1,n);
P = [P1 P2 P1 P2];
T = [T1 T2 T1 T2];
nn=length(P);
%plot(1:nn,P,'LineWidth',1); grid on; hold on
%plot(1:nn,T,'k','LineWidth',2); grid on
%%axis ([0 160 -2.5 2.5])
Pseq = con2seq(P);
Tseq = con2seq(T);
net = elmannet(1:2,5,'trainlm');
% net = elmannet(1:2,[4 5],'trainlm');
% net.layer


[Xs,Xi,Ai,Ts,EW,shift] = preparets(net,Pseq,Tseq);

net.trainParam.epochs = 200;
net.trainParam.show = 5;
net.trainParam.goal = 1e-5;
net.trainParam.max_fail= 100;
net = initnw(net,1);
% view(net);
net = train(net,Xs,Ts,Xi,Ai);

% From workspace data
tin = 1:nn;
tin = tin';
Pin = P';
Tin = T';


%% TEST with original signal
a=sim(net,Pseq);
T_train=cell2mat(a); % chuyen tu day ve d?ng song song
plot(1:nn,T,1:nn,T_train,'r'); grid on
axis ([0 160 0 2.5]);

%% TEST with preparets signal 
% Ts = cell2mat(Ts);
a=sim(net,Xs);
N = length(Xs);
T_train=cell2mat(a);
figure;
plot(1:N,Ts,1:N,T_train,'r'); grid on
axis ([0 160 0 2.5]);
%%
P3 =1.6* sin(0:0.5:19.5);
T3 = ones(1,n)*1.6;
P4 = sin(0:0.5:19.5)*1.2;
T4 = ones(1,n)*1.2;
Pg = [P3 P4 P3 P4];
Tg = [T3 T4 T3 T4];
Pgseq = con2seq(Pg);
aa = sim(net,Pgseq);
TT=cell2mat(aa);
figure;
plot(1:nn,Tg,1:nn,TT,'r'); grid on
