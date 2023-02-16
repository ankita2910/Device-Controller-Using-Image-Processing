function varargout = HandGestureGUI(varargin)
% HANDGESTUREGUI M-file for HandGestureGUI.fig
%      HANDGESTUREGUI, by itself, creates a new HANDGESTUREGUI or raises the existing
%      singleton*.
%
%      H = HANDGESTUREGUI returns the handle to a new HANDGESTUREGUI or the handle to
%      the existing singleton*.
%
%      HANDGESTUREGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDGESTUREGUI.M with the given input arguments.
%
%      HANDGESTUREGUI('Property','Value',...) creates a new HANDGESTUREGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HandGestureGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HandGestureGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HandGestureGUI

% Last Modified by GUIDE v2.5 03-Jan-2018 16:53:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HandGestureGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @HandGestureGUI_OutputFcn, ...
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


% --- Executes just before HandGestureGUI is made visible.
function HandGestureGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HandGestureGUI (see VARARGIN)

% Choose default command line output for HandGestureGUI
handles.output = hObject;
% clear;

sss='0';
set(handles.timer,'String',sss);
sss='0';
set(handles.edit2,'String',sss);
sss='0';
set(handles.device,'String',sss);
a=ones(256,320);
axes(handles.axes1);
imshow(a);

b=ones(256,256);
axes(handles.axes2);
imshow(b);
axes(handles.axes3);
imshow(b);
axes(handles.axes4);
imshow(b);
axes(handles.axes5);
imshow(b);
axes(handles.axes6);
imshow(b);



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HandGestureGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HandGestureGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sss='Capturing Background';
set(handles.edit2,'String',sss);

vid=videoinput('winvideo',1,'YUY2_640x480'); 
set(vid,'ReturnedColorSpace','rgb');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
triggerconfig(vid,'manual'); 
%Capture one frame per trigger
set(vid,'FramesPerTrigger',1 );
set(vid,'TriggerRepeat', Inf);
start(vid); %start video

 BW = imread('mask.bmp');
 BW=im2bw(BW);
 [B,L,N,A] = bwboundaries(BW);
axes(handles.axes1);
 imshow(BW); hold on;
       for k=1:length(B),
         if(~sum(A(k,:)))
           boundary = B{k};
           axes(handles.axes1);
           plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
           for l=find(A(:,k))'
             boundary = B{l};
             axes(handles.axes1);
             save boundary boundary
             plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
           end
         end
       end
       
       
%        imshow(AA); hold on;
load boundary       
       
aa=1;
%Infinite while loop
load r;
load c;
% r=69:400;
% c=83:500;
while(1)
% preview(vid)
%Get Image
trigger(vid);
im=getdata(vid,1);
axes(handles.axes1);
imshow(im);
hold on
if aa == 5
    red=im(:,:,1);
Green=im(:,:,2);
Blue=im(:,:,3);

Out(:,:,1)=red(min(r):max(r),min(c):max(c));
Out(:,:,2)=Green(min(r):max(r),min(c):max(c));
Out(:,:,3)=Blue(min(r):max(r),min(c):max(c));
Out=uint8(Out);
 axes(handles.axes2);
 imshow(Out);
imwrite(Out,'bg.bmp');
sss='Capturing Gesture';
set(handles.edit2,'String',sss);
   
end

axes(handles.axes1);
plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
aa=aa+1;
set(handles.timer,'String',num2str(aa));
disp(aa);
if aa == 30
   break 
end


end

stop(vid),delete(vid),clear vid; 

red=im(:,:,1);
Green=im(:,:,2);
Blue=im(:,:,3);

Out(:,:,1)=red(min(r):max(r),min(c):max(c));
Out(:,:,2)=Green(min(r):max(r),min(c):max(c));
Out(:,:,3)=Blue(min(r):max(r),min(c):max(c));
Out=uint8(Out);
imwrite(Out,'final.bmp');
%figure, 
axes(handles.axes3);
imshow(Out,[])
        a=imread('bg.bmp');
[C1,c1]=segment(a,Out);

axes(handles.axes4);
imshow(c1,[]);
axes(handles.axes5);
imshow(C1,[]);

% close all;
% figure;
str='.bmp';
str1='F'
for i=1:70
    a=strcat(num2str(i),str);
    b=imread(a);
    re1=corr2(b,C1);
      fresultValues_r(i) = re1;
    fresultNames_r(i) = {a};
  
    result1(i)=re1
%     figure;
%     subplot(1,2,1);imshow(C1);
%     subplot(1,2,2);imshow(b);
%     xlabel(re1);
end

[re, ma]=max(result1);
a=strcat(num2str(ma),str);
b=imread(a);
axes(handles.axes6);
imshow(b);title('recognition result');

ser = serial('COM3','BaudRate',9600);
fopen(ser);

if( ma <= 10)
    set(handles.device,'String','Lamp ON');
    fwrite(ser,'f');
elseif((ma > 10) && (ma <=20))
    set(handles.device,'String','Lamp OFF');
    fwrite(ser,'g'); 
elseif((ma > 20) && (ma <=30))
    set(handles.device,'String','Fan Speed:1');
    fwrite(ser,'b');
elseif((ma > 30) && (ma <=40))
    set(handles.device,'String','Fan Speed:2');
    fwrite(ser,'c');
elseif((ma > 40) && (ma <=50))
    set(handles.device,'String','Fan Speed:3');
    fwrite(ser,'d');
elseif((ma > 50) && (ma <=60))
    set(handles.device,'String','Fan Speed:4');
    fwrite(ser,'a');
elseif((ma > 60) && (ma <=70))
    set(handles.device,'String','Fan Speed:0');
    fwrite(ser,'e');    
end

fclose(ser);
delete(ser);

function timer_Callback(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timer as text
%        str2double(get(hObject,'String')) returns contents of timer as a double


% --- Executes during object creation, after setting all properties.
function timer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function device_Callback(hObject, eventdata, handles)
% hObject    handle to device (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of device as text
%        str2double(get(hObject,'String')) returns contents of device as a double


% --- Executes during object creation, after setting all properties.
function device_CreateFcn(hObject, eventdata, handles)
% hObject    handle to device (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Train.
function Train_Callback(hObject, eventdata, handles)
% hObject    handle to Train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guitrain

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear;
sss='0';
set(handles.timer,'String',sss);
sss='0';
set(handles.edit2,'String',sss);
sss='0';
set(handles.device,'String',sss);
a=ones(480,650);
axes(handles.axes1);
imshow(a);

b=ones(256,256);
axes(handles.axes2);
imshow(b);
axes(handles.axes3);
imshow(b);
axes(handles.axes4);
imshow(b);
axes(handles.axes5);
imshow(b);
axes(handles.axes6);
imshow(b);





% --- Executes on button press in Readme.
function Readme_Callback(hObject, eventdata, handles)
% hObject    handle to Readme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpwin help1


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit
