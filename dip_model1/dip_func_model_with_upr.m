function [dTdNdLdt] = dip_func_model_with_upr(t, TNL)
global a  b c si f g h p m j k q r
U = dip_upr(TNL(1),TNL(2),TNL(3));
dTdt = a * TNL(1) * (1 - b * TNL(1)) - c*TNL(2)*TNL(1) - dip_D_func(TNL(1),TNL(3));
dNdt = si-f*TNL(2) + g * TNL(1)^2/(h + TNL(1)^2) * TNL(2) - p * TNL(2) * TNL(1) + U(1);
dLdt = - m * TNL(3) + j * dip_D_func(TNL(1),TNL(3))^2/(k + dip_D_func(TNL(1),TNL(3))^2) * TNL(2) - q * TNL(3) * TNL(1) + r * TNL(2) * TNL(1);
dTdNdLdt = [dTdt; dNdt; dLdt];
end
