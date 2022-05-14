function [fi] = dip_fi2(T,H)
global a1 a2 a3 a4 w2 w3
fi = -1/(w2*a2) + (a3 + a4*T)/a2;
fi = fi + (1/w3 + 1/T + a1 - a1*T + w2*(1/(T*w3 ) + (a1*T)/w3 ))/(w2*a2*H);
end

