function [] = dip_model_nn(a1, b1, c1, si1, f1, g1, ...
                           h1, p1, m1, j1, k1, q1, ...
                           r1, d1, lambda1, s1, ...
                           T, N, L, t)
clc
close all
global a b c si f g h p m j k q r d lambda s temp2
temp2=0;
a = a1;
b = b1;
c = c1;
si = si1;
f = f1;
g = g1;
h = h1;
p = p1;
m = m1;
j = j1;
k = k1;
q = q1;
r = r1;
d = d1;
lambda = lambda1;
s = s1;
options = odeset("MaxStep",10^-2);  
[t,TNL] = dip_ode45(1, 0, @dip_func_model,[0,t],[T;N;L],options);
figure
plot(t,TNL(:,1));
title("Клетки опухоли от времени")
xlabel('t') 
ylabel('T') 
figure
plot(t,TNL(:,2));
title("Стандартные имунные клетки от времени")
xlabel('t') 
ylabel('N')
figure
plot(t,TNL(:,3));
title("Специализированные имунные клетки от времени")
xlabel('t') 
ylabel('L')
clear all
end