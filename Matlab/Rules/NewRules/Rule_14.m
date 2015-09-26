%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Plantroom temperature
%   2. Element 1 Outlet Temperature
%   3. Machine Loaded (Boolean)
%   4. Intercooler Pressure
%   5. Plantroom air pressure

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_14(T1, T2, Loaded, P1, P10)

%   only check rule if machine is loaded
if Loaded == false
    fired = false;
    return;
end

abs_T1 = T1 + 273.15;
abs_T2 = T2 + 273.15;
abs_P1 = P1 + 1013.25;
abs_P10 = P10 + 1013.25;

expected_T2 = abs_T1 * ( ( abs_P1 / abs_P10 ) ^ ( (1.4-1)/1.4 ));

if abs_T2 > expected_T2
    fired = true;
else
    fired = false;
end
