function [Re, FlowType, Advice] = examq2(Q, d)
rho = 1000;
mu = 1 * (10^(-3));

d = d/1000; %   d in m
r = d/2; %  r in m
A = pi *(r^2);

V = Q / A; %    V in m / s

Re = (rho * V * d) / mu;

if (Re < 2300)
    FlowType = 'Laminar';
    Advice = 16/Re;
elseif (Re > 2300)
    FlowType = 'Transitional / Turbulent';
    Advice = 'Go to the moody chart';
end




