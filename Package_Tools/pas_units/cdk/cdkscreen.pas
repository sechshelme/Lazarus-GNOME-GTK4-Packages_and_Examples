unit cdkscreen;

interface

uses
 ncurses, cdk;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  CDKSCREEN_H = 1;

const
  MAX_OBJECTS = 1000;

type
  PCDKOBJS = ^TCDKOBJS;
  TCDKOBJS = record
  end;

  PEExitStatus = ^TEExitStatus;
  TEExitStatus = longint;

const
  CDKSCREEN_NOEXIT = 0;
  CDKSCREEN_EXITOK = 1;
  CDKSCREEN_EXITCANCEL = 2;

type
  TSScreen = record
    window: PWINDOW;
    obj: ^PCDKOBJS;
    objectCount: longint;
    objectLimit: longint;
    exitStatus: TEExitStatus;
    objectFocus: longint;
  end;
  PSScreen = ^TSScreen;

  TCDKSCREEN=  TSScreen  ;
  PCDKSCREEN=PSScreen;

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
