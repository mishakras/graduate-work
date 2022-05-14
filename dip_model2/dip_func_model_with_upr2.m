function [dTdHdRdt] = dip_func_model_with_upr2(t, THR)
global a1 a2 a3 a4 a5 a6 a7 a8 K
U=dip_upr2(THR(1),THR(2),THR(3));
dTdt = 1 + a1 * THR(1) * (1 -  THR(1)) - THR(2)*THR(1);
dHdt = a2*THR(2)*THR(3) - a3 * THR(2) - a4 * THR(2) * THR(1);
dRdt = a5 * THR(3) * (1 -  THR(3))-a6*THR(2)*THR(3) - a7*THR(3)+a8*THR(1)*THR(3)/(THR(1)+K) + U(1);
dTdHdRdt = [dTdt; dHdt; dRdt];
end

