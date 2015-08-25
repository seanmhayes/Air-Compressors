%   This script allows testing of rules with manual data collected from
%   compressors in Pharmacy Building
%   Before running this script, run "PullSQLData" and "CleanData"
Rule1Complete = false(length(zt37vsd.P_Id),1);
Rule2Complete = false(length(zt37vsd.P_Id),1);
Rule3Complete = false(length(zt37vsd.P_Id),1);

Elem1OutletT = zt37vsd.Element1Outlet_C;
Elem2InletT = zt37vsd.Element2_InletTemp;
MachineRunning = zt37vsd.MachineRunning;

TypElem1OutletT = 140;
TypElem2InletT = 30;

Elem2InletTErrorThreshold = 5;
TypElem2InletTUncertaintyThreshold = 5;

for i = 1:length(Rule1Complete)
    Rule1Complete(i) = Rule1(Elem1OutletT(i),MachineRunning(i),Elem2InletT(i));
end

for i = 1:length(Rule2Complete)
    Rule2Complete(i) = Rule2(Elem2InletT,MachineRunning(i),TypElem2InletT(i));
end

for i = 1:length(Rule3Complete)
    Rule3Complete(i) = Rule3(Elem2InletT(i),MachineRunning(i),TypElem2InletT(i),...
        Elem2InletTErrorThreshold,TypElem2InletTUncertaintyThreshold)
end

figure
plot(zt37vsd.TimeMatlab,[Rule1Complete, Rule2Complete, Rule3Complete])