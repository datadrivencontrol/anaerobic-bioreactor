clear all

N=1000;
t=1:N;

% System
F=[ 0.9     0.4;
    -0.4    0.9];

B=[ 1   ;
    0   ];

H=[ 1   1];

u=square(t/20);

xi=[1;1];


% Noise

Q=0.001*eye(2,2);
R=0.001*eye(1,1);
P=1*eye(2,2);

w=sqrt(Q)*randn(2,N);
v=sqrt(R)*randn(1,N);


% Simulation
f=@(x,i) F*x  + B*u(i) + w(:,i);
[x]=bio_discrete(f,xi,N);
y=H*x+v;


% Estimation
[xc]=bio_kalman(F,B,H,xi,Q,R,P,u,y);



% Figures
figure(1)
plot(x','o-')
hold all
plot(xc','o-')
hold off
legend('True x_1','True x_2','Estimated x_1','Estimated x_2')
xlabel('samples')
ylabel('state')

figure(2)
plot(y,'o-')
xlabel('output')
