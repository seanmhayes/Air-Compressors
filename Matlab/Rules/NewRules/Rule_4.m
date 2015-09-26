%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 2 Outlet Temperature (Double)
%   2. Compressed air delivery temperature (Double)
%       - for this point inlet dryer temperature is used
%   3. Machine Running (Boolean)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_4(T4, T5, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T5 > T4
    fired = true;
else
    fired = false;
end
