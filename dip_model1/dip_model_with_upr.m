function [] = dip_model_nn_with_upr(a1, b1, c1, si1, f1, g1, ...
                           h1, p1, m1, j1, k1, q1, ...
                           r1, d1, lambda1, s1, w11, ...
                           w21, upr_time1, upr_value1, ...
                           upr_01, T, N, L, t1)
clc
close all
global a b c si f g h p m j k q r d lambda s 
global w1 w2 upr_time upr_value upr_0 temp2 U_sum
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
w1 = w11;
w2 = w21;
upr_time=upr_time1;
upr_value=upr_value1;
upr_0=upr_01;
options = odeset("MaxStep",10^-2); 
[t,TNL] = dip_ode45(1, 1, @dip_func_model_with_upr,[0,t1],[T;N;L],options);
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
figure
plot(t,TNL(:,1));
title("Основная макропеременная  от времени")
xlabel('t') 
ylabel('ψ')
figure
plot(U_sum(:,1),U_sum(:,3));
title("Дополнительная макропеременная  от времени")
xlabel('t') 
ylabel('ψ1')
figure
plot(U_sum(:,1),U_sum(:,2));
title("Управление от времени")
xlabel('t') 
ylabel('U')
figure
plot(U_sum(:,1),U_sum(:,6));
title("Теоритическое управление от времени")
xlabel('t') 
ylabel('U_теор')
figure
plot(U_sum(:,1),U_sum(:,4));
title("Фи от времени")
xlabel('t') 
ylabel('φ')
figure
plot(U_sum(:,1),U_sum(:,5));
title("Производная фи от времени")
xlabel('t') 
ylabel("φ'")
clear all
end