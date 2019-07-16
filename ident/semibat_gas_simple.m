function [q,x1] = semibat_gas_simple(p)

f=bio_f_simple(p);
g=bio_g_simple(p);


    

ti=0;
h=1/8;

N =[ 28 28 28 28 28 ];
xi=[ 1  1  1  1  1   ;
     0  0  0  0  0  ];

[x1,t1]=bio_runge_4(f,ti,xi,h,N);

[q]=g(x1);

figure(1)
plot(x1')
hold on
plot(q)
hold off