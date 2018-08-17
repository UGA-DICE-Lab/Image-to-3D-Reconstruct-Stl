function varargout = MainMenu(varargin)
% MAINMENU MATLAB code for MainMenu.fig
%      MAINMENU, by itself, creates a new MAINMENU or raises the existing
%      singleton*.
%
%      H = MAINMENU returns the handle to a new MAINMENU or the handle to
%      the existing singleton*.
%
%      MAINMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINMENU.M with the given input arguments.
%
%      MAINMENU('Property','Value',...) creates a new MAINMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainMenu

% Last Modified by GUIDE v2.5 14-Aug-2018 15:56:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @MainMenu_OutputFcn, ...
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


% --- Executes just before MainMenu is made visible.
function MainMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainMenu (see VARARGIN)

handles.setCroppedRegion=0;
handles.setCroppedBinary=0;
handles.setLabeledImage=0;
handles.setProjection3D=0;
handles.setStlFile=0;
handles.setLabelMatrix=0;
handles.setTop=0;
 handles.setBottom=0;
 handles.setLeft=0;
 handles.setRight=0;



set(handles.top,'Enable','Off');
set(handles.left,'Enable','Off');
set(handles.right,'Enable','Off');
set(handles.bottom,'Enable','Off');
set(handles.croppedRegion,'Enable','Off');
set(handles.croppedBinary,'Enable','Off');
set(handles.labeledImage,'Enable','Off');
set(handles.projection3D,'Enable','Off');
set(handles.stlFile,'Enable','Off');
set(handles.labelMatrix,'Enable','Off');
set(handles.browseButton,'Enable','Off');


set(handles.cropText,'Visible','Off');
set(handles.waitTag,'Visible','Off');
hca=(handles.MainImage);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.CropSegment);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.MastBinCropSegment);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.CropSegment);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.SizeVaryImgBin);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.show3D);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 
hca=(handles.SizeVaryImgBinNeg);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'color',[0.75 0.75 0.75]);
hca.XRuler.Axle.LineStyle = 'none'; 
hca.YRuler.Axle.LineStyle = 'none'; 

% Choose default command line output for MainMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in imageLoad. And Loads image into the
% workspace
function imageLoad_Callback(hObject, eventdata, handles)
% hObject    handle to imageLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fleName,pthName]=uigetfile('*.tif','Select .tif image file');   
mastImage=imread(strcat(pthName,fleName));
handles.imgSegm=mastImage;
binImgMast=binImageGen(mastImage);
axes(handles.MainImage);
imshow(mastImage);
axes(handles.CropSegment);
imshow(mastImage);
handles.mastImage=mastImage;
axes(handles.MastBinCropSegment);
imshow(binImgMast);
handles.mastBinImg=binImgMast;
axes(handles.SizeVaryImgBin);
imshow(binImgMast);





% Update all variables into handles structure
handles.binImgSegm=binImgMast;
handles.binImgBSmooth=binImgMast;
generateSurface(handles);
handles.noRect=1;
[handles.bwSegLabels handles.colorSegLabels]=generateLabels(handles);
% Enable Buttons
set(handles.top,'Enable','On');
set(handles.left,'Enable','On');
set(handles.right,'Enable','On');
set(handles.bottom,'Enable','On');
set(handles.croppedRegion,'Enable','On');
set(handles.croppedBinary,'Enable','On');
set(handles.labeledImage,'Enable','On');
set(handles.projection3D,'Enable','On');
set(handles.stlFile,'Enable','On');
set(handles.labelMatrix,'Enable','On');
set(handles.browseButton,'Enable','On');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function imageLoad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.cropText,'Visible','On');
noRect=handles.noRect;

if noRect==0
    
    delete(handles.hrect);
    noRect=1;
end
axes(handles.MainImage);
rectPos=getrect();
if noRect==1
    handles.hrect=rectangle('Position',rectPos);
    noRect=0;
end
axes(handles.CropSegment);
imgSeg=imcrop(handles.mastImage,rectPos);
handles.imgSegm=imgSeg;
handles.binImgSegm=binImageGen(imgSeg);
imshow(imgSeg);
axes(handles.MastBinCropSegment);
imshow(handles.mastBinImg);
axes(handles.SizeVaryImgBin);
imshow(handles.binImgSegm);
handles.binImgBSmooth=handles.binImgSegm;
generateSurface(handles);
handles.noRect=noRect;
[handles.bwSegLabels handles.colorSegLabels]=generateLabels(handles);
set(handles.cropText,'Visible','Off');
guidata(hObject, handles);



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pxls=round(get(handles.slider1,'Value')*1000);
set(handles.pixelText,'string',pxls);
binImgBSmooth=bwareaopen(handles.binImgSegm,pxls); % remove small black spots whose area is less than 50 pixels
axes(handles.SizeVaryImgBin);
imshow(binImgBSmooth);
handles.binImgBSmooth=binImgBSmooth;
generateSurface(handles);
[handles.bwSegLabels handles.colorSegLabels]=generateLabels(handles);
guidata(hObject, handles);







% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




%% Other Functions

function binReturnImg=binImageGen(mastImage)
binReturnImg=~(mastImage==116|mastImage==117|mastImage==118|mastImage==119|mastImage==120);


function generateSurface(handles)  %type generate
set(handles.waitTag,'Visible','On');
Iblur=handles.binImgBSmooth;
[xx,yy]=size(Iblur);
x=1:xx;
y=1:yy;
[ix,iy]=meshgrid(y,x);
axes(handles.show3D);
mshData=mesh(ix,iy,(~Iblur));
colormap copper
% xlim([0 xx]);ylim([0 yy]);
hca=(handles.show3D);
set(hca,'xtick',[]);
set(hca,'ytick',[]);
set(hca,'ztick',[]);
set(hca,'color','None');
for jj=1:100
    view(-50+jj,82);
    pause(0.01);
end
ixx=ix;
iyy=iy;

set(handles.waitTag,'Visible','Off');

function [bwImgLabels,clrLabel]=generateLabels(handles)
set(handles.waitTag,'Visible','On');
    bwImgLabels=bwlabel(handles.binImgBSmooth);
    sz=size(bwImgLabels);
    rMat=uint8(zeros(sz));
    gMat=rMat;bMat=rMat;
    highLabel=max(max(bwImgLabels));
    clrs=uint8(hsv(highLabel)*255);
    for i=1:highLabel
        rc=randi(highLabel);
        rMat=rMat+uint8(bwImgLabels==i).*clrs(rc,1);
        gMat=gMat+uint8(bwImgLabels==i).*clrs(rc,2);
        bMat=bMat+uint8(bwImgLabels==i).*clrs(rc,3);
        
    end
    
        clrLabel(:,:,1)=rMat;
        clrLabel(:,:,2)=gMat;
        clrLabel(:,:,3)=bMat;
    axes(handles.SizeVaryImgBinNeg);
    imshow(uint8(clrLabel));
    set(handles.waitTag,'Visible','Off');
   
    
    



function pixelText_Callback(hObject, eventdata, handles)
% hObject    handle to pixelText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pixelText as text
%        str2double(get(hObject,'String')) returns contents of pixelText as a double


% --- Executes during object creation, after setting all properties.
function pixelText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pixelText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Save button
% --- Executes on button press in browseButton.
function browseButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName]=uiputfile('.bmp','Select folder and fileName');
set(handles.waitTag,'Visible','On');
stlMat=handles.binImgBSmooth;
cropImg=handles.imgSegm;
cropbinImg=handles.binImgSegm;
labelImg=handles.colorSegLabels;
labelMat=handles.bwSegLabels;
szSTL=size(stlMat);
pxlsExt=10;
sCR=handles.setCroppedRegion;
sCB=handles.setCroppedBinary;
sLI=handles.setLabeledImage;
sP3D=handles.setProjection3D;
sSF=handles.setStlFile;
sLM=handles.setLabelMatrix;
sT=handles.setTop;
sB=handles.setBottom;
sL=handles.setLeft;
sR=handles.setRight;
if(sL==1)
    stlMat=[zeros(szSTL(1),pxlsExt) stlMat];
    szSTL=size(stlMat);
end

if(sR==1)
    stlMat=[stlMat zeros(szSTL(1),pxlsExt)];
    szSTL=size(stlMat);
end

if(sT==1)
    stlMat=[zeros(pxlsExt,szSTL(2));stlMat];
    szSTL=size(stlMat);
end
if(sB==1)
    stlMat=[stlMat;zeros(pxlsExt,szSTL(2))];
    szSTL=size(stlMat);
end
if(sCR)==1
    imwrite(cropImg,strcat(pathName,fileName(1:end-4),'_cropImg.bmp'));
end

if(sCB)==1
    imwrite(cropbinImg,strcat(pathName,fileName(1:end-4),'_cropBinImg.bmp'));
end

if(sLI)==1
    imwrite(labelImg,strcat(pathName,fileName(1:end-4),'_labelImg.bmp'));
end
if sLM==1
    save(strcat(pathName,fileName(1:end-4),'_labelMatrix'),'labelMat');
end
if(sSF)==1
    writeFileName=strcat(fileName(1:end-4),'_stlFile.stl')
    szIm=size(stlMat);
    gridX=1:szIm(1);
    gridY=1:szIm(2);
    gridZ=1:2;
    whos stlMat
    whos cropbinImg
    wrtDble(:,:,1)=zeros(size(stlMat));
    wrtDble(:,:,2)=~stlMat;
    wrtDble=logical(wrtDble);
    whos wrtDble gridX gridY gridZ
    [faces,vertices] = CONVERT_voxels_to_stl(writeFileName,wrtDble,gridX,gridY,gridZ,'ascii');
end
set(handles.waitTag,'Visible','Off');

    
% Check Boxes


% --- Executes on button press in croppedRegion.
function croppedRegion_Callback(hObject, eventdata, handles)
% hObject    handle to croppedRegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of croppedRegion

    handles.setCroppedRegion=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in croppedBinary.
function croppedBinary_Callback(hObject, eventdata, handles)
% hObject    handle to croppedBinary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of croppedBinary
    handles.setCroppedBinary=get(hObject,'Value');
guidata(hObject, handles);

% --- Executes on button press in labeledImage.
function labeledImage_Callback(hObject, eventdata, handles)
% hObject    handle to labeledImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of labeledImage

    handles.setLabeledImage=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in projection3D.
function projection3D_Callback(hObject, eventdata, handles)
% hObject    handle to projection3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.setProjection3D=get(hObject,'Value');
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of projection3D


% --- Executes on button press in stlFile.
function stlFile_Callback(hObject, eventdata, handles)
% hObject    handle to stlFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stlFile

    handles.setStlFile=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in labelMatrix.
function labelMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to labelMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of labelMatrix

    handles.setLabelMatrix=get(hObject,'Value');

guidata(hObject, handles);



% --- Executes on button press in top.
function top_Callback(hObject, eventdata, handles)
% hObject    handle to top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of top

    handles.setTop=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in bottom.
function bottom_Callback(hObject, eventdata, handles)
% hObject    handle to bottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bottom

    handles.setBottom=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of left

    handles.setLeft=get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of right

    handles.setRight=get(hObject,'Value');

guidata(hObject, handles);
