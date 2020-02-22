%% GIAM DO DOC LON NHAT, TOC DO HOC ON DINH. VI DU MUC 9.1
clear all; clf
A=[2 0;0 10];% ma tran Hessian

% Phiem ham bac 2 co dang
% F(x) = 1/2*x'*A*x + d'*x + c
d=[0 ;0];
c=0;


% THay doi toc do hoc alpha
% anpha=0.05;
anpha=0.15;
% anpha=0.195;
% anpha=0.205;
%X1=(-2:0.1:2);
%X2=(-2:0.1:2);
%X=[X1 ;X2];

%F =X'* A *X;
%ezcontour(F)
%f=@(X1,X2) A(1,1)*X1.^2.+A(2,2)*X2.^2;
%h=ezcontour(f,[-5,5],50)

% Tinh phiem ham chat luong bac 2
[X1,X2] = meshgrid(-4:.05:4);
X=[X1 ;X2];
%F =X'*A*X;
Z=X1.^2+5*X2.^2;
mesh(X1,X2,Z);
title('F = X1^2 + 5*X2^2');

% Tinh phiem ham chat luong bac 2
% theo dang ma tran
F=1/2*((A(1,1)*X1.^2+A(2,2)*X2.^2));
% Symbolic method to calculate F(x)
% syms x1 x2;
% Xsym = [x1
%         x2];
% Asym = sym(A);
% Fsym = 1/2*Xsym.'*Asym*Xsym;


[c,h]= contour(X1,X2,F);
get(h,'LevelList');
set(h,'LevelList',[0 0.2 2 10 30 60 120 150],...
       'TextList',[0 0.2 2 10 30 60 120 150 ]);
hold on

% Plot The initial point
x10=3;
x20=3;
x0=[x10;x20];
plot(x10,x20,'*r');

hold on
for k=1:25;
    xk=(eye(2)-anpha*A)*x0 -anpha*d; % Formule 9.21
    Xk(:,k)=xk; % Save point to Xk
    x0=xk;      % Set current point for the next step
end
plot([x10 Xk(1,:)],[x20 Xk(2,:)],...
    'k','LineWidth',1);
