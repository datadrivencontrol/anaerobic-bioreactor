function [q,x1] = semibat_gas(p)

fu=bio_f(p);
g=bio_g(p);

u=@(t) [0;
        0;
        0];
    
f=@(x,t) fu(x,t, u(t) );

ti=0;
h=1/4;

N =[ 28 28 28 28 28 ];
xi=[ 1  0  0  0  0   ; 
     1  0  0  0  0   ;
     1  1  1  1  1   ;
     0  0  0  0  0   ;
     0  0  0  0  0  ];

[x1,t1]=bio_runge_4(f,ti,xi,h,N);

[q]=g(x1);
