%% PHUONG PHAP Gradienlienhop
clear all; clf

% Xac dinh luoi 3D
[X1,X2] = meshgrid(-2:.05:2);
X=[X1 ;X2];
F=(X2-X1).^4+8*X1.*X2-X1+X2+3;
mesh(X1,X2,F) ; 
axis([-2 2 -2 2 0 30]);

% Xay dung cac duong dong muc
[c,h]= contour(X1,X2,F);
get(h,'LevelList');
set(h,'LevelList',[ 0.1 1 2 4  8 12],...
       'TextList',[ 0.1 1 2 4 8 12 ]);
hold on

% Diem bat dau
% x10=1.5;x20=0.0; % cuc tieu toan cuc (0,55   -0,55)
x10=-1.5;x20=0.0;% cuc tieu  cuc bo (-0,42   0,42)
% x10=0.75;  x20=0.75; % diem yen ngua  (-0,13 0,13)
x0=[x10;x20];
plot(x10,x20,'*');
hold on


g0=[4*x10^3-12*x10^2*x20+12*x10*x20^2-4*x20^3+8*x20-1;
    4*x20^3-12*x10*x20^2+12*x10^2*x20-4*x10^3+8*x10+1];

A0=[12*x10^2-24*x10*x20+12*x20^2   -12*x10^2+24*x10*x20-12*x20^2+8; 
    -12*x20^2+24*x10*x20-12*x10^2+8   12*x20^2-24*x10*x20+12*x10^2];

g = g0;
Ak = A0;
% Step 1: Chon huong tim kiem dau tien:
p0=-g0; % cong thuc 9.59 (Nguoc chieu Gradient)

% Step 2: Lua chon toc do hoc anpha:
anpha0=-(g0'*p0)./(p0'*A0*p0); %(Formule 9.31)

% Step 3: Lua chon huong tim kiem tiep theo:
for k=1:5
    % g0 p0 x0: Old (delayed) values
    % g p xk: New (Current) values
    
    xk = x0 + anpha0*p0; 
    Xk(:,k)=xk;
    g = [4*xk(1,1)^3-12*xk(1,1)^2*xk(2,1)+12*xk(1,1)*xk(2,1)^2-4*xk(2,1)^3+8*xk(2,1)-1;
         4*xk(2,1)^3-12*xk(1,1)*xk(2,1)^2+12*xk(1,1)^2*xk(2,1)-4*xk(1,1)^3+8*xk(1,1)+1];
    
    Ak = [12*xk(1,1)^2-24*xk(1,1)*xk(2,1)+12*xk(2,1)^2   -12*xk(1,1)^2+24*xk(1,1)*xk(2,1)-12*xk(2,1)^2+8; 
         -12*xk(2,1)^2+24*xk(1,1)*xk(2,1)-12*xk(1,1)^2+8   12*xk(2,1)^2-24*xk(1,1)*xk(2,1)+12*xk(1,1)^2];

    beta = (g'*g)/(g0'*g0);   % Fletcher - Revees
    
%     dg = g - g0;  % Hestenes - Steifel
%     beta = dg'*g/(dg'*p0);
%     
%     dg = g - g0; % Polak - Ribiere
%     beta = dg'*g/(g0'*g0);

    p = -g + beta*p0;
    anpha = -(g'*p)/(p'*Ak*p);
    
    x0 = xk;
    g0 = g;
    p0 = p;
    anpha0 = anpha;
end

% Plot the result:
plot([x10 Xk(1,:)],[x20 Xk(2,:)],'k','LineWidth',1);
