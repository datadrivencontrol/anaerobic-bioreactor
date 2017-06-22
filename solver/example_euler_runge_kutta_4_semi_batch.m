% Simple Bioreactor Simulation
%
% x'(t)=x(t)*S(t)
% S'(t)=-x(t)*S(t)
%
% x(0)=1.2
% S(0)=0.8

clear all

f=@(x,y) [x(1)*x(2);-x(1)*x(2)];

ti=0;
xi=[1.2 0 0;
    0.8 1 1];
h=0.1;
N=[20 20 20];

[x1,t1]=bio_euler(f,ti,xi,h,N)
[x2,t2]=bio_runge_4(f,ti,xi,h,N)

figure(1)
plot(t1,x1,'-ob')
hold on
plot(t2,x2,'-or')
hold off
legend('Euler x(t)','Euler S(t)','Runge-Kutta 4 x(t)','Runge-Kutta 4 S(t)','Location','NorthWest')
title('Simple Bioreactor Simulation')
xlabel('time [seconds]')
ylabel('state')


