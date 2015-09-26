%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 2 Inlet Temperature
%   2. Element 2 Outlet Temperature
%   3. Machine Loaded (Boolean)
%   4. Final Delivery Pressure
%   5. Intercooler Pressure

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_15(T3, T4, Loaded, P2, P1)

%   only check rule if machine is loaded
if Loaded == false
    fired = false;
    return;
end

abs_T3 = T3 + 273.15;
abs_T4 = T4 + 273.15;
abs_P2 = P2 + 1013.25;
abs_P1 = P1 + 1013.25;

expected_T4 = abs_T3 * ( ( abs_P2 / abs_P1 ) ^ ( (1.4-1)/1.4 ));

if abs_T4 > expected_T4
    fired = true;
else
    fired = false;
end
