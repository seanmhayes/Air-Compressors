%   Create a variable to tell if the machine is running
%   This will be acheived by checking if the power drawn by the machine is
%   greater than K1 (See Rules_Summary.docx)
TestDataMatlab.MachineRunning = false(length(TestDataMatlab.Timest),1);

for i = 1:length(TestDataMatlab.Timest)
    if TestDataMatlab.KW(i) > K1
        TestDataMatlab.MachineRunning(i) = true;
    else
        TestDataMatlab.MachineRunning(i) = false;
    end
end

%   Create a variable to tell if the amchine is loaded
%   This will be achieved by checking if the power drawn by the machine is
%   greater than K2 (see Rules_Summary.docx)
TestDataMatlab.MachineLoaded = false(length(TestDataMatlab.Timest),1);

for i = 1:length(TestDataMatlab.Timest)
    if TestDataMatlab.KW(i) > K2
        TestDataMatlab.MachineLoaded(i) = true;
    else
        TestDataMatlab.MachineLoaded(i) = false;
    end
end

TestDataMatlab.PlantroomPressure(1:height(TestDataMatlab),1) = 0;

%   Initialise plantroom temperature
TestDataMatlab.PlantroomTemperature(1:height(TestDataMatlab),1) = 25;
%   Make plantroom temperature random between 18 and 22 degC
for i = 1: height(TestDataMatlab)
    TestDataMatlab.PlantroomTemperature(i,1) = ((22 - 18)*rand(1,1))+18;
end


    
   