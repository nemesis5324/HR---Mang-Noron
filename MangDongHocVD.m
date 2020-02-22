%%
clear;clc;
P = {0 0 1 1 1 1 0 0 0 0 0 0};
stem(cell2mat(P));

net = linearlayer;
net.inputs{1}.size = 1;
net.layers{1}.dimensions = 1;
net.biasConnect = 0;
net.IW{1,1} = 2;
a = sim(net,P);
stem(cell2mat(a))