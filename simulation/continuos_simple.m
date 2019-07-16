clear all
% Simulation example

load ../data/glicerina/dados3.mat
load ../data/glicerina/glicerina.mat
M=length(volume)

p=[ 2;
    8;
    .5;
    2;
    8;
    0;
    200]



t0=0
h=1/8

U=glicerina

f=bio_f_simple(p);
fd=bio_discretize_euler(f,t0,h,U'/30*8)

g=bio_g_simple(p);

xi=[0;0]


[x1]=bio_discrete(fd,xi,M);



[q]=g(x1);

figure(1)
plot(x1')

figure(2)
plot(q)
hold on
plot(volume,'r')
hold off

figure(3)
plot(U/30)

