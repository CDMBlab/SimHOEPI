function varargout = SimHOEPI(varargin)
% SimHOEPI MATLAB code for SimHOEPI.fig
%      SimHOEPI, by itself, creates a new SimHOEPI or raises the existing
%      singleton*.
%
%      H = SimHOEPI returns the handle to a new SimHOEPI or the handle to
%      the existing singleton*.
%
%      SimHOEPI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SimHOEPI.M with the given input arguments.
%
%      SimHOEPI('Property','Value',...) creates a new SimHOEPI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SimHOEPI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SimHOEPI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SimHOEPI

% Last Modified by GUIDE v2.5 05-Dec-2021 08:08:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimHOEPI_OpeningFcn, ...
                   'gui_OutputFcn',  @SimHOEPI_OutputFcn, ...
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


% --- Executes just before SimHOEPI is made visible.
function SimHOEPI_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SimHOEPI (see VARARGIN)

% Choose default command line output for SimHOEPI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.uipanel2,'parent',uipanel1);


% UIWAIT makes SimHOEPI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Case;
global Control;
global h;
global x;
global p;
global SNP_num;
global MAF;
global Repeat;
global SNP_name;
global Table_name;
Case = str2double(get(handles.edit1,'String'));
Control = str2double(get(handles.edit2,'String')); 
SNP_num = str2double(get(handles.edit3,'String')); 
MAF =str2num(get(handles.edit4,'String'));
SNP_name =get(handles.edit5,'String');  
p = str2double(get(handles.edit14,'String'));
x = str2double(get(handles.edit8,'String'));
Table_name =get(handles.edit9,'String');
Table_name = strcat(Table_name,'.txt');
Repeat = str2double(get(handles.edit11,'String')); 
h = str2double(get(handles.edit12,'String'));
set(handles.radiobutton2,'value',0.0);
set(handles.radiobutton1,'value',0.0);



% --- Outputs from this function are returned to the command line.
function varargout = SimHOEPI_OutputFcn(hObject, eventdata, handles) 
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
global realdata_name;
% global matpath;
[Fnameh,Pnameh]=uigetfile('*.mat');
realdata_name=[Pnameh,Fnameh];
set(handles.pFileName1,'String',realdata_name);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global model_name;
global csvpath;
[Fnameh,Pnameh]=uigetfile('*.csv');
model_name=[Pnameh,Fnameh];
% csvpath = set(handles.pFileName2,'String',model_name);%
set(handles.pFileName2,'String',model_name);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global Case;
Freq_data5 = get(handles.edit1,'String');  
Case = str2double(Freq_data5);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
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
global Control;
Freq_data6 = get(handles.edit2,'String');  
Control = str2double(Freq_data6);

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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global SNP_num;
Freq_data7 = get(handles.edit3,'String');  
SNP_num = str2double(Freq_data7);


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global MAF;
Freq_data8 =get(handles.edit4,'String');  
MAF =str2num( Freq_data8);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global SNP_name;
SNP_name =get(handles.edit5,'String');  


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global data_txt;
if ( get(hObject,'Value') )
    data_txt = 1;
else
    data_txt= 0;
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global data_mat;
if ( get(hObject,'Value') )
    data_mat = 1;
else
    data_mat= 0;
end

function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
global p;
Freq_data3 = get(handles.edit14,'String');
p = str2double(Freq_data3);


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Case;
global Control;
global h;
global x;
global p;
global SNP_num;
global MAF;
global use_prevalence;
global use_heritability;
global Repeat;
global SNP_name;
global data_mat;
global data_txt;
global Table_name;
global realdata_name;
global model_name;
simHOEPI(Case,Control,SNP_num,MAF, use_prevalence,use_heritability,h,p,x,Repeat,SNP_name,data_mat,data_txt,Table_name,realdata_name,model_name)


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
global x;
Freq_data4 = get(handles.edit8,'String');  
x = str2double(Freq_data4);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
global Table_name;
Table_name =get(handles.edit9,'String');
Table_name = strcat(Table_name,'.txt');

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


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
global Repeat;
Freq_data11 = get(handles.edit11,'String');  
Repeat = str2double(Freq_data11);

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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.uipanel2,'parent','uipanel1');
global use_prevalence;
global use_heritability;
use_prevalence = 0;
use_heritability = 0;
str=get(hObject,'tag');
switch str
    case 'radiobutton1'
%           set(handles.uipanel2,'visible','on');
          set(handles.uipanel3,'visible','off');
          use_prevalence = 1;
    case 'radiobutton2'
%          set(handles.uipanel2,'visible','off');
         set(handles.uipanel3,'visible','on');
         use_heritability = 1;
    end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
global h;
Freq_data1 = get(handles.edit12,'String');  
 h = str2double(Freq_data1);

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



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
global x;
Freq_data2 = get(handles.edit13,'String');  
x = str2double(Freq_data2);


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text6_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double



function pFileName1_Callback(hObject, eventdata, handles)
% hObject    handle to pFileName1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pFileName1 as text
%        str2double(get(hObject,'String')) returns contents of pFileName1 as a double



function pFileName2_Callback(hObject, eventdata, handles)
% hObject    handle to pFileName2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pFileName2 as text
%        str2double(get(hObject,'String')) returns contents of pFileName2 as a double

% --- Executes during object creation, after setting all properties.
function pFileName1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pFileName1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function radiobutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function radiobutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%% simulation 
function simHOEPI(Case_Num,Control_Num,SNP_num,MAF, use_prevalence,use_heritability,h,p,x,repeat,SNP_name,data_mat,data_txt,table_name,realdata_name,model_name)
% SNP_num:the number of  SNPs
%Case_Num:the the number of cases
% Control_Num:
% a = Data('BD_01.mat',SNP_num);
% m = Model('additive_2.csv'); 
% Control_Num = input('Please enter the number of controls.\n');
% Case_Num = input('Please enter the the number of cases.\n');
% repeat= input('Please enter the number of replicates \n');
% tic;%tic1
% t1=clock;
a = Data(realdata_name,SNP_num);
m = Model(model_name);
%% Select the control dataset and calculate the MAF of them
idx = find(all(a.class(1,:)==2,1));
d = a.pts(idx,:);
maf =zeros(1,size(d,2));
for j = 1:size(d,2)
    Aa = 0;
    aa = 0;
    for i = 1:size(d,1)
        if d(i,j)==2
            Aa= Aa+1;
        end
        if d(i,j)==3
            aa=aa+1;
        end
        i = i+1;
    end
    maf(j)= (Aa+aa*2)/(size(d,1)*2);
    j = j+1;
end
%% Select the site of the model
for j = 1:m.order
    s = 0.01;%Search in steps of 0.01
    candidates = [];
    while 1
        for i = 1:size(d,2)
            if maf(i) >= (MAF(j)-s) && maf(i) <= (MAF(j)+s)
               candidates= [candidates,i];
            end
        end
        candidates_size = size(candidates);
        if candidates_size ~= [0 0] 
            break;
        else s = s + 0.01;
        end
    end
    site(j) = candidates(randperm(numel(candidates),1));
end
for i = 1:m.order
    MAF(i) = maf(site(i));
end
pt.site =site(1,:);
%% Calculate model using prevalence or heritability
%pt = use_heritability(mafs,h,x,site)
%pt = use_prevalence(mafs, p ,x,site)
% p is prevalence
% h is heritability
% x is baseline penetrance
%  site is the site of model
if use_prevalence
    pt = m.use_prevalence(MAF, p, x, pt.site);
end
if use_heritability
    pt = m.use_heritability(MAF, h, x, pt.site);
end
%% Generate simulated data and calculate sample labels
pt.write(table_name,ModelInformation.format_txt,MAF);
for k = 1:repeat
    SNP = simulation(d,Control_Num,Case_Num,pt,SNP_num);
    if data_mat
        filename1 = strcat(SNP_name,'_',num2str(k),'.mat');
        save(filename1,'SNP');
    end
    if data_txt
        filename2 = strcat(SNP_name,'_',num2str(k),'.txt');
        [Row,Col]=size(SNP);
        fid=fopen(filename2,'a');
        for i=1:Row
            for j=1:Col
                fprintf(fid,'%s\t',num2str(SNP(i,j)));
            end
            fprintf(fid,'\n');
        end
        fclose(fid);
    end
end
% disp(['toc',num2str(toc)]);
