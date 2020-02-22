%% newff example
clear;clc;
net=newff(...
[-1 2; 0 5],...RxQ1 matrix of Q1 representative R-element input
[3 1],...SNxQ2 matrix of Q2 representative SN-element target vectors.
{'tansig','purelin'},...Transfer function of ith layer
'traincgf');% training function, default = 'trainlm'

view(net);
p = [1;2];
net(p)

p = [1 3 2;2 4 1];
net(p)
% Calculate net([1;2]) and net([3;4]) and net([2;1])

% TRAINING
% Giam do doc Gradient 
% traingd
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.lr_inc = 1.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];
net=train(net,p,t);
net(p)
% ans =
% 
%    -0.9956   -1.0008    0.9957    1.0001


% Conjugate Gradient Algorithms
% Fletcher-Reeves Update (TRAINCGF)
net.trainParam.show = 5;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];
net=train(net,p,t);
% ans =
% 
%    -1.0003   -1.0010    1.0007    1.0012