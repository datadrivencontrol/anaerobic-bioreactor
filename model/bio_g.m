function [g]=bio_g(p)
% Diferential Equations
%
% x1'(t) = ( v1(S1(t)) - p7 * D(t) - p8 ) * x1(t)
% x2'(t) = ( v2(S2(t)) - p7 * D(t) - p9 ) * x2(t)
% S1'(t) = D(t) * ( S1in(t) - S1(t) ) - p10 * v1(S1(t)) * x1(t)
% S2'(t) = D(t) * ( S2in(t) - S2(t) ) + p11 * v1(S1(t)) * x1(t) - p12* v2(S2(t)) * x2(t)
% C'(t)  = p14 * v1(S1(t)) * x(1) + p16 * v2(S2(t)) * x(2) - p15 * C(t)
%
% v1(S1(t)) =        p1 * x(3)
%             -----------------------
%             p2 + x(3) + p3 * x(3)^2
%
% v2(S1(t)) =        p4 * x(4)
%             -----------------------
%             p5 + x(4) + p6 * x(4)^2
%
% Gas flow (CH4 e CO2)
%
% qm(t) = p13 * v2(S2(t)) * x2(t) + p15 * C(t)

v1=@(S1) p(1)*S1/(p(2)+S1+p(3)*S1^2);

v2=@(S2) p(4)*S2/(p(5)+S2+p(6)*S2^2);

g=@(x,t) [p(13)*v2(x(3))*x(2)+p(15)*x(5)];
