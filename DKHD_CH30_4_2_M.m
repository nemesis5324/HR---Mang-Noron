%%
clear all; clf
sim('DKHD_CH30_4_2_M_sim');

P = xout';
T = yout';
nn=length(T);

Pseq = con2seq(P);
Tseq = con2seq(T);

net = elmannet(1:3,3,'trainlm');
[Xs,Xi,Ai,Ts] = preparets(net,Pseq,Tseq);

% view(net)
net.trainParam.epochs = 200;
net.trainParam.max_fail = 200;
% net.trainParam.show = 10;
% net.trainParam.goal = 0.01;

net = train(net,Xs,Ts,Xi,Ai);
a=sim(net,Pseq);
a=cell2mat(a); % chuyen tu day ve d?ng song song
%e=T-T_train; % Sai so ham dich va ket qua luyen mang
%E = mse(e)% Tinh sai so trung binh binh phuong
figure
plot(1:nn,T,'b',1:nn,a,'r');
grid on
%axis ([0 4 -1 1])
%P3 =1.6* sin(0:0.5:19.5);
%T3 = ones(1,n)*1.6;
%P4 = sin(0:0.5:19.5)*1.2;
%T4 = ones(1,n)*1.2;
%Pg = [P3 P4 P3 P4];
%Tg = [T3 T4 T3 T4];
%Pgseq = con2seq(Pg);
%aa = sim(net,Pgseq);
%TT=cell2mat(aa);
%plot(1:nn,Tg,1:nn,TT,'r'); grid on

% From workspace variables
tin = 1:nn;
tin = tin';
Pin = P';

