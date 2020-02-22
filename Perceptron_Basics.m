%% Perceptron basic
clear;clc;
net = newp(...
[-2 2;-2 2],...  P  - RxQ matrix of Q1 representative input vectors.
[1],...  T  - SxQ matrix of Q2 representative target vectors.
'hardlim',... TF - Transfer function, default = 'hardlim'.
'learnp');   % LF - Learning function, default = 'learnp'.
view(net);
% inputweights = net.inputweights{1,1}
% biases = net.biases{1} 

% Reset W and b
net = init(net);  

net.IW{1,1} = [-1 1];
net.b{1} = [1];
view(net);  
% Testing
% Now let us see if the network responds to two 
% signals, one on each side of the perceptron boundary.
% p1 = [1;1]; % Expect 1
% net(p1)
% ans =
% 
%      1

% p2 = [1;-1]; % Expect 0
% net(p2)
% ans =
% 
%      0

% p3 = [[1;1] [1;-1]];
% net(p3)
% ans =
% 
%      1     0


