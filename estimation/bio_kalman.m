function [XC]=bio_kalman(F,B,H,xc,Q,R,P,u,z)

N=length(z);
XC=[xc];

for i=1:(N-1)
    xc=F*xc+B*u(:,i);
    P=F*P*F'+Q;
    y=z(i+1)-H*xc
    S=H*P*H'+R;
    K=P*H'*inv(S);
    xc=xc+K*y;
    P=(eye(2)-K*H)*P;
    XC=[XC xc];
end

