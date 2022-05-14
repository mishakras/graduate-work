function [] = dip_fasa2(a11, a21, a31, a41, a51, a61, ...
                           a71, a81, K1)
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
[t1,THR1] = ode45(@dip_func_model2,[0,600],[1.5;1;0.85],options);
[t2,THR2] = ode45(@dip_func_model2,[0,600],[0.1;0.1;0.85],options);
[t3,THR3] = ode45(@dip_func_model2,[0,600],[0.01;0.01;0.85],options);
figure
hold on
plot(THR1(1,1),THR1(1,3),"ro",'DisplayName','Начало траектории T=1;H=1;R=0.85');
plot(THR1(length(THR1),1),THR1(length(THR1),3),"r*",'DisplayName','Конец траектории T=1;H=1;R=0.85');
plot(THR1(:,1),THR1(:,3),"r",'DisplayName','Траектория T=1;H=1;R=0.85');
plot(THR2(1,1),THR2(1,3),"go",'DisplayName','Начало траектории T=0.1;H=0.1;R=0.85');
plot(THR2(length(THR2),1),THR2(length(THR2),3),"g*",'DisplayName','Конец траектории T=0.1;H=0.1;R=0.85');
plot(THR2(:,1),THR2(:,3),"g",'DisplayName','Траектория T=0.1;H=0.1;R=0.85');
plot(THR3(1,1),THR3(1,3),"ko",'DisplayName','Начало траектории T=0.01;H=0.01;R=0.85');
plot(THR3(length(THR3),1),THR3(length(THR3),3),"k*",'DisplayName','Конец траектории T=0.01;H=0.01;R=0.85');
plot(THR3(:,1),THR3(:,3),"k",'DisplayName','Траектория T=0.01;H=0.01;R=0.85');
title("Клетки опухоли, отдыхающие клетки")
xlabel('T') 
ylabel('R')
legend
figure
hold on
plot(THR1(1,1),THR1(1,2),"ro",'DisplayName','Начало траектории T=1;H=1;R=0.85');
plot(THR1(length(THR1),1),THR1(length(THR1),2),"r*",'DisplayName','Конец траектории T=1;H=1;R=0.85');
plot(THR1(:,1),THR1(:,2),"r",'DisplayName','Траектория T=1;H=1;R=0.85');
plot(THR2(1,1),THR2(1,2),"go",'DisplayName','Начало траектории T=0.1;H=0.1;R=0.85');
plot(THR2(length(THR2),1),THR2(length(THR2),2),"g*",'DisplayName','Конец траектории T=0.1;H=0.1;R=0.85');
plot(THR2(:,1),THR2(:,2),"g",'DisplayName','Траектория T=0.1;H=0.1;R=0.85');
plot(THR3(1,1),THR3(1,2),"ko",'DisplayName','Начало траектории T=0.01;H=0.01;R=0.85');
plot(THR3(length(THR3),1),THR3(length(THR3),2),"k*",'DisplayName','Конец траектории T=0.01;H=0.01;R=0.85');
plot(THR3(:,1),THR3(:,2),"k",'DisplayName','Траектория T=0.01;H=0.01;R=0.85');
title("Клетки опухоли, охотящиеся клетки")
xlabel('T') 
ylabel('H')
legend
figure
hold on
plot(THR1(1,2),THR1(1,3),"ro",'DisplayName','Начало траектории T=1;H=1;R=0.85');
plot(THR1(length(THR1),2),THR1(length(THR1),3),"r*",'DisplayName','Конец траектории T=1;H=1;R=0.85');
plot(THR1(:,2),THR1(:,3),"r",'DisplayName','Траектория T=1;H=1;R=0.85');
plot(THR2(1,2),THR2(1,3),"go",'DisplayName','Начало траектории T=0.1;H=0.1;R=0.85');
plot(THR2(length(THR2),2),THR2(length(THR2),3),"g*",'DisplayName','Конец траектории T=0.1;H=0.1;R=0.85');
plot(THR2(:,2),THR2(:,3),"g",'DisplayName','Траектория T=0.1;H=0.1;R=0.85');
plot(THR3(1,2),THR3(1,3),"ko",'DisplayName','Начало траектории T=0.01;H=0.01;R=0.85');
plot(THR3(length(THR3),2),THR3(length(THR3),3),"k*",'DisplayName','Конец траектории T=0.01;H=0.01;R=0.85');
plot(THR3(:,2),THR3(:,3),"k",'DisplayName','Траектория T=0.01;H=0.01;R=0.85');
title("Охотящиеся клетки, отдыхающие клетки")
xlabel('H') 
ylabel('R')
legend