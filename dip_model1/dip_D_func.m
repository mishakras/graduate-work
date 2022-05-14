function [D] = dip_D_func(T,L)
global d lambda s
D = d*(L/T)^lambda/(s+(L/T)^lambda)*T;
end

