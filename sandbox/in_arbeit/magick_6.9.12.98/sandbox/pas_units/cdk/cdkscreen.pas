unit cdkscreen;

interface

uses
  ncurses, cdk;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  MAX_OBJECTS = 1000;

const
  CDKSCREEN_NOEXIT = 0;
  CDKSCREEN_EXITOK = 1;
  CDKSCREEN_EXITCANCEL = 2;

type
  PCDKSCREEN = ^TCDKSCREEN;

  PPCDKOBJS = ^PCDKOBJS;
  PCDKOBJS = ^TCDKOBJS;
  TCDKOBJS = record
    screenIndex : longint;
    screen : PCDKSCREEN;
    fn : Pointer; //  PCDKFUNCS;
    box : Tboolean;
    borderSize : longint;
    acceptsFocus : Tboolean;
    hasFocus : Tboolean;
    isVisible : Tboolean;
    inputWindow : PWINDOW;
    dataPtr : pointer;
//    resultData :  TCDKDataUnion;
    bindingCount : dword;
    bindingList : Pointer; // PCDKBINDING;
    title : ^Pchtype;
    titlePos : Plongint;
    titleLen : Plongint;
    titleLines : longint;
    ULChar : Tchtype;
    URChar : Tchtype;
    LLChar : Tchtype;
    LRChar : Tchtype;
    VTChar : Tchtype;
    HZChar : Tchtype;
    BXAttr : Tchtype;
    exitType : TEExitType;
    earlyExit : TEExitType;
//    preProcessFunction : TPROCESSFN;
    preProcessData : pointer;
//    postProcessFunction : TPROCESSFN;
    postProcessData : pointer;
  end;

  PEExitStatus = ^TEExitStatus;
  TEExitStatus = longint;

  TSScreen = record
    window: PWINDOW;
    obj: PPCDKOBJS;
    objectCount: longint;
    objectLimit: longint;
    exitStatus: TEExitStatus;
    objectFocus: longint;
  end;
  PSScreen = ^TSScreen;

  TCDKSCREEN = TSScreen;

function initCDKScreen(para1: PWINDOW): PCDKSCREEN; cdecl; external libcdk;
function setDefaultCDKScreen(para1: longint): PCDKSCREEN; cdecl; external libcdk;
procedure registerCDKObject(para1: PCDKSCREEN; para2: TEObjectType; para3: pointer); cdecl; external libcdk;
procedure reRegisterCDKObject(para1: TEObjectType; para2: pointer); cdecl; external libcdk;
procedure unregisterCDKObject(para1: TEObjectType; para2: pointer); cdecl; external libcdk;
procedure raiseCDKObject(para1: TEObjectType; para2: pointer); cdecl; external libcdk;
procedure lowerCDKObject(para1: TEObjectType; para2: pointer); cdecl; external libcdk;
procedure refreshCDKWindow(para1: PWINDOW); cdecl; external libcdk;
procedure refreshCDKScreen(para1: PCDKSCREEN); cdecl; external libcdk;
procedure drawCDKScreen(para1: PCDKSCREEN); cdecl; external libcdk;
procedure eraseCDKScreen(para1: PCDKSCREEN); cdecl; external libcdk;
procedure destroyCDKScreenObjects(cdkscreen: PCDKSCREEN); cdecl; external libcdk;
procedure destroyCDKScreen(para1: PCDKSCREEN); cdecl; external libcdk;
procedure endCDK; cdecl; external libcdk;
procedure initCDKColor; cdecl; external libcdk;

// === Konventiert am: 29-4-25 19:51:11 ===


implementation



end.
