unit fselect;

interface

uses
  ctypes, ncurses, cdk, cdk_config, cdkscreen, binding, scroll, entry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TSFileSelector = record
    obj: TCDKOBJS;
    parent: PWINDOW;
    win: PWINDOW;
    shadowWin: PWINDOW;
    entryField: PCDKENTRY;
    scrollField: PCDKSCROLL;
    dirContents: ^pchar;
    fileCounter: longint;
    pwd: pchar;
    pathname: pchar;
    xpos: longint;
    ypos: longint;
    boxHeight: longint;
    boxWidth: longint;
    fieldAttribute: Tchtype;
    fillerCharacter: Tchtype;
    highlight: Tchtype;
    dirAttribute: pchar;
    fileAttribute: pchar;
    linkAttribute: pchar;
    sockAttribute: pchar;
    exitType: TEExitType;
    shadow: Tboolean;
  end;
  PSFileSelector = ^TSFileSelector;

  TCDKFSELECT = TSFileSelector;
  PCDKFSELECT = ^TCDKFSELECT;

function newCDKFselect(para1: PCDKSCREEN; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: pchar; para7: pchar; para8: Tchtype; para9: Tchtype; para10: Tchtype;
  para11: pchar; para12: pchar; para13: pchar; para14: pchar; para15: Tboolean;
  para16: Tboolean): PCDKFSELECT; cdecl; external libcdk;

function activateCDKFselect(para1: PCDKFSELECT; para2: Pchtype): pchar; cdecl; external libcdk;
procedure setCDKFselect(para1: PCDKFSELECT; para2: pchar; para3: Tchtype; para4: Tchtype; para5: Tchtype;
  para6: pchar; para7: pchar; para8: pchar; para9: pchar; para10: Tboolean); cdecl; external libcdk;
function setCDKFselectDirectory(para1: PCDKFSELECT; para2: pchar): longint; cdecl; external libcdk;
function getCDKFselectDirectory(para1: PCDKFSELECT): pchar; cdecl; external libcdk;
procedure setCDKFselectFillerChar(para1: PCDKFSELECT; para2: Tchtype); cdecl; external libcdk;
function getCDKFselectFillerChar(para1: PCDKFSELECT): Tchtype; cdecl; external libcdk;
procedure setCDKFselectHighlight(para1: PCDKFSELECT; para2: Tchtype); cdecl; external libcdk;
function getCDKFselectHighlight(para1: PCDKFSELECT): Tchtype; cdecl; external libcdk;
procedure setCDKFselectDirAttribute(para1: PCDKFSELECT; para2: pchar); cdecl; external libcdk;
procedure setCDKFselectLinkAttribute(para1: PCDKFSELECT; para2: pchar); cdecl; external libcdk;
procedure setCDKFselectFileAttribute(para1: PCDKFSELECT; para2: pchar); cdecl; external libcdk;
procedure setCDKFselectSocketAttribute(para1: PCDKFSELECT; para2: pchar); cdecl; external libcdk;
function getCDKFselectDirAttribute(para1: PCDKFSELECT): pchar; cdecl; external libcdk;
function getCDKFselectLinkAttribute(para1: PCDKFSELECT): pchar; cdecl; external libcdk;
function getCDKFselectFileAttribute(para1: PCDKFSELECT): pchar; cdecl; external libcdk;
function getCDKFselectSocketAttribute(para1: PCDKFSELECT): pchar; cdecl; external libcdk;
procedure setCDKFselectBox(para1: PCDKFSELECT; para2: Tboolean); cdecl; external libcdk;
function getCDKFselectBox(para1: PCDKFSELECT): Tboolean; cdecl; external libcdk;
function setCDKFselectDirContents(para1: PCDKFSELECT): longint; cdecl; external libcdk;
function getCDKFselectDirContents(para1: PCDKFSELECT; para2: Plongint): PPchar; cdecl; external libcdk;
procedure setCDKFselectContents(para1: PCDKFSELECT; para2: TCDK_CSTRING2; para3: longint); cdecl; external libcdk;
function getCDKFselectContents(para1: PCDKFSELECT; para2: Plongint): PPchar; cdecl; external libcdk;
function getCDKFselectCurrentItem(para1: PCDKFSELECT): longint; cdecl; external libcdk;
procedure setCDKFselectCurrentItem(para1: PCDKFSELECT; para2: longint); cdecl; external libcdk;

procedure deleteFileCB(para1: TEObjectType; para2: pointer; para3: pointer); cdecl; external libcdk;
procedure setCDKFselectPreProcess(para1: PCDKFSELECT; para2: TPROCESSFN; para3: pointer); cdecl; external libcdk;
procedure setCDKFselectPostProcess(para1: PCDKFSELECT; para2: TPROCESSFN; para3: pointer); cdecl; external libcdk;

// === Konventiert am: 1-5-25 13:51:33 ===

//function injectCDKFselect(obj,input : longint) : longint;
//function setCDKFselectULChar(w,c : longint) : longint;
//function setCDKFselectURChar(w,c : longint) : longint;
//function setCDKFselectLLChar(w,c : longint) : longint;
//function setCDKFselectLRChar(w,c : longint) : longint;
//function setCDKFselectVerticalChar(w,c : longint) : longint;
//function setCDKFselectHorizontalChar(w,c : longint) : longint;
//function setCDKFselectBoxAttribute(w,c : longint) : longint;
//function setCDKFselectBackgroundColor(w,c : longint) : longint;
//function setCDKFselectBackgroundAttrib(w,c : longint) : longint;
//function drawCDKFselect(obj,Box : longint) : longint;
//function eraseCDKFselect(obj : longint) : longint;
//function moveCDKFselect(obj,xpos,ypos,relative,refresh : longint) : longint;
//function positionCDKFselect(widget : longint) : longint;
//function destroyCDKFselect(obj : longint) : longint;



implementation


//function injectCDKFselect(obj,input : longint) : longint;
//begin
//  injectCDKFselect:=injectCDKObject(obj,input,_String);
//end;
//
//function setCDKFselectULChar(w,c : longint) : longint;
//begin
//  setCDKFselectULChar:=setULCharOf(w,c);
//end;
//
//function setCDKFselectURChar(w,c : longint) : longint;
//begin
//  setCDKFselectURChar:=setURCharOf(w,c);
//end;
//
//function setCDKFselectLLChar(w,c : longint) : longint;
//begin
//  setCDKFselectLLChar:=setLLCharOf(w,c);
//end;
//
//function setCDKFselectLRChar(w,c : longint) : longint;
//begin
//  setCDKFselectLRChar:=setLRCharOf(w,c);
//end;
//
//function setCDKFselectVerticalChar(w,c : longint) : longint;
//begin
//  setCDKFselectVerticalChar:=setVTCharOf(w,c);
//end;
//
//function setCDKFselectHorizontalChar(w,c : longint) : longint;
//begin
//  setCDKFselectHorizontalChar:=setHZCharOf(w,c);
//end;
//
//function setCDKFselectBoxAttribute(w,c : longint) : longint;
//begin
//  setCDKFselectBoxAttribute:=setBXAttrOf(w,c);
//end;
//
//function setCDKFselectBackgroundColor(w,c : longint) : longint;
//begin
//  setCDKFselectBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
//end;
//
//function setCDKFselectBackgroundAttrib(w,c : longint) : longint;
//begin
//  setCDKFselectBackgroundAttrib:=setBKAttrOf(w,c);
//end;
//
//function drawCDKFselect(obj,Box : longint) : longint;
//begin
//  drawCDKFselect:=drawCDKObject(obj,Box);
//end;
//
//function eraseCDKFselect(obj : longint) : longint;
//begin
//  eraseCDKFselect:=eraseCDKObject(obj);
//end;
//
//function moveCDKFselect(obj,xpos,ypos,relative,refresh : longint) : longint;
//begin
//  moveCDKFselect:=moveCDKObject(obj,xpos,ypos,relative,refresh);
//end;
//
//function positionCDKFselect(widget : longint) : longint;
//begin
//  positionCDKFselect:=positionCDKObject(ObjOf(widget),widget^.win);
//end;
//
//function destroyCDKFselect(obj : longint) : longint;
//begin
//  destroyCDKFselect:=destroyCDKObject(obj);
//end;


end.
