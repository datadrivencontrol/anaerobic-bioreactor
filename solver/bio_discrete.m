function [x,t]=bio_discrete(fd,xi,N,U)

t=1:N;
x=xi;

for i=1:N-1
    x(:,i+1)=fd(x(:,i),i);
end

