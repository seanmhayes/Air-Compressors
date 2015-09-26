%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Oil pressure at time (t)
%   2. Oil pressure at time  (t-1)
%   3. Machine Loaded (Boolean)
%   4. Oil pressure error threshold

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_13(P10_t, P10_t_1, Loaded, E9)

%   only check rule if machine is loaded
if Loaded == false
    fired = false;
    return;
end

if (P10_t + E9) < P10_t_1
    fired = true;
else
    fired = false;
end
