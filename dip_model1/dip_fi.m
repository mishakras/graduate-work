function [fi] = dip_fi(T,L)
global w2 a b c lambda d s
fi = (a-a*b*T-(d*L^lambda)/(s*T^lambda+L^lambda))/c+1/(w2*c);
end

