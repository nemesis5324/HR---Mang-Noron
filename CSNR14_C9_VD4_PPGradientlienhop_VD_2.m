% PHUONG PGAP Gradienlienhop
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
 F=X1.^2+X1.*X2+X2.^2;
 mesh(X1,X2,F) ; axis([-2 2 -2 2 0 30]);
 axis([-2 2 -2 2 0 20]);
[c,h]= contour(X1,X2,F);
%get(h,'LevelList');
 set(h,'LevelList',[ 1 2 4  8 12],'TextList',[ 1 2 4 8 12 ]);
 hold on
      
       x10=80;
       
 x20=-25;

 x0=[x10;x20];
 plot(x10,x20,'*');
  hold on
  g0=[2*x10+x20;  2*x20+x10];
  A0=[ 2   1  ; 1  2 ];
p0=-g0; % cong thuc 9.59
anpha0=-(g0'*p0)./(p0'*A0*p0);
for i=1:1
    
    x=x0+anpha0*p0;
    g=[2*x(1,1)+x(2,1); 2*x(2,1)+x(1,1)]
      beta=(g'*g)/(g0'*g0);
      p=-g+beta*p0;
      anpha=-(g'*p)/(p'*A0*p);
     x0=x;
      g0=g;
    p0=p
      anpha0=anpha;
end
plot([x10 x(1)],[x20 x(2)],'k','LineWidth',2);grid on
