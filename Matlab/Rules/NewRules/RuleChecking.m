%   This function checks all the rules against data sent to it and returns
%   a table of when the rules were true

function rules_fired = RuleChecking(TestDataMatlab)

SetUpThresholds;

rules_fired = table;

%   Preallocate size of table for rules to remove warning in Matlab
rules_fired.Rule1 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule2 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule3 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule4 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule5 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule6 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule7 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule8 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule9 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule10 = false(length(TestDataMatlab.Timest),1);
rules_fired.Rule11 = false(height(TestDataMatlab),1);
rules_fired.Rule12 = false(height(TestDataMatlab),1);
rules_fired.Rule13 = false(height(TestDataMatlab),1);
rules_fired.Rule14 = false(height(TestDataMatlab),1);
rules_fired.Rule15 = false(height(TestDataMatlab),1);

%   Test Rules
for i = 1:length(TestDataMatlab.Timest)
    rule1_fired = Rule_1(TestDataMatlab.PlantroomTemperature(i), TestDataMatlab.Element1OutletTemp(i), true);
    rules_fired.Rule1(i,1) = rule1_fired;

    rule2_fired = Rule_2(TestDataMatlab.Element1OutletTemp(i),TestDataMatlab.Element2InletTemp(i),true);
    rules_fired.Rule2(i,1) = rule2_fired;
    
    rule3_fired = Rule_3(TestDataMatlab.Element2InletTemp(i),TestDataMatlab.Element2OutletTemp(i),true);
    rules_fired.Rule3(i,1) = rule3_fired;
    
    rule4_fired = Rule_4(TestDataMatlab.Element2OutletTemp(i),TestDataMatlab.InletDryerTemperature(i),true);
    rules_fired.Rule4(i,1) = rule4_fired;
    
    rule5_fired = Rule_5(TestDataMatlab.PlantroomTemperature(i),T11,true);
    rules_fired.Rule5(i,1) = rule5_fired;
    
    rule6_fired = Rule_6(TestDataMatlab.Element1OutletTemp(i),T12,true);
    rules_fired.Rule6(i,1) = rule6_fired;
    
    rule7_fired = Rule_7(TestDataMatlab.Element2InletTemp(i),T13,true);
    rules_fired.Rule7(i,1) = rule7_fired;
    
    rule8_fired = Rule_8(TestDataMatlab.Element2OutletTemp(i),T14,true);
    rules_fired.Rule8(i,1) = rule8_fired;
    
    rule9_fired = Rule_9(TestDataMatlab.InletDryerTemperature(i),T15,true);
    rules_fired.Rule9(i,1) = rule9_fired;
    
    rule10_fired = Rule_10(TestDataMatlab.IntercoolerPressure(i),P4, E6, ...
        TestDataMatlab.MachineLoaded(i));
    rules_fired.Rule10(i,1) = rule10_fired;
    
    %   For rule 11 we need to remove the first data point as (i-1) is used
    if i >= 2
        rule11_fired = Rule_11(TestDataMatlab.OutletPressure(i),TestDataMatlab.OutletPressure(i-1), ...
            TestDataMatlab.MachineLoaded(i), E7);
        rules_fired.Rule11(i,1) = rule11_fired;
    end
    
    %   For rule 12 we need to remove the first 30 data points as (i*30) is
    %   used
    if i >= 30
        rule12_fired = Rule_12(sum(TestDataMatlab.DeltaMotorStarts(i-29:i)),N3);
        rules_fired.Rule12(i,1) = rule12_fired;
    end
    
    %   For rule 13 we need to remove the first data point as (i-1) is used
    if i >= 2
        rule13_fired = Rule_13(TestDataMatlab.OilPressure(i),TestDataMatlab.OilPressure(i-1),...
            TestDataMatlab.MachineLoaded(i),E9);
        rules_fired.Rule13(i,1) = rule13_fired;
    end
    
    rule14_fired = Rule_14(TestDataMatlab.InletDryerTemperature(i),TestDataMatlab.Element1OutletTemp(i),...
        TestDataMatlab.MachineLoaded(i), TestDataMatlab.IntercoolerPressure(i), ...
        TestDataMatlab.PlantroomPressure(i));
    rules_fired.Rule14(i,1) = rule14_fired;
    
    rule15_fired = Rule_15(TestDataMatlab.Element2InletTemp(i), TestDataMatlab.Element2OutletTemp(i),...
        TestDataMatlab.MachineLoaded(i), TestDataMatlab.OutletPressure(i), ...
        TestDataMatlab.IntercoolerPressure(i));
    rules_fired.Rule15(i,1) = rule15_fired;
    
end

