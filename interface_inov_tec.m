function varargout = interface_inov_tec(varargin)
% INTERFACE_INOV_TEC MATLAB code for interface_inov_tec.fig
%      INTERFACE_INOV_TEC, by itself, creates a new INTERFACE_INOV_TEC or raises the existing
%      singleton*.
%
%      H = INTERFACE_INOV_TEC returns the handle to a new INTERFACE_INOV_TEC or the handle to
%      the existing singleton*.
%
%      INTERFACE_INOV_TEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_INOV_TEC.M with the given input arguments.
%
%      INTERFACE_INOV_TEC('Property','Value',...) creates a new INTERFACE_INOV_TEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_inov_tec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_inov_tec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_inov_tec

% Last Modified by GUIDE v2.5 31-Mar-2023 20:57:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_inov_tec_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_inov_tec_OutputFcn, ...
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


% --- Executes just before interface_inov_tec is made visible.
function interface_inov_tec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_inov_tec (see VARARGIN)

% Choose default command line output for interface_inov_tec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_inov_tec wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.

%definindo as variaveis globais
clear all;clc;
global robot config

%chamando o arquivo do robo
addpath(genpath(strcat(pwd,'\RoboEEZYMK2_description')));

%importando o arquivo que descreve o robo
robot = importrobot('RoboEEZYMK2.urdf');

%configurando a gravidade
gravityVec = [0 0 -9.80665];
robot.Gravity = gravityVec;

% Define o limite de cada uma das articulações.
%robot.Bodies{1, 1}.Joint.PositionLimits = deg2rad([-90 90])%limite das articulações
%robot.Bodies{1, 2}.Joint.PositionLimits = deg2rad([-72 73])
%robot.Bodies{1, 3}.Joint.PositionLimits = deg2rad([-15 125])
%robot.Bodies{1, 4}.Joint.PositionLimits = deg2rad([-90 90])
%robot.Bodies{1, 5}.Joint.PositionLimits = deg2rad([-90 90])
%robot.Bodies{1, 6}.Joint.PositionLimits = deg2rad([-90 90])

%define a variavel config para a configuração inicial do robo
config = homeConfiguration(robot);

%exibe o robo com a configuração definida
%show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5])
%axis([-30 30 -30 30 0 30]);

%config(1).JointPosition = deg2rad(45);
show(robot, config, 'Frames', 'Off');axis([-0.25 0.25 -0.25 0.25 0 0.4])
function varargout = interface_inov_tec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.slider7, 'Value');
set(handles.edit12, 'string', a);

sldr7 = 1/180;
set(handles.slider7, 'SliderStep', [sldr7 sldr7]);

global config robot
config(1).JointPosition = deg2rad(double(a));
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

sldr8 = get(hObject, 'Value');
set(handles.edit11, 'String', sldr8);

sldrStep = 1/180;
set(handles.slider8, 'SliderStep', [sldrStep sldrStep]);

global config robot
config(2).JointPosition = deg2rad(double(sldr8));
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

sldr9 = get(hObject, 'Value');
set(handles.edit10, 'String', sldr9);

sldrStep = 1/180;
set(handles.slider9, 'SliderStep', [sldrStep sldrStep]);

global config robot
config(3).JointPosition = deg2rad(double(sldr9));
config(7).JointPosition = deg2rad(double(sldr9));

show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double

text = str2double(get(hObject, 'String'));
set(handles.slider9, 'Value',text);

global config robot
config(3).JointPosition = deg2rad(double(text));
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

text = str2double(get(hObject, 'String'));
set(handles.slider8, 'Value', text);

global config robot
config(2).JointPosition = deg2rad(double(text));
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


text = str2double(get(hObject, 'String'));

set(handles.slider7, 'Value', text);

global config robot
config(1).JointPosition = deg2rad(double(text));
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global config robot
config = homeConfiguration(robot);
show(robot, config, 'Frames', 'Off'); axis([-0.25 0.25 -0.25 0.25 0 0.5]);