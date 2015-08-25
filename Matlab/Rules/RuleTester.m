%   Rule Tester
%   This script allows basic testing of rules

Elem1OutletT = 126;
Elem2InletT = 20;

MachineRunning = true;

TypElem1OutletT = 125;
TypElem2InletT = 30;

Elem2InletTErrorThreshold = 5;

TypElem2InletTUncertaintyThreshold = 5;

ResultRule1 = Rule1(Elem1OutletT,MachineRunning,TypElem1OutletT);
ResultRule2 = Rule2(Elem2InletT,MachineRunning,TypElem2InletT);
ResultRule3 = Rule3(Elem2InletT,MachineRunning,TypElem2InletT, ...
    Elem2InletTErrorThreshold, TypElem2InletTUncertaintyThreshold);

clear Elem1OutletT Elem2InletT MachineRunning TypElem1OutletT TypElem2InletT