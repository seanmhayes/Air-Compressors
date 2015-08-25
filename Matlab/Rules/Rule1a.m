%   LEGACY RULE FROM BEFORE WHEN RULE 1 WAS EXPANDED INTO THE VARIOUS
%   POTENTIAL FAULTS IT ENCOMPASSED
%   RULE 1a
%   Compressor Suitability: Two-stage machine with intercooler

%   This rule checks if the intercooler is performing effectively by
%   analysing the difference between the element 1 outlet temperature and
%   the element 2 inlet temperature

%   The rule returns TRUE if the difference between the element 1 outlet
%   and the element 2 inlet is below a certain threshold (i.e. there is not
%   effective cooling).

%   A caveat to this is that the rule must not fire if there is no need for
%   cooling, i.e. the compressor has not been compressing air for enough 
%   time that the element 1 outlet has cooled to ambient temperature.

%   The inputs to the rule are:
%
%   MEASURED VARIABLES
%   1. Element 1 Outlet Temperature
%   2. Element 2 Inlet Temperature
%   3. Machine Running/Off
%   4. Compressed Air Flow
%   5. Machine Loaded/Unloaded
%
%   LEARNED / INSTRUCTED VARIABLES
%   6. Typical Element 1 Outlet Temperatures when machine running
%   7. Typical Element 2 Inlet Temperatures when machine running
%   
%   Not all of these values are required for the rule to work effectively.
%   The purpose of inputs 3, 4 and 5 is to assist in determining if the
%   machine is or has recently been running, and therefore if intercooling 
%   is required. However this may also be determined by checking if the 
%   element 1 outlet temperature is above the threshold set by variable 6. 
%   Variables 3, 4 and 5 can therefore assist in confirming if the machine 
%   is running for peace of mind. This confirmation process is also used 
%   in another rule (RULE 2) which flags when Element 1 Outlet Temperature 
%   Sensor is not accurate.
%
%   The expected temperature drop of the compressed air across the 
%   intercooler is given by the difference between variable 6 and 7.

function Fired = Rule1(Elem1OutletAirTemp, Elem2InletAirTemp, ...
    MachineRunning, CompAirFlow, MachineLoad, TypElem1OutletAirTemp, ...
    TypElem2InletAirTemp)

%   First calculate the typical difference between element 1 outlet and
%   element 2 inlet temperature (i.e. temperature drop across intercooler)
%   from the defined typical balues for these temperatures.
%   These defined values may be averages of historical values, modelled
%   values, or learned normal values.
typical_difference = TypElem1OutletAirTemp - TypElem2InletAirTemp;

%   Next determine if it is appropriate to apply the rule. It is
%   appropriate to apply the rule if intercooling is required. Intercooling
%   is required if the element 1 outlet temperature is higher than ambient
%   temperature


