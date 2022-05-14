function [U] = dip_upr2(T,H,R)
global a5 a6 a7 a8 K 
global w1 upr_time upr_value upr_0 U_sum
U_pract = -(R - dip_fi2(T,H))/w1 - a5*R*(1 - R) + a6*H*R + a7*R - a8*R*T/(T + K) + dip_dfi2(T,H);
U_teor = U_pract;
if upr_0
  if (U_pract<0)
    U_pract=0;
  end
end
if upr_value>0
  if (U_pract>upr_value)
     U_pract=upr_value;
  end
end
if upr_time>0
  if ~isempty(U_sum)
    if U_sum(length(U_sum(:,1)),1) > upr_time
        U_pract = 0;
    end
  end
end
U = [U_pract; U_teor];
end

