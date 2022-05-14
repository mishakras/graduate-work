function [dfi] = dip_dfi2(T,H)
global a1 a2 a3 a4 w2 w3
dfi = (-(w3+w2)/(T^2*w2*w3*a2*H)+(-w3*a1+w3*w2*a4*H+w2*a1)/(w3*w2*a2*H))*(1 + a1*T*(1 - T) - H*T);
dfi = dfi + (-(1/w3 +1/T+a1-a1*T+w2*(1/(T*w3 )+(a1*T)/w3))/(w2*a2*H^2))*(a2*H*dip_fi2(T,H) - a3*H - a4*H*T);
end

