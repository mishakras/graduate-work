function [] = dip_model2(a11, a21, a31, a41, a51, a61, ...
                           a71, a81, K1, ...
                           T, H, R, t)
clc
close all
global a1 a2 a3 a4 a5 a6 a7 a8 K
a1 = a11;
a2 = a21;
a3 = a31;
a4 = a41;
a5 = a51;
a6 = a61;
a7 = a71;
a8 = a81;
K = K1;
options = odeset("MaxStep",10^-2);
[t1,THR1] = ode45(@dip_func_model2,[0,t],[T;H;R],options);
hold on
title("Клетки опухоли, охотящиеся клетки, отдыхающие клетки от времени")
plot(t1,THR1(:,1),"r",'DisplayName','Клетки опухоли');
xlabel('t') 
ylabel('T, H, R') 
plot(t1,THR1(:,2),"k",'DisplayName','Охотящиеся клетки');
plot(t1,THR1(:,3),"b",'DisplayName','Отдыхающие клетки');
legend
figure
hold on
plot(THR1(1,1),THR1(1,3),"ro");
plot(THR1(length(THR1),1),THR1(length(THR1),3),"r*");
plot(THR1(:,1),THR1(:,3),"r");
title("Клетки опухоли, отдыхающие клетки")
xlabel('T') 
ylabel('R')
figure
hold on
plot(THR1(1,1),THR1(1,2),"ro");
plot(THR1(length(THR1),1),THR1(length(THR1),2),"r*");
plot(THR1(:,1),THR1(:,2),"r");
title("Клетки опухоли, охотящиеся клетки")
xlabel('T') 
ylabel('H')
figure
hold on
plot(THR1(1,2),THR1(1,3),"ro");
plot(THR1(length(THR1),2),THR1(length(THR1),3),"r*");
plot(THR1(:,2),THR1(:,3),"r");
title("Охотящиеся клетки, отдыхающие клетки")
xlabel('H') 
ylabel('R')