%% PHUONG PGAP NIUTON
clear all; clf
%anpha=0.05;
%anpha=0.15;
%anpha=0.19;
%anpha=0.205;
%X1=(-2:0.1:2);
%X2=(-2:0.1:2);
%X=[X1 ;X2];

%F =X'* A *X;
%ezcontour(F)
%f=@(X1,X2) A(1,1)*X1.^2.+A(2,2)*X2.^2;

%h=ezcontour(f,[-5,5],50)
[X1,X2] = meshgrid(-2:.05:2);
X=[X1 ;X2];
%F =X'*A*X;
F=(X2-X1).^4+8*X1.*X2-X1+X2+3;
%mesh(X1,X2,F) ; axis([-2 2 -2 2 0 30]);
[c,h]= contour(X1,X2,F);
get(h,'LevelList');
set(h,'LevelList',[ 0.1 1 2 4  8 12],'TextList',[ 0.1 1 2 4 8 12 ]);
hold on
% x10=1.5;x20=0.0; % cuc tieu toan cuc (0,55   -0,55)
% x10=-1.5;x20=0.0;% cuc tieu  cuc bo (-0,42   0,42)
x10=0.75;  x20=0.75; % diem yen ngua  (-0,13 0,13)
x0=[x10;x20];
plot(x10,x20,'*r');
hold on
g0=[4*x10^3-12*x10^2*x20+12*x10*x20^2-4*x20^3+8*x20-1;  
    4*x20^3-12*x10*x20^2+12*x10^2*x20-4*x10^3+8*x10+1];
A0=[12*x10^2-24*x10*x20+12*x20^2   -12*x10^2+24*x10*x20-12*x20^2+8; 
    -12*x20^2+24*x10*x20-12*x10^2+8   12*x20^2-24*x10*x20+12*x10^2];
gk = g0;
Ak = A0;
for k=1:10
    xk=x0-(inv(Ak)*gk);
    Xk(:,k)=xk;
    Ak = [12*xk(1,1)^2-24*xk(1,1)*xk(2,1)+12*xk(2,1)^2   -12*xk(1,1)^2+24*xk(1,1)*xk(2,1)-12*xk(2,1)^2+8; 
          -12*xk(2,1)^2+24*xk(1,1)*xk(2,1)-12*xk(1,1)^2+8   12*xk(2,1)^2-24*xk(1,1)*xk(2,1)+12*xk(1,1)^2];
    gk = [4*xk(1,1)^3-12*xk(1,1)^2*xk(2,1)+12*xk(1,1)*xk(2,1)^2-4*xk(2,1)^3+8*xk(2,1)-1;
         4*xk(2,1)^3-12*xk(1,1)*xk(2,1)^2+12*xk(1,1)^2*xk(2,1)-4*xk(1,1)^3+8*xk(1,1)+1];
    x0=xk;
end

% Plot the result:
plot([x10 Xk(1,:)],[x20 Xk(2,:)],'k','LineWidth',1);
