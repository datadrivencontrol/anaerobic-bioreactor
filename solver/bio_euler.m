function [x,t]=bio_euler(f,ti,xi,h,N)
%[x,t]=bio_euler(f,ti,xi,h,N)
t=(ti:h:ti+(N-1)*h);
x=xi;
for i=1:N-1
    k1=f(x(:,i),t(i));
    x(:,i+1)=x(:,i)+h*k1;
end

