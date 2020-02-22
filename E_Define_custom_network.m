%% Define custom neural network
clear;clc;
inputs  = [1:6]'; % input vector (6-dimensional pattern)
outputs = [1 2]'; % corresponding target output vector

% create network
net = network( ...
1,         ... % numInputs,    number of inputs,
2,         ... % numLayers,    number of layers
[1;1],     ... % biasConnect,  numLayers-by-1 Boolean vector,
[1;0], ... % inputConnect, numLayers-by-numInputs Boolean matrix,
[0 0;1 0], ... % layerConnect, numLayers-by-numLayers Boolean matrix
[0 1]      ... % outputConnect, 1-by-numLayers Boolean vector
);

% View network structure
view(net);

% number of layer 1 neurons
net.layers{1}.size = 5;

% Layer 1 fun
net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin'; % DEFAULT
view(net);

% Configure network
% Input, output and layer sizes are set to 0.  
% These sizes will automatically be configured to 
% match particular data by TRAIN. Or the user can 
% manually configure inputs and outputs with 
% CONFIGURE.
net = configure(net,inputs,outputs);
inputweights = net.inputweights{1,1}
biases = net.biases{1}
view(net);


% Network traning
net.trainFcn = 'trainlm';   % DEFAULT
net.performFcn = 'mse';     % DEFAULT
EPOCHS = 9;
net.trainParam.epochs = EPOCHS;
net.trainParam.max_fail  =  EPOCHS;%
net = train(net,inputs,outputs);

% Testing
final_output = net([1 2; 3 4; 1 2; 3 5; 6 1;1 4])
