function varargout = PolicyPlotter(varargin)
% POLICYPLOTTER MATLAB code for PolicyPlotter.fig
%      POLICYPLOTTER, by itself, creates a new POLICYPLOTTER or raises the existing
%      singleton*.
%
%      H = POLICYPLOTTER returns the handle to a new POLICYPLOTTER or the handle to
%      the existing singleton*.
%
%      POLICYPLOTTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLICYPLOTTER.M with the given input arguments.
%
%      POLICYPLOTTER('Property','Value',...) creates a new POLICYPLOTTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PolicyPlotter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PolicyPlotter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PolicyPlotter

% Last Modified by GUIDE v2.5 10-Feb-2016 17:31:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PolicyPlotter_OpeningFcn, ...
                   'gui_OutputFcn',  @PolicyPlotter_OutputFcn, ...
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


% --- Executes just before PolicyPlotter is made visible.
function PolicyPlotter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PolicyPlotter (see VARARGIN)

% Choose default command line output for PolicyPlotter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%set inital values
taxiloc = evalin('base','initTaxi');

set(handles.taxi,'string',taxiloc);


% UIWAIT makes PolicyPlotter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PolicyPlotter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


policy = evalin('base','policy');

set(handles.pos1,'string',getDirection(policy(1,1)));
set(handles.pos2,'string',getDirection(policy(2,1)));
set(handles.pos3,'string',getDirection(policy(3,1)));
set(handles.pos4,'string',getDirection(policy(4,1)));
set(handles.pos5,'string',getDirection(policy(5,1)));
set(handles.pos6,'string',getDirection(policy(6,1)));
set(handles.pos7,'string',getDirection(policy(7,1)));
set(handles.pos8,'string',getDirection(policy(8,1)));
set(handles.pos9,'string',getDirection(policy(9,1)));
set(handles.pos10,'string',getDirection(policy(10,1)));
set(handles.pos11,'string',getDirection(policy(11,1)));
set(handles.pos12,'string',getDirection(policy(12,1)));
set(handles.pos13,'string',getDirection(policy(13,1)));
set(handles.pos14,'string',getDirection(policy(14,1)));
set(handles.pos15,'string',getDirection(policy(15,1)));
set(handles.pos16,'string',getDirection(policy(16,1)));
set(handles.pos17,'string',getDirection(policy(17,1)));
set(handles.pos18,'string',getDirection(policy(18,1)));
set(handles.pos19,'string',getDirection(policy(19,1)));
set(handles.pos20,'string',getDirection(policy(20,1)));
set(handles.pos21,'string',getDirection(policy(21,1)));
set(handles.pos22,'string',getDirection(policy(22,1)));
set(handles.pos23,'string',getDirection(policy(23,1)));
set(handles.pos24,'string',getDirection(policy(24,1)));
set(handles.pos25,'string',getDirection(policy(25,1)));


function val = getDirection(policyval)
    switch policyval
        case 1
        val = '^';
        case 2
        val = 'v';
        case 3
        val = '<<';
        otherwise
        val = '>>';     
    end
    


function pos21_Callback(hObject, eventdata, handles)
% hObject    handle to pos21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos21 as text
%        str2double(get(hObject,'String')) returns contents of pos21 as a double


% --- Executes during object creation, after setting all properties.
function pos21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos16_Callback(hObject, eventdata, handles)
% hObject    handle to pos16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos16 as text
%        str2double(get(hObject,'String')) returns contents of pos16 as a double


% --- Executes during object creation, after setting all properties.
function pos16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos11_Callback(hObject, eventdata, handles)
% hObject    handle to pos11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos11 as text
%        str2double(get(hObject,'String')) returns contents of pos11 as a double


% --- Executes during object creation, after setting all properties.
function pos11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos6_Callback(hObject, eventdata, handles)
% hObject    handle to pos6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos6 as text
%        str2double(get(hObject,'String')) returns contents of pos6 as a double


% --- Executes during object creation, after setting all properties.
function pos6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos1_Callback(hObject, eventdata, handles)
% hObject    handle to pos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos1 as text
%        str2double(get(hObject,'String')) returns contents of pos1 as a double


% --- Executes during object creation, after setting all properties.
function pos1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos22_Callback(hObject, eventdata, handles)
% hObject    handle to pos22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos22 as text
%        str2double(get(hObject,'String')) returns contents of pos22 as a double


% --- Executes during object creation, after setting all properties.
function pos22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos17_Callback(hObject, eventdata, handles)
% hObject    handle to pos17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos17 as text
%        str2double(get(hObject,'String')) returns contents of pos17 as a double


% --- Executes during object creation, after setting all properties.
function pos17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos12_Callback(hObject, eventdata, handles)
% hObject    handle to pos12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos12 as text
%        str2double(get(hObject,'String')) returns contents of pos12 as a double


% --- Executes during object creation, after setting all properties.
function pos12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos7_Callback(hObject, eventdata, handles)
% hObject    handle to pos7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos7 as text
%        str2double(get(hObject,'String')) returns contents of pos7 as a double


% --- Executes during object creation, after setting all properties.
function pos7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos2_Callback(hObject, eventdata, handles)
% hObject    handle to pos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos2 as text
%        str2double(get(hObject,'String')) returns contents of pos2 as a double


% --- Executes during object creation, after setting all properties.
function pos2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos23_Callback(hObject, eventdata, handles)
% hObject    handle to pos23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos23 as text
%        str2double(get(hObject,'String')) returns contents of pos23 as a double


% --- Executes during object creation, after setting all properties.
function pos23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos18_Callback(hObject, eventdata, handles)
% hObject    handle to pos18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos18 as text
%        str2double(get(hObject,'String')) returns contents of pos18 as a double


% --- Executes during object creation, after setting all properties.
function pos18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos13_Callback(hObject, eventdata, handles)
% hObject    handle to pos13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos13 as text
%        str2double(get(hObject,'String')) returns contents of pos13 as a double


% --- Executes during object creation, after setting all properties.
function pos13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos8_Callback(hObject, eventdata, handles)
% hObject    handle to pos8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos8 as text
%        str2double(get(hObject,'String')) returns contents of pos8 as a double


% --- Executes during object creation, after setting all properties.
function pos8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos3_Callback(hObject, eventdata, handles)
% hObject    handle to pos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos3 as text
%        str2double(get(hObject,'String')) returns contents of pos3 as a double


% --- Executes during object creation, after setting all properties.
function pos3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos24_Callback(hObject, eventdata, handles)
% hObject    handle to pos24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos24 as text
%        str2double(get(hObject,'String')) returns contents of pos24 as a double


% --- Executes during object creation, after setting all properties.
function pos24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos19_Callback(hObject, eventdata, handles)
% hObject    handle to pos19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos19 as text
%        str2double(get(hObject,'String')) returns contents of pos19 as a double


% --- Executes during object creation, after setting all properties.
function pos19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos14_Callback(hObject, eventdata, handles)
% hObject    handle to pos14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos14 as text
%        str2double(get(hObject,'String')) returns contents of pos14 as a double


% --- Executes during object creation, after setting all properties.
function pos14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos9_Callback(hObject, eventdata, handles)
% hObject    handle to pos9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos9 as text
%        str2double(get(hObject,'String')) returns contents of pos9 as a double


% --- Executes during object creation, after setting all properties.
function pos9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos4_Callback(hObject, eventdata, handles)
% hObject    handle to pos4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos4 as text
%        str2double(get(hObject,'String')) returns contents of pos4 as a double


% --- Executes during object creation, after setting all properties.
function pos4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos25_Callback(hObject, eventdata, handles)
% hObject    handle to pos25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos25 as text
%        str2double(get(hObject,'String')) returns contents of pos25 as a double


% --- Executes during object creation, after setting all properties.
function pos25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos20_Callback(hObject, eventdata, handles)
% hObject    handle to pos20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos20 as text
%        str2double(get(hObject,'String')) returns contents of pos20 as a double


% --- Executes during object creation, after setting all properties.
function pos20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos15_Callback(hObject, eventdata, handles)
% hObject    handle to pos15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos15 as text
%        str2double(get(hObject,'String')) returns contents of pos15 as a double


% --- Executes during object creation, after setting all properties.
function pos15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos10_Callback(hObject, eventdata, handles)
% hObject    handle to pos10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos10 as text
%        str2double(get(hObject,'String')) returns contents of pos10 as a double


% --- Executes during object creation, after setting all properties.
function pos10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos5_Callback(hObject, eventdata, handles)
% hObject    handle to pos5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos5 as text
%        str2double(get(hObject,'String')) returns contents of pos5 as a double


% --- Executes during object creation, after setting all properties.
function pos5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function passenger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passenger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function taxi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function drop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function passenger_Callback(hObject, eventdata, handles)
% hObject    handle to passenger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passenger as text
%        str2double(get(hObject,'String')) returns contents of passenger as a double



function taxi_Callback(hObject, eventdata, handles)
% hObject    handle to taxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taxi as text
%        str2double(get(hObject,'String')) returns contents of taxi as a double



function drop_Callback(hObject, eventdata, handles)
% hObject    handle to drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of drop as text
%        str2double(get(hObject,'String')) returns contents of drop as a double
