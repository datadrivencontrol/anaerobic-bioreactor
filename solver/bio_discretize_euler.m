function [f]=bio_discretize_euler(fu,t0,h,U)


f=@(x,i) x+h*fu(x,t0+h*(i-1), U(:,i) )

