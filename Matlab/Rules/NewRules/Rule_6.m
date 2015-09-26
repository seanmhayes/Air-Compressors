%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 1 outlet temperature (Double)
%   2. Machine Running (Boolean)
%   3. Element 1 outlet temperature warning Level (Double)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_6(T2, T12, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T2 > T12
    fired = true;
else
    fired = false;
end
