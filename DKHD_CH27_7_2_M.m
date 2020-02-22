%% Mang 2 perceptron
% newp example
clear;clc;clf
P = {[1;4] [4;5] [3;2] [1;3] [2;3] [4;3]...
     [1;2] [4;1] [3;4] [3;5] [3;1] [5;2]};
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

P1 = cell2mat(P);
T1 = cell2mat(T);
T1 = (T1+1)/2;
plotpv(P1,T1);

net = newp(P1,T1,'hardlim','learngdm'); 
net.numInputs = 1;     
net.numLayers = 2;

net.biasConnect = [1;1]; 
net.inputConnect = [1;0];  
net.layerConnect = [0 0;1 0];
net.outputConnect = [0 1];

net.layers{1}.size = 3;
net.layers{2}.size = 2;


net.inputWeights{1,1}.initFcn = 'rands';
net.biases{1,1}.initFcn = 'rands';

net.layers{2}.transferFcn = 'hardlim';
net.biases{2,1}.initFcn = 'rands';
net.biases{2,1}.learnFcn = 'learngdm';
net.layerWeights{2,1}.learnFcn = 'learngdm';
net.layerWeights{2,1}.initFcn = 'rands';
net = init(net);
% saved
% net.IW{1,1} = [-0.5  1
%                 0.5 -1];
% net.b{1} = [0.5; -0.5];
% net.LW{2,1} = [ 0.5 -1
%                -0.5  1];
% net.b{2} = [-0.5; 0.5];

% TRAINING
net.trainFcn = 'traingd';
net.trainParam.lr = 0.3;
net.performFcn = 'mse';
net.trainParam.epochs = 50;
net.trainParam.max_fail = 10;
net=train(net,P1,T1);

i=0;
for i=1:100
    net = init(net);
    net=train(net,P1,T1);
    Y = sim(net,P1);
    if Y == T1
        break;
    end
end

hold on;
plotpv(P1,T1);
plotpc(net.IW{1,1},net.b{1});
hold off;
% Y = cell2mat(Y)