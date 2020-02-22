%%
% Mang noron tuyen tinh 1 noron
clear;clc;
P = {1 2 1 3 3 2};
T = {5 6 4 20 7 8};

% Khoi tao mang
% net = linearlayer([0:2]);
% net.inputs{1}.size = 1;
% net.layers{1}.dimensions = 1;
net = newlin(P,T,[0:2]);
net = init(net);
net.b{1};
net.IW{1};
% b=0 and IW = 0 because 
% net.biases{1}.initFcn = 'initzero'
% net.inputWeights{1}.initFcn = 'initzero'

% Luyen mang
net.trainFcn = 'trainlm';
net.biases{1}.learnFcn = 'learngdm';
net.inputWeights{1}.learnFcn = 'learngdm';
net.trainParam.epochs = 500;

net = train(net,P,T);
net(P)
%   Columns 1 through 4
% 
%     [6.1000]    [6.8000]    [1.7000]    [18.7000]
% 
%   Columns 5 through 6
% 
%     [7.1000]    [9.6000]

mse(net(P),T)
% ans =
% 
%    96.4333

%%
X = {1 2 1 3 3 2};
Xi = {1 3};
T = {5 6 4 20 7 8};
net2 = newlind(X,T,Xi);
% net.trainFcn = 'trainlm';
% net = train(net,X,T);
Y = net2(X,Xi)
% 2.7297  10.5405  5.0090  14.9550  10.7838  5.9820
mse(Y,T)

% ans =
% 
%    86.5616