clear all

% Simple Bioreactor Simulation
%
% x'(t)=x(t)*S(t)
% S'(t)=-x(t)*S(t)+u(t)
%
% x(0)=1.2
% S(0)=0.8

h=0.1;
f=@(x,i,u) [x(1)+h*x(1)*x(2);x(2)-h*x(1)*x(2)+u];
g=@(x,i)   [x(1,:)-x(2,:)];

F=@(x,i,u) [    1+h*x(2)    h*x(1);
                -h*x(2)     1-h*x(2)];
H=@(x,i)   [    1           -1];


xi=[1.2;0.8];
N=500;

t1=1:N;

Q=0.01*eye(2,2);
R=0.01*eye(1,1);
P=1*eye(2,2);

u=0.01*(-square(t1/50)+1);
w=sqrt(Q)*randn(2,N);
v=sqrt(R)*randn(1,N);


fu=@(x,i) f(x,i,u(i));


[x1]=bio_discrete(fu,xi,N);
[y1]=g(x1,0)+v;

[xc]=bio_ekf(f,g,F,H,xi,Q,R,P,u,y1);

% Figures
figure(1)
plot(x1','o-')
hold all
plot(xc','o-')
hold off
legend('True x_1','True x_2','Estimated x_1','Estimated x_2')
xlabel('samples')
ylabel('state')

figure(2)
plot(y1,'o-')
xlabel('output')
