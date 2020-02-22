%% Mang 2 perceptron
% newp example
clear;clc;
P = {[1;4] [2;1] [3;2] [1;3] [2;3] [4;3]...
     [1;2] [4;1] [3;4] [3;5] [3;1] [2;2]};
T1 = {[-1] [1] [-1] [1] [-1] [-1]... 
       [1] [-1] [-1] [1]  [1] [-1]};
T2 = { [1] [-1] [1]  [1]  [1] [-1]... 
       [1]  [1] [-1] [-1] [1] [-1]};
  
% T = {cell2mat(T1); cell2mat(T2)};  
T = [];
i=0;
for i=1:length(P)
    T = [T [T1{i};T2{i}]];
end
T = con2seq(T);

P2 = cell2mat(P);
T2 = cell2mat(T);

net = newp(P,T);
net = init(net);
net.layers{1}.transferFcn = 'hardlims';
net.trainFcn = 'trainlm';
net.trainParam.lr = 0.1;
% net.trainParam.epochs = 50;
% net.trainParam.max_fail = 50;
net = train(net,P,T);
cell2mat(net(P))