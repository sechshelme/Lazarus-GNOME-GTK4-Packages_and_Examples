unit button;

interface

uses
  ctypes, ncurses, cdk, cdkscreen, cdk_objs;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PSButton = ^TSButton;
  TtButtonCallback = procedure (button:PSButton);cdecl;
  TSButton = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      info : Pchtype;
      callback : TtButtonCallback;
      infoLen : longint;
      infoPos : longint;
      boxWidth : longint;
      boxHeight : longint;
      xpos : longint;
      ypos : longint;
      rows : longint;
      exitType : TEExitType;
      shadow : Tboolean;
      highlight : Tchtype;
      callbackData : pointer;
    end;

  TCDKBUTTON=  TSButton;
  PCDKBUTTON=^TCDKBUTTON;


function newCDKButton(para1:PCDKSCREEN; para2:longint; para3:longint; para4:Pchar; para5:TtButtonCallback;
           para6:Tboolean; para7:Tboolean):PCDKBUTTON;cdecl;external libcdk;
function activateCDKButton(para1:PCDKBUTTON; para2:Pchtype):longint;cdecl;external libcdk;

procedure setCDKButton(para1:PCDKBUTTON; para2:Pchar; para3:Tboolean);cdecl;external libcdk;
procedure setCDKButtonMessage(para1:PCDKBUTTON; para2:Pchar);cdecl;external libcdk;
function getCDKButtonMessage(para1:PCDKBUTTON):Pchtype;cdecl;external libcdk;
procedure setCDKButtonBox(para1:PCDKBUTTON; para2:Tboolean);cdecl;external libcdk;
function getCDKButtonBox(para1:PCDKBUTTON):Tboolean;cdecl;external libcdk;
procedure positionCDKButton(para1:PCDKBUTTON);cdecl;external libcdk;

//function setCDKButtonCBArgs(button,argPtr : longint) : longint;
//function getCDKButtonCBArgs(button,argType : longint) : TargType;
function CDKButtonHighlightOf(button : PSButton) : longint;
function setCDKButtonHighlight(button:PSButton;highlightMode : longint) : Boolean;
function getCDKButtonHighlight(button : PSButton) : longint;

//function injectCDKButton(obj,input : longint) : longint;
//function drawCDKButton(obj,Box : longint) : longint;
//function setCDKButtonULChar(w,c : longint) : longint;
//function setCDKButtonURChar(w,c : longint) : longint;
//function setCDKButtonLLChar(w,c : longint) : longint;
//function setCDKButtonLRChar(w,c : longint) : longint;
//function setCDKButtonVerticalChar(w,c : longint) : longint;
//function setCDKButtonHorizontalChar(w,c : longint) : longint;
//function setCDKButtonBoxAttribute(w,c : longint) : longint;
//function setCDKButtonBackgroundColor(w,c : longint) : longint;
//function setCDKButtonBackgroundAttrib(w,c : longint) : longint;
//function eraseCDKButton(obj : longint) : longint;
//function destroyCDKButton(obj : longint) : longint;
//function moveCDKButton(obj,xpos,ypos,relative,refresh : longint) : longint;


// === Konventiert am: 1-5-25 16:36:25 ===


implementation


//function setCDKButtonCBArgs(button,argPtr : longint) : longint;
//begin
//  setCDKButtonCBArgs:=(button^.callbackData):=(pointer(argPtr));
//end;
//
//function getCDKButtonCBArgs(button,argType : longint) : TargType;
//begin
//  getCDKButtonCBArgs:=TargType(button^.callbackData);
//end;

function CDKButtonHighlightOf(button: PSButton): longint;
begin
  CDKButtonHighlightOf:=button^.highlight;
end;

function setCDKButtonHighlight(button: PSButton; highlightMode: longint  ): Boolean;
begin
  setCDKButtonHighlight:=(CDKButtonHighlightOf(button))=highlightMode;
end;

function getCDKButtonHighlight(button: PSButton): longint;
begin
  getCDKButtonHighlight:=CDKButtonHighlightOf(button);
end;

//function injectCDKButton(obj,input : longint) : longint;
//begin
//  injectCDKButton:=injectCDKObject(obj,input,Int);
//end;
//
//function drawCDKButton(obj,Box : longint) : longint;
//begin
//  drawCDKButton:=drawCDKObject(obj,Box);
//end;
//
//function setCDKButtonULChar(w,c : longint) : longint;
//begin
//  setCDKButtonULChar:=setULCharOf(w,c);
//end;
//
//function setCDKButtonURChar(w,c : longint) : longint;
//begin
//  setCDKButtonURChar:=setURCharOf(w,c);
//end;
//
//function setCDKButtonLLChar(w,c : longint) : longint;
//begin
//  setCDKButtonLLChar:=setLLCharOf(w,c);
//end;
//
//function setCDKButtonLRChar(w,c : longint) : longint;
//begin
//  setCDKButtonLRChar:=setLRCharOf(w,c);
//end;
//
//function setCDKButtonVerticalChar(w,c : longint) : longint;
//begin
//  setCDKButtonVerticalChar:=setVTCharOf(w,c);
//end;
//
//function setCDKButtonHorizontalChar(w,c : longint) : longint;
//begin
//  setCDKButtonHorizontalChar:=setHZCharOf(w,c);
//end;
//
//function setCDKButtonBoxAttribute(w,c : longint) : longint;
//begin
//  setCDKButtonBoxAttribute:=setBXAttrOf(w,c);
//end;
//
//function setCDKButtonBackgroundColor(w,c : longint) : longint;
//begin
//  setCDKButtonBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
//end;
//
//function setCDKButtonBackgroundAttrib(w,c : longint) : longint;
//begin
//  setCDKButtonBackgroundAttrib:=setBKAttrOf(w,c);
//end;
//
//function eraseCDKButton(obj : longint) : longint;
//begin
//  eraseCDKButton:=eraseCDKObject(obj);
//end;
//
//function destroyCDKButton(obj : longint) : longint;
//begin
//  destroyCDKButton:=destroyCDKObject(obj);
//end;
//
//function moveCDKButton(obj,xpos,ypos,relative,refresh : longint) : longint;
//begin
//  moveCDKButton:=moveCDKObject(obj,xpos,ypos,relative,refresh);
//end;


end.
