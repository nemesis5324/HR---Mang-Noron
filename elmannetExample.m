%%
clear;clc;

% Example 1
% [X,T] = simpleseries_dataset;
% net = elmannet(1:2,10);
% [Xs,Xi,Ai,Ts] = preparets(net,X,T);
% net = train(net,Xs,Ts,Xi,Ai);
% view(net)
% Y = net(Xs,Xi,Ai);
% perf = perform(net,Ts,Y)

% Example 2
net = elmannet([1 2],[5],'trainlm');
net.inputs{1}.range = [0 1];
net.outputs{2}.range = [0 1];
view(net);
P = round(rand(1,8));
Pseq = con2seq(P);
Y = sim(net,Pseq);
Z = seq2con(Y);

T = [0 (P(1:end-1)+P(2:end) == 2)];
Tseq = con2seq(T);
net = train(net,Pseq,Tseq); 
Y = sim(net,Pseq);
z = seq2con(Y);
z{1,1}
diff1 = T - z{1,1};