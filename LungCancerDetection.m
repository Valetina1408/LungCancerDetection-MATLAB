function varargout = Guide(varargin)
% GUIDE MATLAB code for Guide.fig
%      GUIDE, by itself, creates a new GUIDE or raises the existing
%      singleton*.
%
%      H = GUIDE returns the handle to a new GUIDE or the handle to
%      the existing singleton*.
%
%      GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE.M with the given input arguments.
%
%      GUIDE('Property','Value',...) creates a new GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guide

% Last Modified by GUIDE v2.5 11-Nov-2021 20:56:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guide_OpeningFcn, ...
                   'gui_OutputFcn',  @Guide_OutputFcn, ...
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


% --- Executes just before Guide is made visible.
function Guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guide (see VARARGIN)

% Choose default command line output for Guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Carga.
function Carga_Callback(hObject, eventdata, handles)
% hObject    handle to Carga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bandera f
[File_Name, Path_Name] = uigetfile('C:\Users\user\Documents\MATLAB\ParcialFinal_PDS');
       axes(handles.data)
       imshow([Path_Name,File_Name])
       f=imread(File_Name);

  if strcmp(File_Name,'SANO1.jpg')
        bandera=0;
  else 
        bandera=bandera + 1;
  end

% --- Executes on button press in Siguiente.
function Siguiente_Callback(hObject, eventdata, handles)
% hObject    handle to Siguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bandera f;

if bandera == 0
    f=imread('CANCER1','JPEG');
elseif bandera == 1
    f=imread('CANCER2','JPEG');
elseif bandera == 2
    f=imread('SANO3','JPEG');
elseif bandera == 3
    f=imread('CANCER3','JPEG');
    elseif bandera == 4
    f=imread('SANO2','JPEG');
elseif bandera == 5
    f=imread('SANO4','JPEG');
elseif bandera == 6
    bandera = 0;
end
       axes(handles.data)
       imshow(f);
       set(handles.data);
       bandera = bandera + 1;
% --- Executes on button press in Gris.
function Gris_Callback(hObject, eventdata, handles)
% hObject    handle to Gris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f Imagen_gray
  Imagen_gray=rgb2gray(f);
  axes(handles.Results)
  imshow(Imagen_gray)
  
% --- Executes on button press in ImBinaria.
function ImBinaria_Callback(hObject, eventdata, handles)
% hObject    handle to ImBinaria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Im_bin1 Imagen_gray bandera 
if bandera == 0
  Im_bin1 = Imagen_gray > 200;
elseif bandera == 1
  Im_bin1 = Imagen_gray > 200;
elseif bandera == 2
  Im_bin1 = Imagen_gray > 120;
elseif bandera == 3 || bandera == 4
  Im_bin1 = Imagen_gray > 150;
elseif bandera == 5 || bandera == 6
  Im_bin1 = Imagen_gray > 150;
end
  axes(handles.Results)
  imshow(Im_bin1)
  set(handles.Results);

% --- Executes on button press in LimBord.
function LimBord_Callback(hObject, eventdata, handles)
% hObject    handle to LimBord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Im_bin2 Im_bin1
  Im_bin2 = imclearborder(Im_bin1);
  axes(handles.Results)
  imshow(Im_bin2)


% --- Executes on button press in Rellenar.
function Rellenar_Callback(hObject, eventdata, handles)
% hObject    handle to Rellenar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Im_bin3 Im_bin2
  Im_bin3 = imfill(Im_bin2, 'holes');
  axes(handles.Results)
  imshow(Im_bin3)


% --- Executes on button press in Erosion.
function Erosion_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global erodedBW Im_bin3 bandera
    if bandera==0
      se = strel('line',180,900);
    elseif bandera==1
      se = strel('line',15,200);
    elseif bandera == 2
      se = strel('line',20,50);
    elseif bandera == 3 || bandera == 4
      se = strel('line',180,900);
    elseif bandera == 5 || bandera == 6
      se = strel('line',180,900);
    end
  erodedBW = imerode(Im_bin3,se);
  axes(handles.Results)
  imshow(erodedBW)

% --- Executes on button press in Dilat.
function Dilat_Callback(hObject, eventdata, handles)
% hObject    handle to Dilat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global erodedBW BW2 bandera
    if bandera==0
        se = strel('line',30,80);
    elseif bandera==1
        se = strel('line',30,80);
    elseif bandera==2
        se = strel('line',30,80);
    elseif bandera==3 || bandera==4 || bandera==5
        se = strel('line',30,80);
    elseif bandera==6 
        se = strel('line',80,180);
    end
        BW2 = imdilate(erodedBW,se); 
        axes(handles.Results)
        imshow(BW2)

function Diagnostico_Callback(hObject, eventdata, handles)
% hObject    handle to Diagnostico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Diagnostico as text
%        str2double(get(hObject,'String')) returns contents of Diagnostico as a double

% --- Executes during object creation, after setting all properties.
function Diagnostico_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Diagnostico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DetectarTum.
function DetectarTum_Callback(hObject, eventdata, handles)
% hObject    handle to DetectarTum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW2 bandera 
[B,L] = bwboundaries(BW2,'holes'); 

axes(handles.Results)
imshow(label2rgb(L, @jet, [.5 .5 .5]));
set(handles.Results);
guidata(hObject,handles);
imagen=getframe(handles.Results);
imagen1=frame2im(imagen);
 
    if bandera==0
        imwrite(imagen1,'RxProcesada.jpg') %%Guardar la imagen para despues detectarle los colores
    elseif bandera ==1
        imwrite(imagen1,'RxProcesada1.jpg')
    elseif bandera ==2
        imwrite(imagen1,'RxProcesada2.jpg')
    elseif bandera ==3
        imwrite(imagen1,'RxProcesada3.jpg')
    elseif bandera ==4
        imwrite(imagen1,'RxProcesada4.jpg')
    elseif bandera ==5
        imwrite(imagen1,'RxProcesada5.jpg')
    elseif bandera ==6
        imwrite(imagen1,'RxProcesada6.jpg')
    end


% --- Executes on button press in imgfinal.
function imgfinal_Callback(hObject, eventdata, handles)
global Resp bandera
if bandera == 0
    Resp=imread('SANO1','JPEG');
elseif bandera == 1
    Resp=imread('Final00','JPEG');
elseif bandera == 2
    Resp=imread('final1','JPEG');
elseif bandera == 3
    Resp=imread('SANO3','JPEG');
elseif bandera == 4
    Resp=imread('final3','JPEG');
    elseif bandera == 5
    Resp=imread('SANO2','JPEG');
elseif bandera == 6
    Resp=imread('SANO4','JPEG');
end
       axes(handles.Results)
       imshow(Resp);
       set(handles.Results);


% hObject    handle to imgfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NumPixelTumor Cancer
    if NumPixelTumor==0 && NumPixelTumor<=100
        Cancer=0;
        r=['Zona sospechosa de',char(10),'tejido cancerígeno', char(10), ' NO detectado'];
    else
        Cancer=1;
        r=['Zona sospechosa de',char(10),'tejido cancerígeno', char(10), '  detectado'];
    end
set(handles.Diagnostico1, 'string', r);


% --- Executes on button press in Pixeles.
function Pixeles_Callback(hObject, eventdata, handles)
% hObject    handle to Pixeles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bandera NumPixelTumor
if bandera==0
        rgbImage=imread('RxProcesada.jpg'); %%Guardar la imagen para despues detectarle los colores
    elseif bandera ==1
        rgbImage=imread('RxProcesada1.jpg');
    elseif bandera ==2
        rgbImage=imread('RxProcesada2.jpg');
    elseif bandera ==3
        rgbImage=imread('RxProcesada3.jpg');
    elseif bandera ==4
        rgbImage=imread('RxProcesada4.jpg');
    elseif bandera ==5
        rgbImage=imread('RxProcesada5.jpg');
    elseif bandera ==6
        rgbImage=imread('RxProcesada6.jpg');
end

GrayPixels = rgbImage(:,:,1) >=112 & rgbImage(:,:,2) >=105 & rgbImage(:,:,3) >=105; %%Contar Pixeles grises
NumPixelesGris = sum(GrayPixels(:));
grayImage=rgb2gray(rgbImage);
NumTotalPixel=numel(grayImage);
NumPixelTumor=NumTotalPixel-NumPixelesGris;
set(handles.NumPix,'String',NumPixelTumor)
