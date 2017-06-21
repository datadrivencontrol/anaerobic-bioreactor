function [x,t]=bio_runge_4(f,ti,xi,h,N)
%[x,t]=bio_runge_4(f,ti,xi,h,N)

t=(ti:h:ti+(N-1)*h);
x=xi;
for i=1:N-1
    k1=f(x(:,i),t(i));
    k2=f(x(:,i)+h*k1/2,t(i)+h/2);
    k3=f(x(:,i)+h*k2/2,t(i)+h/2);
    k4=f(x(:,i)+h*k3,t(i)+h);
    x(:,i+1)=x(:,i)+h/6*(k1+2*k2+2*k3+k4);
end
