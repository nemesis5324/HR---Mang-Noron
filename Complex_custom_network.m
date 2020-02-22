%% Define custom neural network
% Network Definition
clear;clc;
net = network;

% dimensions:
net.numInputs = 2;
net.numLayers = 3;

% connections:
net.biasConnect = [1;0;1];
net.inputConnect = [1 0; 1 1; 0 0];
net.layerConnect = [0 0 0; 0 0 0; 1 1 1];
net.outputConnect = [0 0 1];


% subobjects:
net.inputs{1}.range = [0 10;0 10];
net.inputs{2}.range = [-2 2;-2 2;-2 2;-2 2;-2 2];

net.layers{1}.size = 4;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';

net.layers{2}.size = 3;
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.initFcn = 'initnw';

net.layers{3}.size = 1;
net.layers{3}.transferFcn = 'purelin';
net.layers{3}.initFcn = 'initnw';

net.inputWeights{2,1}.delays = [0 1];
net.inputWeights{2,2}.delays = 1;
net.layerWeights{3,3}.delays = 1;

% functions:
net.performFcn = 'mse';
net.trainFcn = 'trainlm';

net = init(net);
P = {[0; 0] [2; 0.5]; [2; -2; 1; 0; 1] [-1; -1; 1; 0; 1]};
T = {1 -1};
net(P);
net.trainParam.goal = 1e-5;
net = train(net,P,T);