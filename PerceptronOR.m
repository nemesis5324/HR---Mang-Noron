%% Perceptron simple fitting OR
clear;clc;
x = [0 0 1 1; 0 1 0 1];
t = [0 1 1 1];
net = perceptron;
net = train(net,x,t);
view(net)
y = net(x);

% Testing
net([1 1 0 1; 
     0 1 0 1]);
% ans =
% 
%      1     1     0     1