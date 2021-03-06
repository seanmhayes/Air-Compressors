%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 2 outlet temperature (Double)
%   2. Machine Running (Boolean)
%   3. Element 2 outlet temperature warning Level (Double)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_8(T4, T14, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T4 > T14
    fired = true;
else
    fired = false;
end
