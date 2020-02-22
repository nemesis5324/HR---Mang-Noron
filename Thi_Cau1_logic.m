%% Perceptron , cam tao dua
clear;clc;

% Dau vao
% Tron:1   Meo:-1
% Nhan:1   Xu xi:-1
% Nang:1   Nhe:-1
% p_cam = [1;-1;-1];       % Tron, xu xi, nhe
% p_tao = [1;1;-1];        % Tron, Nhan, nhe
% p_dua = [1;1;1];         % Tron, nhan, nang
% p = [p_cam p_tao p_dua]; % To hop dau vao

p1 = [0;0;0];
p2 = [0;0;1];
p3 = [0;1;0];
p4 = [0;1;1];
p5 = [1;0;0];
p6 = [1;0;1];
p7 = [1;1;0];
p8 = [1;1;1];
p = [p1 p2 p3 p4 p5 p6 p7 p8];

% Dau ra (Target)
% t_cam = [1;0;0];
% t_tao = [0;1;0];
% t_dua = [0;0;1];
% t = [t_cam t_tao t_dua];

t1 = [1;0;0;0;0;0;0;0];
t2 = [0;1;0;0;0;0;0;0];
t3 = [0;0;1;0;0;0;0;0];
t4 = [0;0;0;1;0;0;0;0];
t5 = [0;0;0;0;1;0;0;0];
t6 = [0;0;0;0;0;1;0;0];
t7 = [0;0;0;0;0;0;1;0];
t8 = [0;0;0;0;0;0;0;1];
t = [t1 t2 t3 t4 t5 t6 t7 t8];
% Khoi tao mang Perceptron
net = newp(p,t);
view(net);
% net.IW{1,1} = [  1   0.5   -0.5
%                0.5    -1   -0.5
%                 -1   0.5     -1];
net.IW{1,1} = rand(8,3);
% net.b{1} = [0.5;-0.5;0.5];
net.b{1} = rand(8,1);
% net.b{1} = rand(3,1);
net.trainParam.epochs = 10;
net = train(net,p,t);
% p_cam2 = [0.8;-0.7;-0.7];
% p_tao2 = [0.7;0.8;-0.7];
% p_dua2 = [0.7;0.7;0.7];
% net([p_cam2 p_tao2 p_dua2])
% ans =
% 
%      1     0     0
%      0     1     0
tout = sim(net,p)