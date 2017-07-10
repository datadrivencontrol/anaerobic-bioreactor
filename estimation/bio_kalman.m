function [XC]=bio_kalman(F,B,H,xc,Q,R,P,u,z)

N=length(z);
M=length(xc);

XC=[];

for i=1:N
    y=z(i)-H*xc;
    S=H*P*H'+R;
    K=P*H'*inv(S);
    xc=xc+K*y;
    P=(eye(M)-K*H)*P;
    XC=[XC xc];
    xc=F*xc+B*u(:,i);
    P=F*P*F'+Q;

end

