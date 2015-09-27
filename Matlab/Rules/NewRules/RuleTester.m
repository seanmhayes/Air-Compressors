function varargout = RuleTester(varargin)
% RULETESTER MATLAB code for RuleTester.fig
%      RULETESTER, by itself, creates a new RULETESTER or raises the existing
%      singleton*.
%
%      H = RULETESTER returns the handle to a new RULETESTER or the handle to
%      the existing singleton*.
%
%      RULETESTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RULETESTER.M with the given input arguments.
%
%      RULETESTER('Property','Value',...) creates a new RULETESTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RuleTester_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RuleTester_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RuleTester

% Last Modified by GUIDE v2.5 27-Sep-2015 15:11:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RuleTester_OpeningFcn, ...
                   'gui_OutputFcn',  @RuleTester_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RuleTester is made visible.
function RuleTester_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RuleTester (see VARARGIN)

% Choose default command line output for RuleTester
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(hObject,'Toolbar','figure')

%   TURN ON GRIDLINES
grid(handles.axesmain,'on')
hold on
grid(handles.axesrules,'on')
hold on

% UIWAIT makes RuleTester wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RuleTester_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonLoadData.
function pushbuttonLoadData_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonLoadData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global TestDataMatlab;

ImportTestData;
SetUpThresholds;
AppendTestData;

handles.CurrentData = TestDataMatlab;
guidata(hObject,handles)

%   assignin('base','TestDataMatlab',TestDataMatlab)
handles.popupmenu_params.String = TestDataMatlab.Properties.VariableNames;



% --- Executes on selection change in popupmenu_params.
function popupmenu_params_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_params (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global TestDataMatlab;
global h_mydataplot;
global mydata;
handles.CurrentData = TestDataMatlab;

contents = get(handles.popupmenu_params,'String'); 
popupmenu4value = contents{get(handles.popupmenu_params,'Value')};

assignin('base','contents',contents);
assignin('base','popupmenu4value',popupmenu4value);

myvarname = strcat('TestDataMatlab.',popupmenu4value);

mydata = eval(myvarname);

h_mydataplot = plot(handles.axesmain, TestDataMatlab.Timest, mydata);
grid(handles.axesmain,'on');
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_params contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_params


% --- Executes during object creation, after setting all properties.
function popupmenu_params_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_params (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonRules.
function pushbuttonRules_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRules (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global TestDataMatlab;
handles.CurrentData = TestDataMatlab;

SetUpThresholds;
AppendTestData;

checked_rules = RuleChecking(TestDataMatlab);
plot(handles.axesrules, TestDataMatlab.Timest, [checked_rules.Rule1, ...
    checked_rules.Rule2, checked_rules.Rule3, checked_rules.Rule4, ...
    checked_rules.Rule5, checked_rules.Rule6, checked_rules.Rule7,...
    checked_rules.Rule8, checked_rules.Rule9, checked_rules.Rule10]);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;
handles.CurrentData = TestDataMatlab;

TestDataMatlab.Element1OutletTemp(1:455) = -20;
axes(handles.axes3)
imshow('IERGLogo.jpg')


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkboxRule1.
function checkboxRule1_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h1;

handles.axesrules;
hold on
if handles.checkboxRule1.Value == 1
    h1 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule1, 'DisplayName', 'Rule 1');
elseif handles.checkboxRule1.Value == 0
    delete(h1);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule1


% --- Executes on button press in checkboxRule2.
function checkboxRule2_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h2;

handles.axesrules;
hold on
if handles.checkboxRule2.Value == 1
    h2 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule2, 'DisplayName', 'Rule 2');
elseif handles.checkboxRule2.Value == 0
    delete(h2);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule2


% --- Executes on button press in checkboxRule3.
function checkboxRule3_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h3;

handles.axesrules;
hold on
if handles.checkboxRule3.Value == 1
    h3 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule3, 'DisplayName', 'Rule 3');
elseif handles.checkboxRule3.Value == 0
    delete(h3);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule3


% --- Executes on button press in checkboxRule4.
function checkboxRule4_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h4;

handles.axesrules;
hold on
if handles.checkboxRule4.Value == 1
    h4 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule4, 'DisplayName', 'Rule 4');
elseif handles.checkboxRule4.Value == 0
    delete(h4);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule4


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;
handles.CurrentData = TestDataMatlab;

SetUpThresholds;
AppendTestData;

checked_rules = RuleChecking(TestDataMatlab);



if handles.checkboxRule1.Value == 1
    plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule1, 'DisplayName', 'Rule 1')
end
hold on
if handles.checkboxRule2.Value == 1
    plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule2, 'DisplayName', 'Rule 2')
end
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');


% --- Executes on button press in pushbuttonCheckRules.
function pushbuttonCheckRules_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCheckRules (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;
global checked_rules;

SetUpThresholds;
%   AppendTestData;
checked_rules = RuleChecking(TestDataMatlab);


% --- Executes on button press in checkboxRule5.
function checkboxRule5_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h5;

handles.axesrules;
hold on
if handles.checkboxRule5.Value == 1
    h5 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule5, 'DisplayName', 'Rule 5');
elseif handles.checkboxRule5.Value == 0
    delete(h5);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule5


% --- Executes on button press in checkboxRule6.
function checkboxRule6_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h6;

handles.axesrules;
hold on
if handles.checkboxRule6.Value == 1
    h6 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule6, 'DisplayName', 'Rule 6');
elseif handles.checkboxRule6.Value == 0
    delete(h6);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule6


% --- Executes on button press in checkboxRule7.
function checkboxRule7_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h7;

handles.axesrules;
hold on
if handles.checkboxRule7.Value == 1
    h7 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule7, 'DisplayName', 'Rule 7');
elseif handles.checkboxRule7.Value == 0
    delete(h7);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule7


% --- Executes on button press in checkboxRule8.
function checkboxRule8_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h8;

handles.axesrules;
hold on
if handles.checkboxRule8.Value == 1
    h8 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule8, 'DisplayName', 'Rule 8');
elseif handles.checkboxRule8.Value == 0
    delete(h8);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule8


% --- Executes on button press in checkboxRule9.
function checkboxRule9_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h9;

handles.axesrules;
hold on
if handles.checkboxRule9.Value == 1
    h9 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule9, 'DisplayName', 'Rule 9');
elseif handles.checkboxRule9.Value == 0
    delete(h9);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule9


% --- Executes on button press in checkboxRule10.
function checkboxRule10_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h10;

handles.axesrules;
hold on
if handles.checkboxRule10.Value == 1
    h10 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule10, 'DisplayName', 'Rule 10');
elseif handles.checkboxRule10.Value == 0
    delete(h10);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule10


% --- Executes on button press in checkboxRule11.
function checkboxRule11_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h11;

handles.axesrules;
hold on
if handles.checkboxRule11.Value == 1
    h11 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule11, 'DisplayName', 'Rule 11');
elseif handles.checkboxRule11.Value == 0
    delete(h11);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule11


% --- Executes on button press in checkboxRule12.
function checkboxRule12_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h12;

handles.axesrules;
hold on
if handles.checkboxRule12.Value == 1
    h12 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule12, 'DisplayName', 'Rule 12');
elseif handles.checkboxRule12.Value == 0
    delete(h12);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule12


% --- Executes on button press in checkboxRule13.
function checkboxRule13_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h13;

handles.axesrules;
hold on
if handles.checkboxRule13.Value == 1
    h13 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule13, 'DisplayName', 'Rule 13');
elseif handles.checkboxRule13.Value == 0
    delete(h13);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule13


% --- Executes on button press in checkboxRule14.
function checkboxRule14_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h14;

handles.axesrules;
hold on
if handles.checkboxRule14.Value == 1
    h14 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule14, 'DisplayName', 'Rule 14');
elseif handles.checkboxRule14.Value == 0
    delete(h14);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule14


% --- Executes on button press in checkboxRule15.
function checkboxRule15_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRule15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab
global checked_rules
global h15;

handles.axesrules;
hold on
if handles.checkboxRule15.Value == 1
    h15 = plot(handles.axesrules,TestDataMatlab.Timest, checked_rules.Rule15, 'DisplayName', 'Rule 15');
elseif handles.checkboxRule15.Value == 0
    delete(h15);
end
hold on
legend(handles.axesrules,'off')
legend(handles.axesrules,'show');
% Hint: get(hObject,'Value') returns toggle state of checkboxRule15


% --- Executes on button press in pushbuttonForce1.
function pushbuttonForce1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force plantroom temperature to 160 degC to force rule 1
TestDataMatlab.PlantroomTemperature(2:49) = 160;

% --- Executes on button press in pushbuttonForce2.
function pushbuttonForce2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 1 Outlet temperature to 15 degC
TestDataMatlab.Element1OutletTemp(51:99) = 15;


% --- Executes on button press in pushbuttonForce3.
function pushbuttonForce3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 2 Inlet temperature to 200 degC
TestDataMatlab.Element2InletTemp(102:149) = 200;


% --- Executes on button press in pushbuttonForce4.
function pushbuttonForce4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 2 Outlet temperature to 10 degC
TestDataMatlab.Element2OutletTemp(151:199) = 10;


% --- Executes on button press in pushbuttonForce6.
function pushbuttonForce6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 1 outlet temperature to 200 degC
TestDataMatlab.Element1OutletTemp(251:298) = 200;


% --- Executes on button press in pushbuttonForce14.
function pushbuttonForce14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 1 Outlet temperature to 175;
TestDataMatlab.Element1OutletTemp(630:680) = 175;



% --- Executes on button press in pushbuttonForce5.
function pushbuttonForce5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force plant room temperature to 50 degC
TestDataMatlab.PlantroomTemperature(202:248) = 50;


% --- Executes on button press in pushbuttonForce7.
function pushbuttonForce7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 2 inlet temperature to 30 degC
TestDataMatlab.Element2InletTemp(301:348) = 30;


% --- Executes on button press in pushbuttonForce8.
function pushbuttonForce8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 2 outlet temperature to 150 degC;
TestDataMatlab.Element2OutletTemp(351:398) = 150;

% --- Executes on button press in pushbuttonForce9.
function pushbuttonForce9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force final delivery temperature to 25 degC
TestDataMatlab.InletDryerTemperature(401:448) = 25;


% --- Executes on button press in pushbuttonForce10.
function pushbuttonForce10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force intercooler pressure to 1000
TestDataMatlab.IntercoolerPressure(451:499) = 1000;


% --- Executes on button press in pushbuttonForce11.
function pushbuttonForce11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

% Force the final delivery pressure to continually increase;
for i = 501:549
    TestDataMatlab.OutletPressure(i) = TestDataMatlab.OutletPressure(i-1)+25;
end


% --- Executes on button press in pushbuttonForce12.
function pushbuttonForce12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

% Introduce several extra starts
TestDataMatlab.DeltaMotorStarts(556) = 1;
TestDataMatlab.DeltaMotorStarts(566) = 1;
TestDataMatlab.DeltaMotorStarts(576) = 1;
TestDataMatlab.DeltaMotorStarts(586) = 1;


% --- Executes on button press in pushbuttonForce13.
function pushbuttonForce13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Introduce a decrease in oil pressure;
for i = 601:625
    TestDataMatlab.OilPressure(i) = TestDataMatlab.OilPressure(i-1) - 150;
end


% --- Executes on button press in pushbuttonForce15.
function pushbuttonForce15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonForce15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDataMatlab;

%   Force Element 2 outlet temperature to 175 degC;
TestDataMatlab.Element2OutletTemp(700:750) = 175;
