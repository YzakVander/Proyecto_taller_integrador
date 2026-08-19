clear
clc

syms Vcc Vth Beta1 Beta2 R1 R2 RE RB Vth1 Vth2
Umbral = 1.5; %Entre HIGH y LOW
Vcc = 3;
Vth = 0.7; % Example threshold voltage
Beta1 = 40;
Beta2 = 25;

RE = 1000
R2 = 5000

Vth1 = Umbral*(1 - 0.05)
Vth2 = Umbral*(1 + 0.05)

eq1 = Vth1 == Vth+(Vcc-Vth)*(RE+RB/Beta1)/(RE+R1) 
eq2 = Vth2 == (Vcc-Vth)*RE/(RE+R1/Beta2) + Vth;

sol = solve([eq1, eq2], [R1 RB]);

R1 = vpa(sol.R1)
RB = vpa(sol.RB)

VL = Vcc - (Vcc-Vth)/(RE + R1/Beta2)*R2 %LOW
VH = Vcc %HIGH

IC1_max_ma = (Vcc-Vth)/(RE+RB/Beta1) * 1000
IC2_max_ma = (Vcc-Vth)/(RE+R1/Beta2) * 1000
