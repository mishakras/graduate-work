function [dfi] = dip_dfi(T, L)
global a b c m j k q r d lambda s 
dfi = (-a*b*(s*T^lambda+L^lambda )^2+d*L^lambda*s*lambda*T^(lambda-1))/(c*(s*T^lambda+L^lambda)^2)*((a*T*(1-b*T)-c*dip_fi(T,L)*T-dip_D_func(T,L)));
dfi = dfi - (d*lambda*L^(lambda-1)*s*T^lambda)/(c*(s*T^lambda+L^lambda)^2)*(-m*L+(j*dip_D_func(T,L)^2*L)/(k+dip_D_func(T,L)^2 )-q*L*T+r*dip_fi(T,L)*T); 
end
