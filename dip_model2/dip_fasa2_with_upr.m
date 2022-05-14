function [] = dip_fasa2_with_upr(a11, a21, a31, a41, a51, ...
                           a61, a71, a81, K1, w11, w21, w31, ...
                           upr_time1, upr_value1, upr_01)
clc
close all
global a1 a2 a3 a4 a5 a6 a7 a8 K 
global w1 w2 w3 upr_time upr_value upr_0 temp2
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
options = odeset("MaxStep",10^-2);
[t1,THR1] = dip_ode45_2(@dip_func_model_with_upr2,[0,60],[1.5;1;0.85],options);
[t2,THR2] = dip_ode45_2(@dip_func_model_with_upr2,[0,60],[0.1;0.1;0.85],options);
[t3,THR3] = dip_ode45_2(@dip_func_model_with_upr2,[0,60],[0.01;0.01;0.85],options);
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