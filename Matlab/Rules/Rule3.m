%   Rule 3
%   Compressor Suitability: Two-stage machine with intercooler
%   Inputs: Elem2InletT, MachineRunning, TypElem2InletTemp, Elem2TError,
%   TypElem2Uncertainty

%   This rule fires when there appears to be a fault in the intercooler of
%   the air compressor.

%   If the machine is running, and the element 2 inlet temperature is
%   higher than typically observed, then the diagnosis is that the inter
%   cooler of the machine has failed.

%   If the compressor is compressing air, and the element 2 inlet
%   temperature is any higher than it should be with inter cooling (approx.
%   20-30 degC) then it could be hypothesized that the inter cooler is not
%   inter cooling correctly

%   The inputs to the rule are:
%
%   MEASURED VARIABLES
%   1. Element 2 Inlet Temperature
%   2. Machine Running/Off
%   
%   LEARNED / INSTRUCTED VARIABLES
%   3. Typical Element 2 Inlet Temperatures when machine running
%
%   ERROR THRESHOLDS
%   4. Measured Element 2 Inlet Temperature Error Threshold
%   5. Typical Element 2 Inlet Temperature Uncertainty Threshold
function Fired = Rule2(Elem2InletAirTemp, MachineRunning, ...
    TypElem2InletAirTemp, Elem2InletAirTempErrorThreshold, ...
    TypElem2InletAirTempUncertaintyThreshold)

%   First rule out the situations when the rule should not be applied, i.e.
%   when the machine has not produced compressed air for long enough that
%   the element 1 outlet has naturally cooled to below its typical value
%   when the machine is in operation. For each time where this is the case
%   return FALSE
if ((Elem2InletAirTemp + Elem2InletAirTempErrorThreshold) <= ...
        (TypElem2InletAirTemp - TypElem2InletAirTempUncertaintyThreshold))
    Fired = false;
elseif(MachineRunning == false)
    Fired = false;
else
    Fired = true;
end

end
