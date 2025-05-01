unit itemlist;

interface

uses
  ctypes, ncurses, cdk, cdk_config, cdk_objs, cdkscreen;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PSItemList = ^TSItemList;
  TSItemList = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      labelWin : PWINDOW;
      fieldWin : PWINDOW;
      titleAdj : longint;
      _label : Pchtype;
      labelLen : longint;
      fieldWidth : longint;
      item : ^Pchtype;
      itemPos : Plongint;
      itemLen : Plongint;
      listSize : longint;
      currentItem : longint;
      defaultItem : longint;
      boxWidth : longint;
      boxHeight : longint;
      exitType : TEExitType;
      shadow : Tboolean;
    end;

  TCDKITEMLIST=  TSItemList ;
  PCDKITEMLIST=^TCDKITEMLIST;
function newCDKItemlist(para1:PCDKSCREEN; para2:longint; para3:longint; para4:Pchar; para5:Pchar;
           para6:TCDK_CSTRING2; para7:longint; para8:longint; para9:Tboolean; para10:Tboolean):PCDKITEMLIST;cdecl;external libcdk;
function activateCDKItemlist(para1:PCDKITEMLIST; para2:Pchtype):longint;cdecl;external libcdk;

procedure setCDKItemlist(para1:PCDKITEMLIST; para2:TCDK_CSTRING2; para3:longint; para4:longint; para5:Tboolean);cdecl;external libcdk;
procedure setCDKItemlistValues(para1:PCDKITEMLIST; para2:TCDK_CSTRING2; para3:longint; para4:longint);cdecl;external libcdk;
function getCDKItemlistValues(para1:PCDKITEMLIST; para2:Plongint):PPchtype;cdecl;external libcdk;
procedure setCDKItemlistDefaultItem(para1:PCDKITEMLIST; para2:longint);cdecl;external libcdk;
function getCDKItemlistDefaultItem(para1:PCDKITEMLIST):longint;cdecl;external libcdk;
procedure setCDKItemlistCurrentItem(para1:PCDKITEMLIST; para2:longint);cdecl;external libcdk;
function getCDKItemlistCurrentItem(para1:PCDKITEMLIST):longint;cdecl;external libcdk;
procedure setCDKItemlistBox(para1:PCDKITEMLIST; para2:Tboolean);cdecl;external libcdk;
function getCDKItemlistBox(para1:PCDKITEMLIST):Tboolean;cdecl;external libcdk;
procedure drawCDKItemlistField(para1:PCDKITEMLIST; para2:Tboolean);cdecl;external libcdk;

//function injectCDKItemlist(obj,input : longint) : longint;
//function setCDKItemlistULChar(w,c : longint) : longint;
//function setCDKItemlistURChar(w,c : longint) : longint;
//function setCDKItemlistLLChar(w,c : longint) : longint;
//function setCDKItemlistLRChar(w,c : longint) : longint;
//function setCDKItemlistVerticalChar(w,c : longint) : longint;
//function setCDKItemlistHorizontalChar(w,c : longint) : longint;
//function setCDKItemlistBoxAttribute(w,c : longint) : longint;
//function setCDKItemlistBackgroundColor(w,c : longint) : longint;
//function setCDKItemlistBackgroundAttrib(w,c : longint) : longint;
//function drawCDKItemlist(obj,Box : longint) : longint;
//
//function eraseCDKItemlist(obj : longint) : longint;
//function moveCDKItemlist(obj,xpos,ypos,relative,refresh : longint) : longint;
//function positionCDKItemlist(widget : longint) : longint;
//function destroyCDKItemlist(obj : longint) : longint;
//function setCDKItemlistPreProcess(w,f,d : longint) : longint;
//function setCDKItemlistPostProcess(w,f,d : longint) : longint;


// === Konventiert am: 1-5-25 17:25:07 ===


implementation


//function injectCDKItemlist(obj,input : longint) : longint;
//begin
//  injectCDKItemlist:=injectCDKObject(obj,input,Int);
//end;
//
//function setCDKItemlistULChar(w,c : longint) : longint;
//begin
//  setCDKItemlistULChar:=setULCharOf(w,c);
//end;
//
//function setCDKItemlistURChar(w,c : longint) : longint;
//begin
//  setCDKItemlistURChar:=setURCharOf(w,c);
//end;
//
//function setCDKItemlistLLChar(w,c : longint) : longint;
//begin
//  setCDKItemlistLLChar:=setLLCharOf(w,c);
//end;
//
//function setCDKItemlistLRChar(w,c : longint) : longint;
//begin
//  setCDKItemlistLRChar:=setLRCharOf(w,c);
//end;
//
//function setCDKItemlistVerticalChar(w,c : longint) : longint;
//begin
//  setCDKItemlistVerticalChar:=setVTCharOf(w,c);
//end;
//
//function setCDKItemlistHorizontalChar(w,c : longint) : longint;
//begin
//  setCDKItemlistHorizontalChar:=setHZCharOf(w,c);
//end;
//
//function setCDKItemlistBoxAttribute(w,c : longint) : longint;
//begin
//  setCDKItemlistBoxAttribute:=setBXAttrOf(w,c);
//end;
//
//function setCDKItemlistBackgroundColor(w,c : longint) : longint;
//begin
//  setCDKItemlistBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
//end;
//
//function setCDKItemlistBackgroundAttrib(w,c : longint) : longint;
//begin
//  setCDKItemlistBackgroundAttrib:=setBKAttrOf(w,c);
//end;
//
//function drawCDKItemlist(obj,Box : longint) : longint;
//begin
//  drawCDKItemlist:=drawCDKObject(obj,Box);
//end;
//
//function eraseCDKItemlist(obj : longint) : longint;
//begin
//  eraseCDKItemlist:=eraseCDKObject(obj);
//end;
//
//function moveCDKItemlist(obj,xpos,ypos,relative,refresh : longint) : longint;
//begin
//  moveCDKItemlist:=moveCDKObject(obj,xpos,ypos,relative,refresh);
//end;
//
//function positionCDKItemlist(widget : longint) : longint;
//begin
//  positionCDKItemlist:=positionCDKObject(ObjOf(widget),widget^.win);
//end;
//
//function destroyCDKItemlist(obj : longint) : longint;
//begin
//  destroyCDKItemlist:=destroyCDKObject(obj);
//end;
//
//function setCDKItemlistPreProcess(w,f,d : longint) : longint;
//begin
//  setCDKItemlistPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
//end;
//
//function setCDKItemlistPostProcess(w,f,d : longint) : longint;
//begin
//  setCDKItemlistPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
//end;


end.
