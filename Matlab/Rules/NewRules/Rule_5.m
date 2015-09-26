%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Plant room temperature (Double)
%   2. Machine Running (Boolean)
%   3. Plant room temperature warning Level (Double)

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_5(T1, T11, Running)

if T1 > T11
    fired = true;
else
    fired = false;
end
