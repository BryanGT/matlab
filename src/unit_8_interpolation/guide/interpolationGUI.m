function varargout = interpolacionGUI(varargin)
% INTERPOLACIONGUI MATLAB code for interpolacionGUI.fig
%      INTERPOLACIONGUI, by itself, creates a new INTERPOLACIONGUI or raises the existing
%      singleton*.
%
%      H = INTERPOLACIONGUI returns the handle to a new INTERPOLACIONGUI or the handle to
%      the existing singleton*.
%
%      INTERPOLACIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLACIONGUI.M with the given input arguments.
%
%      INTERPOLACIONGUI('Property','Value',...) creates a new INTERPOLACIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interpolacionGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interpolacionGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interpolacionGUI

% Last Modified by GUIDE v2.5 25-Apr-2025 01:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interpolacionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @interpolacionGUI_OutputFcn, ...
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


% --- Executes just before interpolacionGUI is made visible.
function interpolacionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interpolacionGUI (see VARARGIN)

% Choose default command line output for interpolacionGUI
handles.output = hObject;
datosIniciales = [0, 0; 1, 1; 2, 0.5; 3, 2; 4, 1.5];
set(handles.tablaDatos, 'Data', datosIniciales);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interpolacionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interpolacionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnLineal.
function btnLineal_Callback(hObject, eventdata, handles)
% hObject    handle to btnLineal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datos = get(handles.tablaDatos, 'Data');
x = datos(:,1)';
y = datos(:,2)';
xx = linspace(min(x), max(x), 100);
yy = interp1(x, y, xx, 'linear');
plot(handles.axes1, x, y, 'ro', xx, yy, 'b-');
legend(handles.axes1, 'Datos', 'Lineal');
grid(handles.axes1, 'on');


% --- Executes on button press in btnSpline.
function btnSpline_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datos = get(handles.tablaDatos, 'Data');
x = datos(:,1)';
y = datos(:,2)';
xx = linspace(min(x), max(x), 100);
yy = spline(x, y, xx);
plot(handles.axes1, x, y, 'ro', xx, yy, 'g--');
legend(handles.axes1, 'Datos', 'Spline');
grid(handles.axes1, 'on');


% --- Executes on button press in btnAgregarPunto.
function btnAgregarPunto_Callback(hObject, eventdata, handles)
% hObject    handle to btnAgregarPunto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datos = get(handles.tablaDatos, 'Data');
nuevoX = inputdlg('Ingrese x:');
nuevoY = inputdlg('Ingrese y:');
if ~isempty(nuevoX) && ~isempty(nuevoY)
    nuevosDatos = [datos; str2double(nuevoX), str2double(nuevoY)];
    set(handles.tablaDatos, 'Data', nuevosDatos);
end

