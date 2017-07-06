function [XC]=bio_kalman(F,B,H,xc,Q,R,P,u,z)

N=length(z);
XC=[xc];

for i=1:(N)
    %a posteriori
    y=z(i)-H*xc;
    S=H*P*H'+R;
    K=P*H'*inv(S);
    xc=xc+K*y;
    P=(eye(2)-K*H)*P;
    XC=[XC xc];
    %a priori
    xc=F*xc+B*u(:,i);
    P=F*P*F'+Q;
end
XC=XC(:,2:end); %estimativa a posteriori
end
