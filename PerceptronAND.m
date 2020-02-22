%% Mang 1 perceptron AND
% newp example
clear;clc;
P = [0 0 1 1
     0 1 0 1];
T = [0 0 0 1];
net = newp(P,T);
view(net);

net.IW{1,1} = [2 2];
net.b{1} = -3;
% TRAINING
net.trainParam.epochs = 50;
net.trainParam.max_fail = 50;
net=train(net,P,T);

% net=adapt(net,P,T);
Y = sim(net,P)