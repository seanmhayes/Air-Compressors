%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Element 1 Outlet Temperature (Double)
%   2. Element 2 Inlet Temperature (Double)
%   3. Machine Running (Boolean)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_2(T2, T3, Running)

%   only check rule if machine is running
if Running == false
    fired = false;
    return;
end

if T3 > T2
    fired = true;
else
    fired = false;
end
