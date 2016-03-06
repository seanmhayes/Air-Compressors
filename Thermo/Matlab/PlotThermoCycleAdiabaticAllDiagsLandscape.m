%   Initial parameters of air - ambient temperature 
%   and pressure T1 and P1

%   Everything in absolute terms until graphing time

Pa = 100000;
Ta = 273.15;

P1 = 101325;%   Pa
T1 = 300;%  K
P2 = 250000;

R = 8.3144598;%  Universal gas constant

%   Flow at min power
Q = 87.2; % acfm
Q = Q * 0.00047194745; % cubic meters per second

%   How many moles of air does this equate to?
%   PV = nRT
%   Convert Q to standard temperature and pressure
Q_standard = Q * P1* Ta * (1 /(Pa* T1));

%   1 mole at stp occupies how much volume?
V_standard = R * Ta * (1/Pa);


%   Convert Q_standard to moles
n = Q_standard * (1 / V_standard);


clf

subplot(2,2,1)

xlabel('Volume (l/s FAD)');
ylabel('Pressure (barg)');
title('P-V Diagram')
hold on
ylim([0 3]);
xlim([10 50]);

stage1_outlet_v_isothermal = isothermal_volume(n,R,T1,P2);

x_vals_1_2 = [stage1_outlet_v_isothermal:0.00001:Q]';
pressure_1_2 = isothermal_pressure(n,R,T1,x_vals_1_2);
p1 = plot(x_vals_1_2*1000,pressure_1_2/100000);

%  Plot horizontal lines to show limits of first stage
%   of compression
%plot(get(gca,'xlim'), [2.5 2.5]);
%plot(get(gca,'xlim'), [P1/1e+5 P1/1e+5]);

%   Legend
legend('Isothermal')
grid on
grid minor

subplot(2,2,2)
p2 = plot([x_vals_1_2(1,:)*1000 x_vals_1_2(end,:)*1000], [T1-273.15 T1-273.15]);
xlabel('Volume (l/s FAD)');
ylabel('Temperature(^{\circ}C)');
title('T-V Diagram')
%legend('Isothermal')
grid on
grid minor

%   Now calculate volume as gas is compressed adiabatically
gamma_air = 1.4;
air_adi_constant = P1 * (Q ^ (gamma_air));

pressure_rise_1ststage = [101325:250000]';

adi_volume = (air_adi_constant * (1 ./ pressure_rise_1ststage)) ...
    .^ (1 / gamma_air);
adi_volume = adi_volume';

subplot(2,2,1);
hold on;
p3 = plot(adi_volume*1000, pressure_rise_1ststage/100000);
legend([p1,p3],'Isothermal','Adiabatic');

%   Calculate new temperature of compressed air under compression
P1_V1 = pressure_rise_1ststage(1)*adi_volume(1);

P2_V2 = pressure_rise_1ststage.*adi_volume';

T2 = (P2_V2 ./ P1_V1) * T1;
Adi_temp = (P2_V2 ./ P1_V1) * T1;

subplot(2,2,2);
hold on;
p4 = plot(adi_volume*1000 , T2 - 273.15);
xlim([10 50]);
legend([p2,p4],'Isothermal','Adiabatic');

%   Plot P-T diagram for isothermal compression
subplot(2,2,3);
hold on
isothermal_temp = ones(length(pressure_1_2),1)*T1;
p5 = plot(isothermal_temp-273.15,pressure_1_2/100000);
title('P-T Diagram')
xlabel('Temperature (^{\circ}C)');
ylabel('Pressure (barg)');

ylim([0 3]);
xlim([10 130]);
grid on;
grid minor;

%   Plot P-T diagram for adiabatic compression
p6 = plot(T2-273.15, pressure_rise_1ststage/100000);
legend([p5, p6], 'Isothermal', 'Adiabatic');


%   Now do polytropic compression
%   n = polytropic exponent and ranges between 1 (isothermal) and 1.4
%   (adiabatic)

%   P1V1^n = polytropic constant
n_air = 1.2; %   Dummy to be changed when actual value found
polytrop_constant = P1 * (Q ^ n_air);
polytrop_volume = (polytrop_constant ./ pressure_rise_1ststage).^(1 / n_air);
polytrop_volume = polytrop_volume';

%   Calculate temperature
P1_V1 = pressure_rise_1ststage(1) * polytrop_volume(1);
P2_V2 = pressure_rise_1ststage.*polytrop_volume';
T2 = (P2_V2 ./ P1_V1) * T1;

%   Plot Results
subplot(2,2,1);
p7 = plot(polytrop_volume*1000,pressure_rise_1ststage/100000);
legend([p1,p3, p7],'Isothermal','Adiabatic','Polytropic');
axis square;

subplot(2,2,2);
p8 = plot(polytrop_volume*1000,T2-273.15);
legend([p2,p4,p8],'Isothermal','Adiabatic','Polytropic');
axis square;

subplot(2,2,3);
p9 = plot(T2-273.15,pressure_rise_1ststage/100000);
legend([p5, p6, p9], 'Isothermal', 'Adiabatic', 'Polytropic');
axis square;
