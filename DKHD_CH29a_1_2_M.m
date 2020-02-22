%%
clear all; clf
P1=-5:0.1:5; % Dau vao P1
P2=-1:0.02:1;% Dau vao P2
T=sin(P1)+cos(P2); % Da ra ham dich
P=[P1; P2];% To hop dau vao P1 - P2
n=length(T); % kich thuoc mang T dau ra ham dich
%T2=cos(P);
%T=[T1 T2];
net=newff(P,T,[5 2], {'tansig', 'logsig'},'trainlm','learngdm');% Khoi tao mang truyen thang
%gensim(net);
%net=init(net);
%net.IW{1,1}=zeros(5,1);
%net.b{1,1}= zeros(5,1);
%net.LW{2,1}= zeros(2,5);
%net.b{2,1}= zeros(2,1);
%net.LW{3,2}= zeros(1,2);
%net.b{3}= 0;
A=sim(net,P);% Mo phong mang truoc khi luyen mang
net.trainParam.epochs = 200;
net.trainParam.goal = 1e-5;
net.trainParam.max_fail =20;
NET= train(net,P,T);% Ket qua luyen mang
Y = sim(NET,P); % Mo phong ket qua sau khi luyen mang
e=T-Y; % Sai so ham dich va ket qua luyen mang
plot(1:n,T,1:n,A,'k',1:n,Y,'r');
E = mse(e);% Tinh sai so trung binh binh phuong
view(NET)% Hien thi cau truc mang