function [XC]=bio_ekf(f,g,F,H,xc,Q,R,P,u,z)
% [XC]=bio_ekf(f,g,F,H,xc,Q,R,P,u,z)

N=length(z);
M=length(xc);

XC=[];

for i=1:N
    
    y=z(i)-g(xc,i);
    HH=H(xc,i);
    S=HH*P*HH'+R;
    K=P*HH'*inv(S);
    xc=xc+K*y;
    P=(eye(M)-K*HH)*P;
    XC=[XC xc];
    
    
    xc=f(xc,i,u(:,i));
    FF=F(xc,i,u(:,i));
    P=FF*P*FF'+Q;

end


