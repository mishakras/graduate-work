function [U] = dip_upr(T, N , L)
global si f g h p w1 U_sum
global upr_time upr_value upr_0
U_pract = -(N- dip_fi(T,L))/w1-si+f*N-(g*T^2*N)/(h+T^2 )+ p*N*T + dip_dfi(T, L);
U_teor = U_pract;
if upr_0
  if (U_pract<0)
    U_pract=0;
  end
end
if upr_value>0
  if (U_pract>si*upr_value)
     U_pract=si*upr_value;
  end
end
if upr_time>0
  if ~isempty(U_sum)
    if U_sum(length(U_sum(:,1)),1) > upr_time
        U_pract = 0;
    end
  end
end
U=[U_pract; U_teor];
end

