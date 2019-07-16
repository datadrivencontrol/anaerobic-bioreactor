% Haldane Mortal com CO2

clear all
load ../data/sugar/v_2_2_u.mat
volume=volume/100;

% Parametros iniciais
pi = [2.7421        %m1     p(1)
      257.1719      %ks1    p(2)
      0             %ki1    p(3)
      37.3437       %m2     p(3)
      455.1594      %ks2    p(4)
      0             %ki2    p(6)
      %0            %alfa   p(7)
      0.0029        %c1     p(8)
      0.0015        %c2     p(9)
      32.2385       %k1     p(10)
      28.3060       %k2     p(11)
      %100          %k3     p(12)
      141.9851      %k6     p(13)
      3.9325        %k7     p(14)
      10.7070       %p15    p(15)
      200       ];  %p16    p(16) 

p14=@(p) [p(1) p(2) p(3) p(4) p(5) p(6) 0 p(7) p(8) p(9) p(10) 100 p(11) p(12) p(13) p(14)];   
    
% Otimiza
J=@(p) semibat_gas(p14(p))-volume;
pf = lsqnonlin(J,pi);

% Simula inicial e final
[qi,yi]=semibat_gas(p14(pi));
[qf,yf]=semibat_gas(p14(pf));


% Graficos
figure(1)
plot(volume,'-bo')
hold on
plot(qi,'-go')
plot(qf,'-ro')
hold off
xlabel ('tempo [amostras]')
ylabel ('Volume total [Litros]')
legend ('dados do experimento','modelo inicial','modelo final')

figure(2)
plot(yi')
hold all
plot(yf')

xlabel ('tempo [amostras]')

