%% Dynamic network example
clear;clc;
p = {0 0 1 1 1 1 0 0 0 0 0 0};
figure;
stem(cell2mat(p));
title('Dau vao');

% Mang tinh (static network)
% Dau ra = Dau vao*2 (b=0, W=2);
net = linearlayer;
net.inputs{1}.size = 1; % 1 noron
net.layers{1}.dimensions=[1];
net.biasConnect = 0;
net.IW{1,1} = 2;
a = sim(net,p);
figure;
stem(cell2mat(a));
title('Static network');

% Mang dong hoc truyen thang khong hoi quy
% giu cham 1 buoc tai dau vao
net = linearlayer([0:2]);
net.inputs{1}.size = 1; % 1 noron
net.layers{1}.dimensions=[1];
% net.biasConnect = 0;
net.b{1}=0;
net.IW{1,1} = [1 1 1];
a = sim(net,p);
figure;
stem(cell2mat(a));
title('Giu cham');

