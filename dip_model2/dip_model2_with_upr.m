function [] = dip_model2_with_upr(a11, a21, a31, a41, a51, a61, ...
                           a71, a81, K1, w11, w21, w31, ...
                           upr_time1, upr_value1, upr_01, ...
                           T, H, R, t1)
clc
close all
global a1 a2 a3 a4 a5 a6 a7 a8 K 
global w1 w2 w3 upr_time upr_value upr_0 temp2 U_sum
a1 = a11;
a2 = a21;
a3 = a31;
a4 = a41;
a5 = a51;
a6 = a61;
a7 = a71;
a8 = a81;
K = K1;
w1=w11;
w2=w21;
w3=w31;
upr_time=upr_time1;
upr_value=upr_value1;
upr_0=upr_01;
temp2=0;
[t,THR1] = dip_ode45_2(@dip_func_model_with_upr2,[0,t1],[T;H;R]);
hold on
title("Клетки опухоли, охотящиеся клетки, отдыхающие клетки от времени")
plot(t,THR1(:,1),"r",'DisplayName','Клетки опухоли');
xlabel('t') 
ylabel('T, H, R') 
plot(t,THR1(:,2),"k",'DisplayName','Охотящиеся клетки');
plot(t,THR1(:,3),"b",'DisplayName','Отдыхающие клетки');
legend
figure
plot(t,THR1(:,1));
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