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

u=@(t) [ t.^0              ;
        (square(t)+1)/2    ;
        (sin(t)+1)/2       ];

t0=0;
h=0.1;
N=300;

t1=t0:h:h*(N-1)
U=u(t1);  

[f]=bio_discretize_euler(fu,t0,h,U)
    
xi=[1
    1
    1
    0
    0];

[x1]=bio_discrete(f,xi,N);

[q]=g(x1);


figure(1)
plot(t1,x1,'-o')
title('Simple Simulation')
xlabel('time [seconds]')
ylabel('state')



figure(2)
hold on
plot(t1,q,'-or')
hold on
legend('q_m(t)')
title('Simple Simulation')
xlabel('time [seconds]')
ylabel('gas flow [liters/second]')






