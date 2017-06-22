function [x,t]=bio_euler(f,ti,xi,h,N)
%[x,t]=bio_euler(f,ti,xi,h,N)

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
        x(:,i+1)=x(:,i)+h*k1;
        i=i+1;
    end
    
end
