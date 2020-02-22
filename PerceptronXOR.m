%% Mang 2 perceptron XOR
% newp example
clear;clc;

P = [0 0 1 1
     0 1 0 1];
T = [0 1 1 0];

P1 = [P P P P];
T1 = [T T T T];
net = newp(P,T,'hardlim','learnpn');

weigh_init = 'rands';
bias_init = 'rands';


net.numInputs = 1;     
net.numLayers = 2;
net.biasConnect = [1;1]; 
net.inputConnect = [1;0];  
net.layerConnect = [0 0;1 0];
net.outputConnect = [0 1];

net.inputWeights{1,1}.initFcn = weigh_init;
net.biases{1,1}.initFcn = bias_init;

net.layers{1}.size = 2;
net.layers{2}.size = 1;

net.layers{2}.transferFcn = 'hardlim';
net.biases{2,1}.initFcn = bias_init;
net.biases{2,1}.learnFcn = 'learnpn';
net.layerWeights{2,1}.learnFcn = 'learnpn';
net.layerWeights{2,1}.initFcn = weigh_init;
net = init(net);
         

% net.IW{1,1} = [ 1  1
%                -1 -1];
% net.b{1} = [-0.5; 1.5];
% net.LW{2,1} = [1 1];
% net.b{2} = [-1.5];

% TRAINING
net.trainFcn = 'trainlm';
net.performFcn = 'mse';
net.trainParam.epochs = 1000;
net.trainParam.max_fail = 10;
net = init(net);
net=train(net,P,T);
% net=adapt(net,P,T);

i=0;
for i=1:1000
    net = init(net);
    net=train(net,P,T);
    Y = sim(net,P);
    if Y == T
        break;
    end
end
Y = sim(net,P)

hold on;
plotpv(P,T);
plotpc(net.IW{1,1},net.b{1});
hold off;
