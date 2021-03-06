%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\seanadmin\Air-Compressors\Matlab\Rules\TestDataMatlab.xlsx
%    Worksheet: Comp2
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2015/09/25 13:27:50

%% Import the data, extracting spreadsheet dates in Excel serial date format
[~, ~, raw, dates] = xlsread('C:\Users\seanadmin\Air-Compressors\Matlab\Rules\NewRules\TestDataMatlab.xlsx','Comp2','A2:AP758','',@convertSpreadsheetExcelDates);
raw = raw(:,[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]);
dates = dates(:,1);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
TestDataMatlab = table;

%% Allocate imported array to column variable names
TestDataMatlab.Timest = datetime([dates{:,1}].', 'ConvertFrom', 'Excel');
TestDataMatlab.Element2OutletTemp = data(:,1);
TestDataMatlab.Element2InletTemp = data(:,2);
TestDataMatlab.Element1OutletTemp = data(:,3);
TestDataMatlab.IntercoolerPressure = data(:,4);
TestDataMatlab.ConverterCabTemp = data(:,5);
TestDataMatlab.OilPressure = data(:,6);
TestDataMatlab.OutletPressure = data(:,7);
TestDataMatlab.AccumulatedVolume = data(:,8);
TestDataMatlab.ModuleSeconds = data(:,9);
TestDataMatlab.MotorStarts = data(:,10);
TestDataMatlab.RunningSeconds = data(:,11);
TestDataMatlab.VSD_1_20 = data(:,12);
TestDataMatlab.VSD_20_40 = data(:,13);
TestDataMatlab.VSD_40_60 = data(:,14);
TestDataMatlab.VSD_60_80 = data(:,15);
TestDataMatlab.VSD_80_100 = data(:,16);
TestDataMatlab.InletDryerTemperature = data(:,17);
TestDataMatlab.DryerVesselAPressure = data(:,18);
TestDataMatlab.DryerVesselBpressure = data(:,19);
TestDataMatlab.I1 = data(:,20);
TestDataMatlab.I2 = data(:,21);
TestDataMatlab.I3 = data(:,22);
TestDataMatlab.KW = data(:,23);
TestDataMatlab.KVA = data(:,24);
TestDataMatlab.KVAR = data(:,25);
TestDataMatlab.PF = data(:,26);
TestDataMatlab.AV_VOLTS = data(:,27);
TestDataMatlab.In = data(:,28);
TestDataMatlab.V1 = data(:,29);
TestDataMatlab.V2 = data(:,30);
TestDataMatlab.V3 = data(:,31);
TestDataMatlab.Hz = data(:,32);
TestDataMatlab.DeltaAccumulatedVolume = data(:,33);
TestDataMatlab.DeltaModuleSeconds = data(:,34);
TestDataMatlab.DeltaMotorStarts = data(:,35);
TestDataMatlab.DeltaRunningSeconds = data(:,36);
TestDataMatlab.DeltaVSD_1_20 = data(:,37);
TestDataMatlab.DeltaVSD_20_40 = data(:,38);
TestDataMatlab.DeltaVSD_40_60 = data(:,39);
TestDataMatlab.DeltaVSD_60_80 = data(:,40);
TestDataMatlab.DeltaVSD_80_100 = data(:,41);


% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% TestDataMatlab.Timest=datenum(TestDataMatlab.Timest);

%% Clear temporary variables
clearvars data raw dates;