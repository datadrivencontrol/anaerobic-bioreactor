clear all
% Simulation example

p = [ 2.7421        %m1     p(1)
      257.1719      %ks1    p(2)
      0             %ki1    p(3)
      37.3437       %m2     p(3)
      455.1594      %ks2    p(4)
      0             %ki2    p(6)
      0             %alfa   p(7)
      0.0029        %c1     p(8)
      0.0015        %c2     p(9)
      32.2385       %k1     p(10)
      28.3060       %k2     p(11)
      100           %k3     p(12)
      141.9851      %k6     p(13)
      3.9325        %k7     p(14)
      10.7070       %p15    p(15)
      200       ];  %p16    p(16)  

fu=bio_f(p);
g=bio_g(p);

h=1/40;
  
U=[.1 200 0]';
L=zeros(1,280);
L(1)=1;
U=U*[L L L L L];
N=35*40;

Q=0.0000001*eye(5,5);
R=0.1*eye(1,1);
P=0.00001*eye(5,5);

xi = [1 1 0 0 0]';
t0=0;

[f]=bio_discretize_euler(fu,t0,h,U);
[x1]=bio_discrete(f,xi,N);

v=sqrt(R)*randn(1,N);
[y1]=g(x1)+v;


fd=@(x,i,u) x+h*fu(x,h*(i-1),u);
gd=@(x,i) g(x);

[xc,xcma,xcmi]=bio_pf(fd,gd,xi,Q,R,P,U,y1,100);
[yc]=g(xc);

figure(1)
plot(x1','o-')
hold all
plot(xc','o-')
plot(xcma','k-')
plot(xcmi','k-')
hold off
legend('True x_1','True x_2','True x_3','True x_4','True x_5','Estimated x_1','Estimated x_2','Estimated x_3','Estimated x_4','Estimated x_5')
xlabel('samples')
ylabel('state')

figure(2)
plot(y1,'o-')
hold all
plot(yc','o-')
legend('output real','output estimated')




