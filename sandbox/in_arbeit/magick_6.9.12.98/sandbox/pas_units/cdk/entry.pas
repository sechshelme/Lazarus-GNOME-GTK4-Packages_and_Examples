unit entry;

interface

uses
  ctypes, ncurses, cdk, cdkscreen, cdk_objs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PSEntry = ^TSEntry;
  TENTRYCB = procedure(entry: PSEntry; character: Tchtype); cdecl;

  TSEntry = record
    obj: TCDKOBJS;
    parent: PWINDOW;
    win: PWINDOW;
    shadowWin: PWINDOW;
    labelWin: PWINDOW;
    fieldWin: PWINDOW;
    _label: Pchtype;
    labelLen: longint;
    titleAdj: longint;
    fieldAttr: Tchtype;
    fieldWidth: longint;
    info: pchar;
    infoWidth: longint;
    screenCol: longint;
    leftChar: longint;
    min: longint;
    max: longint;
    boxWidth: longint;
    boxHeight: longint;
    exitType: TEExitType;
    dispType: TEDisplayType;
    shadow: Tboolean;
    filler: Tchtype;
    hidden: Tchtype;
    callbackfn: TENTRYCB;
    callbackData: pointer;
  end;

  TCDKENTRY = TSEntry;
  PCDKENTRY = ^TCDKENTRY;


function newCDKEntry(para1: PCDKSCREEN; para2: longint; para3: longint; para4: pchar; para5: pchar;
  para6: Tchtype; para7: Tchtype; para8: TEDisplayType; para9: longint; para10: longint;
  para11: longint; para12: Tboolean; para13: Tboolean): PCDKENTRY; cdecl; external libcdk;

function activateCDKEntry(para1: PCDKENTRY; para2: Pchtype): pchar; cdecl; external libcdk;

procedure setCDKEntry(para1: PCDKENTRY; para2: pchar; para3: longint; para4: longint; para5: Tboolean); cdecl; external libcdk;
procedure setCDKEntryValue(para1: PCDKENTRY; para2: pchar); cdecl; external libcdk;
function getCDKEntryValue(para1: PCDKENTRY): pchar; cdecl; external libcdk;
procedure setCDKEntryMax(para1: PCDKENTRY; para2: longint); cdecl; external libcdk;
function getCDKEntryMax(para1: PCDKENTRY): longint; cdecl; external libcdk;
procedure setCDKEntryMin(para1: PCDKENTRY; para2: longint); cdecl; external libcdk;
function getCDKEntryMin(para1: PCDKENTRY): longint; cdecl; external libcdk;
procedure setCDKEntryFillerChar(para1: PCDKENTRY; para2: Tchtype); cdecl; external libcdk;
function getCDKEntryFillerChar(para1: PCDKENTRY): Tchtype; cdecl; external libcdk;
procedure setCDKEntryHiddenChar(para1: PCDKENTRY; para2: Tchtype); cdecl; external libcdk;
function getCDKEntryHiddenChar(para1: PCDKENTRY): Tchtype; cdecl; external libcdk;
procedure setCDKEntryBox(para1: PCDKENTRY; para2: Tboolean); cdecl; external libcdk;
function getCDKEntryBox(para1: PCDKENTRY): Tboolean; cdecl; external libcdk;

procedure setCDKEntryHighlight(para1: PCDKENTRY; para2: Tchtype; para3: Tboolean); cdecl; external libcdk;
procedure cleanCDKEntry(para1: PCDKENTRY); cdecl; external libcdk;

procedure setCDKEntryCB(para1: PCDKENTRY; para2: TENTRYCB); cdecl; external libcdk;

//function setCDKEntryCBArgs(entry,argPtr : longint) : longint;
//function getCDKEntryCBArgs(entry,argType : longint) : TargType;
//function injectCDKEntry(obj,input : longint) : longint;

//function setCDKEntryULChar(w,c : longint) : longint;
//function setCDKEntryURChar(w,c : longint) : longint;
//function setCDKEntryLLChar(w,c : longint) : longint;
//function setCDKEntryLRChar(w,c : longint) : longint;
//function setCDKEntryVerticalChar(w,c : longint) : longint;
//function setCDKEntryHorizontalChar(w,c : longint) : longint;
//function setCDKEntryBoxAttribute(w,c : longint) : longint;
//function setCDKEntryBackgroundColor(w,c : longint) : longint;
//function setCDKEntryBackgroundAttrib(w,c : longint) : longint;
//function drawCDKEntry(obj,box : longint) : longint;
//function eraseCDKEntry(obj : longint) : longint;
//function moveCDKEntry(obj,xpos,ypos,relative,refresh : longint) : longint;
//function positionCDKEntry(widget : longint) : longint;
//function destroyCDKEntry(obj : longint) : longint;
//function setCDKEntryPreProcess(w,f,d : longint) : longint;
//function setCDKEntryPostProcess(w,f,d : longint) : longint;

// === Konventiert am: 1-5-25 13:56:04 ===


implementation


//function setCDKEntryCBArgs(entry,argPtr : longint) : longint;
//begin
//  setCDKEntryCBArgs:=(entry^.callbackData):=(pointer(argPtr));
//end;
//
//function getCDKEntryCBArgs(entry,argType : longint) : TargType;
//begin
//  getCDKEntryCBArgs:=TargType(entry^.callbackData);
//end;

//function injectCDKEntry(obj,input : longint) : longint;
//begin
//  injectCDKEntry:=injectCDKObject(obj,input,_String);
//end;

//function setCDKEntryULChar(w,c : longint) : longint;
//begin
//  setCDKEntryULChar:=setULCharOf(w,c);
//end;
//
//function setCDKEntryURChar(w,c : longint) : longint;
//begin
//  setCDKEntryURChar:=setURCharOf(w,c);
//end;
//
//function setCDKEntryLLChar(w,c : longint) : longint;
//begin
//  setCDKEntryLLChar:=setLLCharOf(w,c);
//end;
//
//function setCDKEntryLRChar(w,c : longint) : longint;
//begin
//  setCDKEntryLRChar:=setLRCharOf(w,c);
//end;
//
//function setCDKEntryVerticalChar(w,c : longint) : longint;
//begin
//  setCDKEntryVerticalChar:=setVTCharOf(w,c);
//end;
//
//function setCDKEntryHorizontalChar(w,c : longint) : longint;
//begin
//  setCDKEntryHorizontalChar:=setHZCharOf(w,c);
//end;
//
//function setCDKEntryBoxAttribute(w,c : longint) : longint;
//begin
//  setCDKEntryBoxAttribute:=setBXAttrOf(w,c);
//end;
//
//function setCDKEntryBackgroundColor(w,c : longint) : longint;
//begin
//  setCDKEntryBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
//end;
//
//function setCDKEntryBackgroundAttrib(w,c : longint) : longint;
//begin
//  setCDKEntryBackgroundAttrib:=setBKAttrOf(w,c);
//end;
//
//function drawCDKEntry(obj,box : longint) : longint;
//begin
//  drawCDKEntry:=drawCDKObject(obj,box);
//end;
//
//function eraseCDKEntry(obj : longint) : longint;
//begin
//  eraseCDKEntry:=eraseCDKObject(obj);
//end;
//
//function moveCDKEntry(obj,xpos,ypos,relative,refresh : longint) : longint;
//begin
//  moveCDKEntry:=moveCDKObject(obj,xpos,ypos,relative,refresh);
//end;
//
//function positionCDKEntry(widget : longint) : longint;
//begin
//  positionCDKEntry:=positionCDKObject(ObjOf(widget),widget^.win);
//end;
//
//function destroyCDKEntry(obj : longint) : longint;
//begin
//  destroyCDKEntry:=destroyCDKObject(obj);
//end;
//
//function setCDKEntryPreProcess(w,f,d : longint) : longint;
//begin
//  setCDKEntryPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
//end;
//
//function setCDKEntryPostProcess(w,f,d : longint) : longint;
//begin
//  setCDKEntryPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
//end;


end.
