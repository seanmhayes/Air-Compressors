%   Rule 2
%   Compressor Suitability: Two-stage machine with intercooler

%   This rule is to check when the element 2 inlet temperature sensor
%   appears to be in fault. If the temperature of the element 2 inlet is
%   higher than expected, and the machine is not running, then it could be
%   hypothesised that the sensor is broken. This rule doesn't cover for the
%   situation where the value is high but the machine is running, as this
%   would indicate an intercooler failure, which is covered by other rules.

%   If the compressor is compressing air, then it would be expected that
%   the element 2 inlet would be in the order of 20-30 degC. If the
%   compressor is not compressing air but this value is exeeded then
%   it could be hypothesized that the temperature sensor requires
%   calibration.

%   The rule returns TRUE if the element 1 inlet temperature is higher
%   than the expected element 1 outlet temperature when the machine is not
%   running. The rule should not fire if the compressor has been running, 
%   as a creep up in temperature in this case would indicate
%   intercooler failure.

%   The inputs to the rule are:
%
%   MEASURED VARIABLES
%   1. Element 2 Inlet Temperature
%   2. Machine Running/Off
%   
%   LEARNED / INSTRUCTED VARIABLES
%   3. Typical Element 2 Inlet Temperatures when machine not running

function Fired = Rule2(Elem2InletAirTemp, MachineRunning, ...
    TypElem2InletAirTemp)

%   First rule out the situations when the rule should not be applied, i.e.
%   when the machine has not produced compressed air for long enough that
%   the element 1 outlet has naturally cooled to below its typical value
%   when the machine is in operation. For each time where this is the case
%   return FALSE
if (Elem2InletAirTemp <= TypElem2InletAirTemp)
    Fired = false;
elseif(MachineRunning == true)
    Fired = false;
else
    Fired = true;
end

end