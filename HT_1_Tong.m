[x,y] = meshgrid(-5:.1:10, -5:.1:10);
ma1=trapmf(y,[-3 0 3 6]);
mb1=gaussmf(x,[1.5 4]);
ztong= mb1 + ma1 -ma1.*mb1;
figure
surf(x,y,ma1)
figure
surf(x,y,mb1)
figure
surf(x,y,ztong)
