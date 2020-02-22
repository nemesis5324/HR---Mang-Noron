%% Mang 2 lop lan truyen thang
% newff example
clear;clc;
P = {[1;4] [2;1] [3;2] [1;3] [2;3] ...
     [4;3] [1;2] [4;1] [3;4]};
T = {[1;1] [0;0] [1;1] [0;0] [1;1] ...
     [1;1] [0;0] [1;1] [1;1]};

P1 = cell2mat(P);
T1 = cell2mat(T);
plotpv(P1,T1);
 
net=newff(...
P,...RxQ1 matrix of Q1 representative R-element input
T,...SNxQ2 matrix of Q2 representative SN-element target vectors.
[2],... Sizes of N-1 hidden layers, S1 to S(N-1)
{'satlin','hardlim'},...Transfer function of ith layer
'trainlm',...% training function, default = 'trainlm'
'learngdm');

net.layers{2}.dimensions = 2;

% net.b{1} = [0.5; -0.5];
% net.b{2} = [-0.5; 0.5];
% net.IW{1,1} = [-0.5  1
%                 0.5 -1];
% net.LW{2,1} = [ 0.5 -1
%                -0.5  1];
% view(net);

% TRAINING
weigh_init = 'rands';
bias_init = 'rands';

net.inputWeights{1,1}.initFcn = weigh_init;
net.biases{1,1}.initFcn = bias_init;

net.biases{2,1}.initFcn = bias_init;
net.layerWeights{2,1}.initFcn = weigh_init;

net.trainParam.epochs = 50;
net=train(net,P,T);

Y = cell2mat(net(P));
i=0;
T1 = cell2mat(T);
for i=1:1000
    net = init(net);
    net=train(net,P,T);
    Y = cell2mat(net(P));
    if Y == T1
        break;
    end
end