function [x,t]=bio_runge_4(f,ti,xi,h,N)
%[x,t]=bio_runge_4(f,ti,xi,h,N)

% Time vector
t=(ti:h:ti+(sum(N)-1)*h);

% Reduce last N to ensure t has same dimension that x
N(end)=N(end)-1;

x=zeros(size(xi,1),1);

i=1;
for j=1:length(N)

    % Add value to states
    x(:,i)=x(:,i)+xi(:,j);

    for k=1:N(j)
        k1=f(x(:,i),t(i));
        k2=f(x(:,i)+h*k1/2,t(i)+h/2);
        k3=f(x(:,i)+h*k2/2,t(i)+h/2);
        k4=f(x(:,i)+h*k3,t(i)+h);
        x(:,i+1)=x(:,i)+h/6*(k1+2*k2+2*k3+k4);
        i=i+1;
    end
    
end
