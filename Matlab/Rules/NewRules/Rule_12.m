%   See Rules_Summary.docx for description

%   Inputs to Rule
%   1. Number of motor starts in previous hour
%   4. Number of motor starts per hour warning level

%   Outputs from Rule
%   1. Fired (Boolean)

function fired = Rule_12(N1, N3)

if N1 >= N3
    fired = true;
else
    fired = false;
end
