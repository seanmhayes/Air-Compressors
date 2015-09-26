%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 2 inlet temperature (Double)
%   2. Machine Running (Boolean)
%   3. Element 2 inlet temperature warning Level (Double)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_7(T3, T13, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T3 > T13
    fired = true;
else
    fired = false;
end
