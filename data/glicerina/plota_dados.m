load('dados1.mat')
v1=volume;
load('dados2.mat')
v2=volume;
load('dados3.mat')
v3=volume;
load('glicerina.mat')
g=glicerina;

N=length(g);

figure(1)
stairs(v1)
hold on
stairs(g*30)
hold off

figure(2)
stairs(v2)
hold on
stairs(g*30)
hold off

figure(3)
stairs(v3)
hold on
stairs(g*30)
hold off


figure(11)
T=cumsum(v1);
T=T-T(203);
Tm=max(T);
stairs(T)
hold on
stairs(g*300)
plot([1 N],[Tm Tm])
plot([1 N],[Tm Tm]/12*1)
plot([1 N],[Tm Tm]/12*2)
plot([1 N],[Tm Tm]/12*3)
plot([1 N],[Tm Tm]/12*5)
plot([1 N],[Tm Tm]/12*8)
hold off

figure(12)
T=cumsum(v2);
T=T-T(203);
Tm=max(T);
stairs(T)
hold on
stairs(g*300)
plot([1 N],[Tm Tm])
plot([1 N],[Tm Tm]/12*1)
plot([1 N],[Tm Tm]/12*2)
plot([1 N],[Tm Tm]/12*3)
plot([1 N],[Tm Tm]/12*5)
plot([1 N],[Tm Tm]/12*8)
hold off

figure(13)
T=cumsum(v3);
T=T-T(203);
Tm=max(T);
stairs(T)
hold on
stairs(g*300)
plot([1 N],[Tm Tm])
plot([1 N],[Tm Tm]/12*1)
plot([1 N],[Tm Tm]/12*2)
plot([1 N],[Tm Tm]/12*3)
plot([1 N],[Tm Tm]/12*5)
plot([1 N],[Tm Tm]/12*8)
hold off


