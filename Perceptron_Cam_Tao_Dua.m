%% Perceptron , cam tao dua
clear;clc;

% Dau vao
% Tron:1   Meo:-1
% Nhan:1   Xu xi:-1
% Nang:1   Nhe:-1
p_cam = [1;-1;-1];       % Tron, xu xi, nhe
p_tao = [1;1;-1];        % Tron, Nhan, nhe
p_dua = [1;1;1];         % Tron, nhan, nang
p = [p_cam p_tao p_dua]; % To hop dau vao

% Dau ra (Target)
t_cam = [1;0;0];
t_tao = [0;1;0];
t_dua = [0;0;1];
t = [t_cam t_tao t_dua];

% Khoi tao mang Perceptron
net = newp(p,t);
view(net);
net.IW{1,1} = [  1   0.5   -0.5
               0.5    -1   -0.5
                -1   0.5     -1];
% net.IW{1,1} = rand(3);
net.b{1} = [0.5;-0.5;0.5];
% net.b{1} = rand(3,1);
net.trainParam.epochs = 10;
net = train(net,p,t);
p_cam2 = [0.8;-0.7;-0.7];
p_tao2 = [0.7;0.8;-0.7];
p_dua2 = [0.7;0.7;0.7];
net([p_cam2 p_tao2 p_dua2])
% ans =
% 
%      1     0     0
%      0     1     0
%      0     0     1

