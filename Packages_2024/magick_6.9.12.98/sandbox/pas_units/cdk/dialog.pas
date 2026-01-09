unit dialog;

interface

uses
  ctypes, ncurses, cdk, cdkscreen, cdk_config, cdk_objs;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  MAX_DIALOG_ROWS = 50;  
  MAX_DIALOG_BUTTONS = 25;
  MIN_DIALOG_WIDTH = 10;  

type
  PSDialogBox = ^TSDialogBox;
  TSDialogBox = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      info : ^Pchtype;
      infoLen : Plongint;
      infoPos : Plongint;
      buttonLabel : ^Pchtype;
      buttonLen : Plongint;
      buttonPos : Plongint;
      messageRows : longint;
      buttonCount : longint;
      currentButton : longint;
      boxWidth : longint;
      boxHeight : longint;
      exitType : TEExitType;
      separator : Tboolean;
      shadow : Tboolean;
      highlight : Tchtype;
    end;

  TCDKDIALOG=  TSDialogBox;
  PCDKDIALOG=^TCDKDIALOG;

function newCDKDialog(para1:PCDKSCREEN; para2:longint; para3:longint; para4:TCDK_CSTRING2; para5:longint; 
           para6:TCDK_CSTRING2; para7:longint; para8:Tchtype; para9:Tboolean; para10:Tboolean; 
           para11:Tboolean):PCDKDIALOG;cdecl;external libcdk;
function activateCDKDialog(para1:PCDKDIALOG; para2:Pchtype):longint;cdecl;external libcdk;

procedure setCDKDialog(para1:PCDKDIALOG; para2:Tchtype; para3:Tboolean; para4:Tboolean);cdecl;external libcdk;
procedure setCDKDialogHighlight(para1:PCDKDIALOG; para2:Tchtype);cdecl;external libcdk;
function getCDKDialogHighlight(para1:PCDKDIALOG):Tchtype;cdecl;external libcdk;
procedure setCDKDialogSeparator(para1:PCDKDIALOG; para2:Tboolean);cdecl;external libcdk;
function getCDKDialogSeparator(para1:PCDKDIALOG):Tboolean;cdecl;external libcdk;
procedure setCDKDialogBox(para1:PCDKDIALOG; para2:Tboolean);cdecl;external libcdk;
function getCDKDialogBox(para1:PCDKDIALOG):Tboolean;cdecl;external libcdk;
procedure drawCDKDialogButtons(para1:PCDKDIALOG);cdecl;external libcdk;

//function injectCDKDialog(obj,input : longint) : longint;
//function setCDKDialogULChar(w,c : longint) : longint;
//function setCDKDialogURChar(w,c : longint) : longint;
//function setCDKDialogLLChar(w,c : longint) : longint;
//function setCDKDialogLRChar(w,c : longint) : longint;
//function setCDKDialogVerticalChar(w,c : longint) : longint;
//function setCDKDialogHorizontalChar(w,c : longint) : longint;
//function setCDKDialogBoxAttribute(w,c : longint) : longint;
//function setCDKDialogBackgroundColor(w,c : longint) : longint;
//function setCDKDialogBackgroundAttrib(w,c : longint) : longint;
//function drawCDKDialog(obj,box : longint) : longint;
//function eraseCDKDialog(obj : longint) : longint;
//function moveCDKDialog(obj,xpos,ypos,relative,refresh : longint) : longint;
//function positionCDKDialog(widget : longint) : longint;
//function destroyCDKDialog(obj : longint) : longint;
//
//function setCDKDialogPreProcess(w,f,d : longint) : longint;
//function setCDKDialogPostProcess(w,f,d : longint) : longint;


// === Konventiert am: 1-5-25 16:58:21 ===


implementation


//function injectCDKDialog(obj,input : longint) : longint;
//begin
//  injectCDKDialog:=injectCDKObject(obj,input,Int);
//end;
//
//function setCDKDialogULChar(w,c : longint) : longint;
//begin
//  setCDKDialogULChar:=setULCharOf(w,c);
//end;
//
//function setCDKDialogURChar(w,c : longint) : longint;
//begin
//  setCDKDialogURChar:=setURCharOf(w,c);
//end;
//
//function setCDKDialogLLChar(w,c : longint) : longint;
//begin
//  setCDKDialogLLChar:=setLLCharOf(w,c);
//end;
//
//function setCDKDialogLRChar(w,c : longint) : longint;
//begin
//  setCDKDialogLRChar:=setLRCharOf(w,c);
//end;
//
//function setCDKDialogVerticalChar(w,c : longint) : longint;
//begin
//  setCDKDialogVerticalChar:=setVTCharOf(w,c);
//end;
//
//function setCDKDialogHorizontalChar(w,c : longint) : longint;
//begin
//  setCDKDialogHorizontalChar:=setHZCharOf(w,c);
//end;
//
//function setCDKDialogBoxAttribute(w,c : longint) : longint;
//begin
//  setCDKDialogBoxAttribute:=setBXAttrOf(w,c);
//end;
//
//function setCDKDialogBackgroundColor(w,c : longint) : longint;
//begin
//  setCDKDialogBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
//end;
//
//function setCDKDialogBackgroundAttrib(w,c : longint) : longint;
//begin
//  setCDKDialogBackgroundAttrib:=setBKAttrOf(w,c);
//end;
//
//function drawCDKDialog(obj,box : longint) : longint;
//begin
//  drawCDKDialog:=drawCDKObject(obj,box);
//end;
//
//function eraseCDKDialog(obj : longint) : longint;
//begin
//  eraseCDKDialog:=eraseCDKObject(obj);
//end;
//
//function moveCDKDialog(obj,xpos,ypos,relative,refresh : longint) : longint;
//begin
//  moveCDKDialog:=moveCDKObject(obj,xpos,ypos,relative,refresh);
//end;
//
//function positionCDKDialog(widget : longint) : longint;
//begin
//  positionCDKDialog:=positionCDKObject(ObjOf(widget),widget^.win);
//end;
//
//function destroyCDKDialog(obj : longint) : longint;
//begin
//  destroyCDKDialog:=destroyCDKObject(obj);
//end;
//
//function setCDKDialogPreProcess(w,f,d : longint) : longint;
//begin
//  setCDKDialogPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
//end;
//
//function setCDKDialogPostProcess(w,f,d : longint) : longint;
//begin
//  setCDKDialogPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
//end;


end.
