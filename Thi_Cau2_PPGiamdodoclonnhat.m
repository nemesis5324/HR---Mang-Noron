%% PHUONG PGAP Giam do doc lon nhat
clear all; clf
anpha=0.7;
%anpha=0.15;
%anpha=0.19;
%anpha=0.205;
%X1=(-2:0.1:2);
%X2=(-2:0.1:2);

%h=ezcontour(f,[-5,5],50)
[X1,X2] = meshgrid(-10:.05:10);
X=[X1 ;X2];
%F =X'*A*X;
F=(X1-X2).^2 + X1.*X2 + X1 + X2 + 10;
% mesh(X1,X2,F) ; %axis([-2 2 -2 2 0 30]);
[c,h]= contour(X1,X2,F);
%get(h,'LevelList');
set(h,'LevelList',[ 1 2 4  8 12],'TextList',[ 1 2 4 8 12 ]);
hold on
% x10=1.5;x20=0.0; % cuc tieu toan cuc (0,55   -0,55)
x10=-2;x20=-2;% cuc tieu  cuc bo (-0,42   0,42)
% x10=0.75;  x20=0.75; % diem yen ngua  (-0,13 0,13)
% x10=-1;  x20=-0.75; % diem bat dau bat ky
x0=[x10;x20];
plot(x10,x20,'*');
hold on
g0=[2*x10 - x20 + 1
    2*x20 - x10 + 1];
A0=[2
    2];
p0=-g0; % cong thuc 9.59

for k=1:100
    xk=x0+anpha*p0;
    Xk(:,k)=xk;

    gk=[2*xk(1,1) - xk(2,1) + 1
        2*xk(2,1) - xk(1,1) + 1];

    pk=-gk;
    x0=xk;
    g0=gk;
    p0=pk;
end
plot([x10 Xk(1,:)],[x20 Xk(2,:)],'k','LineWidth',1);

% Xkmin = Xk(:,end);
% x1min = Xkmin(1,1);
% x2min = Xkmin(2,1);
% Fmin = (x1min-x2min)^2 + x1min*x2min +...
%         x1min + x2min + 10