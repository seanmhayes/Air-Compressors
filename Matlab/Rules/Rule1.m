%   RULE 1
%   Compressor Suitability: Two-stage machine with intercooler

%   This rule checks if there is an error with the element 1 outlet
%   temperature sensor by checking if the element 1 outlet temperature is
%   lower than it typically would be during the compressor's operation.

%   If the compressor is compressing air, then it would be expected that
%   the element 1 outlet would be in the order of 120-140 degC. If the
%   compressor is compressing air and this temperature is not reached then
%   it could be hypothesized that the temperature sensor requires
%   calibration.

%   The rule returns TRUE if the element 1 outlet temperature is lower
%   than the expected element 1 outlet temperature when the machine is
%   running. The rule should not fire if the compressor has not been running.

%   The inputs to the rule are:
%
%   MEASURED VARIABLES
%   1. Element 1 Outlet Temperature
%   2. Machine Running/Off
%   
%   LEARNED / INSTRUCTED VARIABLES
%   3. Typical Element 1 Outlet Temperatures when machine running


function Fired = Rule1(Elem1OutletAirTemp, MachineRunning, ...
    TypElem1OutletAirTemp)

%   First rule out the situations when the rule should not be applied, i.e.
%   when the machine has not produced compressed air for long enough that
%   the element 1 outlet has naturally cooled to below its typical value
%   when the machine is in operation. For each time where this is the case
%   return FALSE
if (Elem1OutletAirTemp >= TypElem1OutletAirTemp)
    Fired = false;
elseif(MachineRunning == false)
    Fired = false;
else
    Fired = true;
end

end

%   Next return False 

