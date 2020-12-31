function varargout = BottleDetection(varargin)
%BOTTLEDETECTION MATLAB code file for BottleDetection.fig
%      BOTTLEDETECTION, by itself, creates a new BOTTLEDETECTION or raises the existing
%      singleton*.
%
%      H = BOTTLEDETECTION returns the handle to a new BOTTLEDETECTION or the handle to
%      the existing singleton*.
%
%      BOTTLEDETECTION('Property','Value',...) creates a new BOTTLEDETECTION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to BottleDetection_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      BOTTLEDETECTION('CALLBACK') and BOTTLEDETECTION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in BOTTLEDETECTION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BottleDetection

% Last Modified by GUIDE v2.5 13-Jan-2019 16:29:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BottleDetection_OpeningFcn, ...
                   'gui_OutputFcn',  @BottleDetection_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before BottleDetection is made visible.
function BottleDetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for BottleDetection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BottleDetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BottleDetection_OutputFcn(hObject, eventdata, handles)
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
[filename, pathname] = uigetfile({'*.jpg'},'Pick a file');
image = strcat(pathname,filename);
im = imread(image);

axes(handles.axes1);
imshow(im,[]);

message = checkBottle(im);
setappdata(hObject,'Message',message);
set(handles.text3,'String',message{1});
set(handles.text4,'String',message{2});
set(handles.text5,'String',message{3});
set(handles.text6,'String',message{4});
set(handles.text7,'String',message{5});
set(handles.text8,'String',message{6});
guidata(hObject,handles);
