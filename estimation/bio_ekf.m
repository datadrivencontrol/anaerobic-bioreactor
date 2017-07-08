function [XC]=bio_ekf(f,g,F,H,xc,Q,R,P,u,z)
% [XC]=bio_ekf(f,g,F,H,xc,Q,R,P,u,z)

N=length(z);
XC=[xc];

for i=1:(N-1)
    
    FF=F(xc,i,u(:,i))
    
    xc=f(xc,i,u(:,i));
    
    HH=H(xc,i)

    
    P=FF*P*FF'+Q;
    y=z(i+1)-g(xc,i);
    S=HH*P*HH'+R;
    K=P*HH'*inv(S);
    xc=xc+K*y;
    P=(eye(2)-K*HH)*P;
    XC=[XC xc];
end


