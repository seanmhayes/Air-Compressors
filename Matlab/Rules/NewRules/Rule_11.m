%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Compressed air delivery pressure at time (t)
%   2. Compressed air delivery pressure at time  (t-1)
%   3. Machine Loaded (Boolean)
%   4. Compressed air delivery pressure error threshold

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_11(P2_t, P2_t_1, Loaded, E7)

%   only check rule if machine is unloaded
if Loaded == true
    fired = false;
    return;
end

if P2_t > (P2_t_1 + E7)
    fired = true;
else
    fired = false;
end
