%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Intercooler pressure
%   2. Machine Running (Boolean)
%   3. Expected intercooler pressure(Double)
%   4. Error threshold for intercooler pressure

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_10(P1, P4, E6, Loaded)

%   only check rule if machine is loaded
if Loaded == false
    fired = false;
    return;
end

if P1 < (P4 - E6)
    fired = true;
    return;
else
    fired = false;
end
