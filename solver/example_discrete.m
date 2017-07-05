% Simple Bioreactor Simulation
%
% x'(t)=x(t)*S(t)
% S'(t)=-x(t)*S(t)
%
% x(0)=1.2
% S(0)=0.8

h=0.1;
f=@(x,i) [x(1)+h*x(1)*x(2);x(2)-h*x(1)*x(2)]

xi=[1.2;0.8];
N=50;

[x1,t1]=bio_discrete(f,xi,N)

figure(1)
plot(t1,x1,'-ob')
title('Simple Bioreactor Simulation')
xlabel('time [samples]')
ylabel('state')


