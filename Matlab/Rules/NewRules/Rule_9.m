%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Final compressed air delivery temperature (Double)
%       - Using dryer inlet temperature
%   2. Machine Running (Boolean)
%   3. Final compressed air delivery temperature warning Level (Double)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_9(T5, T15, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T5 > T15
    fired = true;
else
    fired = false;
end
