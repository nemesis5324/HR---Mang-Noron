%% Phuong phap toi thieu hoa doc theo duong tuyen tinh tung doan
clear all; clf
A=[2 1;1 2]; % Ma tran Hessian
b=[0 0];
c=0;

[X1,X2] = meshgrid(-1:.01:1);% Xac dinh luoi do thi
% ham bac 2, cong thuc 9.33
F=(1/2)*(A(1,1)*X1.^2+A(1,2)*X1.*X2+A(2,1)*X2.*X1+A(2,2)*X2.^2);
mesh(X1,X2,F);
[c,h]= contour(X1,X2,F); % Ve cac duong dong muc
%get(h,'LevelList')
set(h,'LevelList',[0 0.001 0.005 0.025 0.11 0.5 ],...
       'TextList',[0 0.001 0.005 0.025 0.11 0.5 ]) %
% dat cac duong dong muc
% get(h,'ColorOrder')
% set(h,'Color','k')
%contour(Z,7);%axis([-2 2 -2 2 ]);

%ezcontour(F)
%f=@(X1,X2) (1/2)*(A(1,1)*X1.^2.+A(2,2)*X2.^2);
%ezcontour(f,[-1 1])



% Plot the initial point
hold on
x10=0.8; % Gia tri x1 ban dau, truc hoanh
x20=-0.25;% Gia tri x2 ban dau, truc tung
x0=[x10;x20];% Vec to gia tri ban dau
F0=(1/2)*x0'*A*x0; % gia tri ham F tai x0 ban dau
plot(x10,x20,'*');% Ve toa do Vec to gia tri ban dau

hold on
df0=[2*x10+x20;x10+2*x20];% Dao ham toa do ban dau
g0=df0;% Gradoien toa do ban dau
p0=-df0;%  huong suc sao doi voi toa do ban dau, (9.36)
anpha0 =-((g0'*p0)/(p0'*A*p0)); %Gia trij an pha ban dau  (9.31)

for k=1:10;
    xk=x0-anpha0*g0; %  (9.38)
    dfk=[2*xk(1,1)+xk(2,1);xk(1,1)+2*xk(2,1)];% Dao ham cac buoc tinh
    dFk(:,k)=dfk;    % Save dfk
    gk=dfk;
    pk=-dfk;
    anphak=-((gk'*pk)/(pk'*A*pk));  % anpha in step k
    ANPHA(k)=anphak; % Save anpha
    Xk(:,k)=xk;      % Save x
    x0=xk;
    anpha0=anphak;
    g0=gk;
end
plot([x10 Xk(1,:)],[x20 Xk(2,:)],'k','LineWidth',2); grid on
