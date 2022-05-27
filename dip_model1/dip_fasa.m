function [] = dip_fasa(a1, b1, c1, si1, f1, g1, ...
                           h1, p1, m1, j1, k1, q1, ...
                           r1, d1, lambda1, s1)
clc
close all
global a b c si f g h p m j k q r d lambda s 
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
figure
[t,TNL1] = dip_ode45(1, 0, @dip_func_model,[0,200],[1*10^1;1.1*10^5;1],options);
[t,TNL2] = dip_ode45(1, 0, @dip_func_model,[0,200],[7*10^3;2.5*10^5;1],options);
[t,TNL3] = dip_ode45(1, 0, @dip_func_model,[0,200],[1*10^2;1.6*10^5;1],options);
[t,TNL4] = dip_ode45(1, 0, @dip_func_model,[0,200],[1*10^1;1*10^5;1],options);
[t,TNL5] = dip_ode45(1, 0, @dip_func_model,[0,200],[1*10^2;1.5*10^5;1],options);
[t,TNL6] = dip_ode45(1, 0, @dip_func_model,[0,200],[7*10^3;2.4*10^5;1],options);
xlabel('N') 
ylabel('T') 
title("Клетки опухоли/стандартные имунные клетки")
hold on
plot(TNL4(:,2),log(TNL4(:,1)),"b",'DisplayName','Траектория T=1*10^1;N=1*10^5;L=1');
plot(TNL4(1,2),log(TNL4(1,1)),"b*",'DisplayName','Начало траектории T=1*10^1;N=1*10^5;L=1');
plot(TNL5(:,2),log(TNL5(:,1)),"r",'DisplayName','Траектория T=1*10^2;N=1.5*10^5;L=1');
plot(TNL5(1,2),log(TNL5(1,1)),"r*",'DisplayName','Начало траектории T=1*10^2;N=1.5*10^5;L=1');
plot(TNL6(:,2),log(TNL6(:,1)),"c",'DisplayName','Траектория T=1*10^3;N=2.4*10^5;L=1');
plot(TNL6(1,2),log(TNL6(1,1)),"c*",'DisplayName','Начало траектории T=1*10^3;N=2.4*10^5;L=1');
plot(TNL4(length(TNL4),2),log(TNL4(length(TNL4),1)),"ko",'LineWidth',2,'DisplayName','Конец группы траекторий');
legend
figure
hold on
title("Клетки опухоли/стандартные имунные клетки")
xlabel('N') 
ylabel('T')
hold on
plot(TNL1(:,2),TNL1(:,1),"k",'DisplayName','Траектория T=1*10^1;N=1.1*10^5;L=1');
plot(TNL1(1,2),TNL1(1,1),"k*",'DisplayName','Начало траектории T=1*10^1;N=1.1*10^5;L=1');
plot(TNL2(:,2),TNL2(:,1),"m",'DisplayName','Траектория T=7*10^3;N=2.5*10^5;L=1');
plot(TNL2(1,2),TNL2(1,1),"m*",'DisplayName','Начало траектории T=7*10^3;N=2.5*10^5;L=1');
plot(TNL3(:,2),TNL3(:,1),"g",'DisplayName','Траектория T=1*10^2;N=1.6*10^5;L=1');
plot(TNL3(1,2),TNL3(1,1),"g*",'DisplayName','Начало траектории T=1*10^2;N=1.6*10^5;L=1');
plot(TNL1(length(TNL1),2),TNL1(length(TNL1),1),"ko",'LineWidth',2,'DisplayName','Конец группы траекторий');
legend
figure
title("Клетки опухоли/стандартные имунные клетки")
hold on
xlabel('N') 
ylabel('T')
plot(TNL1(:,2),log(TNL1(:,1)),"k",'DisplayName','Траектория T=1*10^1;N=1.1*10^5;L=1');
plot(TNL1(1,2),log(TNL1(1,1)),"k*",'DisplayName','Начало траектории T=1*10^1;N=1.1*10^5;L=1');
plot(TNL2(:,2),log(TNL2(:,1)),"m",'DisplayName','Траектория T=7*10^3;N=2.5*10^5;L=1');
plot(TNL2(1,2),log(TNL2(1,1)),"m*",'DisplayName','Начало траектории T=7*10^3;N=2.5*10^5;L=1');
plot(TNL3(:,2),log(TNL3(:,1)),"g",'DisplayName','Траектория T=1*10^2;N=1.6*10^5;L=1');
plot(TNL3(1,2),log(TNL3(1,1)),"g*",'DisplayName','Начало траектории T=1*10^2;N=1.6*10^5;L=1');
plot(TNL3(length(TNL3),2),log(TNL3(length(TNL3),1)),"ko",'LineWidth',2,'DisplayName','Конец группы траекторий');
plot(TNL4(:,2),log(TNL4(:,1)),"b",'DisplayName','Траектория T=1*10^1;N=1*10^5;L=1');
plot(TNL4(1,2),log(TNL4(1,1)),"b*",'DisplayName','Начало траектории T=1*10^1;N=1*10^5;L=1');
plot(TNL5(:,2),log(TNL5(:,1)),"r",'DisplayName','Траектория T=1*10^2;N=1.5*10^5;L=1');
plot(TNL5(1,2),log(TNL5(1,1)),"r*",'DisplayName','Начало траектории T=1*10^2;N=1.5*10^5;L=1');
plot(TNL6(:,2),log(TNL6(:,1)),"c",'DisplayName','Траектория T=1*10^3;N=2.4*10^5;L=1');
plot(TNL6(1,2),log(TNL6(1,1)),"c*",'DisplayName','Начало траектории T=1*10^3;N=2.4*10^5;L=1');
plot(TNL4(length(TNL4),2),log(TNL4(length(TNL4),1)),"ko",'LineWidth',2,'DisplayName','Конец группы траекторий');
legend('Location','SouthEast')
