% Haldane Mortal com CO2



clear all
load ../data/sugar/v_2_2_u.mat
volume=volume/100;

% Parametros iniciais
pi=[ 3;
    8;
    1;
    1;
    1.1;
    0.2;
    1/8]

    
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

