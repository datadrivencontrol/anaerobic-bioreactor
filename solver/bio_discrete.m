function [x]=bio_discrete(fd,xi,N)
%[x]=bio_discrete(fd,xi,N)

x=xi;

for i=1:N-1
    x(:,i+1)=fd(x(:,i),i);
end

