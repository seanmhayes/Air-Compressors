%   Put timestamps into separate array for manipulation
dates = Element1OutletTemp.Timestamp;
dates = cell2mat(dates);

% i = 1;
% 
% for i = 1:length(dates)
%     str = dates(i);
%     str = str(1:end-3);
%     dates(i) = str;
% end