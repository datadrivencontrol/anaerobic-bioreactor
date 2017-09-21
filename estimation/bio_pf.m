function [XC,XCma,XCmi]=bio_pf(f,g,xc,Q,R,P,u,z,L)
%[XC,,XCma,XCmi]=bio_pf(f,g,xc,Q,R,P,u,z,L)

N=length(z);
M=length(xc);

XC=[xc];

%Cria particulas iniciais
x_P = repmat(xc,1,L) + chol(P)'*randn(M,L);

xcma = max(x_P')';
xcmi = min(x_P')';
XCma = [xcma];
XCmi = [xcmi];


for i=1:N-1
    
    %Predi??o
    for j = 1:L
        x_P_update(:,j) = f(x_P(:,j),i,u(:,i))+chol(Q)'*randn(M,1);
        z_update(j) = g(x_P_update(:,j),i);
        P_w(j) = exp(-(z(i+1) - z_update(j))'*inv(R)*(z(i+1) - z_update(j))/2);
    end
    
    %Normaliza
    P_w = P_w./sum(P_w);

    %Reamostra
    for j=1:L
        x_P(:,j) = x_P_update(:,find(rand <= cumsum(P_w),1));
    end
    
    %Calcula estat?sticas
    xc = mean(x_P')';
    xcma = max(x_P')';
    xcmi = min(x_P')';

    %Salva dados
    XC = [XC xc];
    XCma = [XCma xcma];
    XCmi = [XCmi xcmi];

end

