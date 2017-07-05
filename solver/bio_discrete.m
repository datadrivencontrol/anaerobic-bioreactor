function [x]=bio_discrete(fd,xi,N,U)

x=xi;

for i=1:N-1
    x(:,i+1)=fd(x(:,i),i);
end

