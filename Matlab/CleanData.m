%   Now I need to modify the time and get rid of the decimal point after
%   the seconds, as Matlab doesn't like converting the date to datetime
%   if this decimal point is in place

%   First do cd170 times
CD170Time = cd170.Time;
%   CD170TimeShortened = arrayfun(@(x) x(1:2), CD170Time);

for i = 1:size(CD170Time)
    string = CD170Time{i};
    stringshort = string(1:end-2);
    CD170TimeShort{i,1} = stringshort;
end

%   Put short time back into original dataset
cd170.TimeShort = CD170TimeShort;
%   convert to datetime
cd170.TimeMatlab = datetime(cd170.TimeShort);

%   Now do the same for zt30 and zt37VSD
ZT30Time = zt30.Time;

for i = 1:size(ZT30Time)
    string = ZT30Time{i};
    stringshort = string(1:end-2);
    ZT30TimeShort{i,1} = stringshort;
end

%   Put short time back into original dataset
zt30.TimeShort = ZT30TimeShort;
%   convert to datetime
zt30.TimeMatlab = datetime(zt30.TimeShort);

ZT37VSDTime = zt37vsd.Time;

for i = 1:size(ZT37VSDTime)
    string = ZT37VSDTime{i};
    stringshort = string(1:end-2);
    ZT37VSDTimeShort{i,1} = stringshort;
end

%   Put short time back into original dataset
zt37vsd.TimeShort = ZT37VSDTimeShort;
%   convert to datetime
zt37vsd.TimeMatlab = datetime(zt37vsd.TimeShort);

%   Clear working variables
clear CD170Time CD170TimeShort ZT30Time ZT30TimeShort ZT37VSDTime ...
ZT37VSDTimeShort string stringshort i

%   Convert Yes/No to 0/1 for zt30
ZT30MachineRunning = zt30.MachineRunning;
for i = 1:length(zt30.MachineRunning)
    if strcmp(zt30.MachineRunning(i), 'Yes')
        ZT30_On(i) = 1;
    elseif strcmp(zt30.MachineRunning(i), 'No')
            ZT30_On(i) = 0;
    else
        msgbox('Error in ZT30 Machine Running Conversion to Boolean')
    end     
end

zt30.MachineRunningMatlab = ZT30_On.';

clear ZT30MachineRunning ZT30_On

% ZT37VSD_On = zeros(length(zt37vsd.MachineRunning),1);
% %   Convert Yes/No to 0/1 for zt37vsd
% for i = 1:length(zt37vsd.MachineRunning)
%     if strcmp(zt37vsd.MachineRunning(i), 'Yes')
%         ZT37VSD_On(i,1) = 1;
%     elseif strcmp(zt37vsd.MachineRunning(i), 'No')
%             ZT37VSD_On(i,1) = 0;
%     else
%         msgbox('Error in ZT37VSD Machine Running Conversion to Boolean')
%     end     
% end

% zt37vsd.MachineRunningMatlab = ZT37VSD_On.';

% clear ZT37VSDMachineRunning i
% clear ZT37VSD_On

%  Make new "Machine Running Boolean" to store as Boolean whether machine
%  is running or not

zt37vsd.MachineRunningBoolean = false(length(zt37vsd.MachineRunning), 1);
for i = 1:length(zt37vsd.MachineRunningBoolean)
    if strcmp(zt37vsd.MachineRunning(i), 'Yes')
        zt37vsd.MachineRunningBoolean = true;
    elseif strcmp(zt37vsd.MachineRunning(i), 'No')
        zt37vsd.MachineRunningBoolean = false;
    else
         msgbox('Error in ZT37VSD Machine Running Conversion to Boolean')
    end
end

