%% newlind example
clear;clc;
P = {1 2 1 3 3 2};
Pi = {1 3};
T = {5 6 4 6 7 8};
net = newlind(P,T,Pi);
Y = sim(net,P,Pi)