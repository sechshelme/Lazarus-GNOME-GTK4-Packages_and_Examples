unit cdk;

interface

uses
  ctypes, ncurses;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libcdk = 'libcdk';
  {$ENDIF}

  {$IFDEF mswindows}
  libcdk = 'libcdk.dll';  // ????
  {$ENDIF}

type
  PFILE = Pointer;

  Tmode_t=UInt32;

  // /usr/include/x86_64-linux-gnu/sys/stat.h
type
  PStat = Pointer;

function stat(path: pansichar; buf: PStat): integer; cdecl; external 'c' name 'stat';

// ==== ncurses

type
  Tchtype = chtype;
  Pchtype = ^Tchtype;
  PPchtype = ^Pchtype;


  // =====================

var
  optind: longint; cvar;external libcdk;
  optarg: pchar; cvar;external libcdk;

const
  INT_MAX = 2147483647;
  INT_MIN = (-(INT_MAX)) - 1;

const
  HAVE_LIBDMALLOC = 0;
  HAVE_LIBDBMALLOC = 0;

type
  PEObjectType = ^TEObjectType;
  TEObjectType = longint;

const
  vNULL = 0;
  vALPHALIST = 1;
  vBUTTON = 2;
  vBUTTONBOX = 3;
  vCALENDAR = 4;
  vDIALOG = 5;
  vDSCALE = 6;
  vENTRY = 7;
  vFSCALE = 8;
  vFSELECT = 9;
  vFSLIDER = 10;
  vGRAPH = 11;
  vHISTOGRAM = 12;
  vITEMLIST = 13;
  vLABEL = 14;
  vMARQUEE = 15;
  vMATRIX = 16;
  vMENTRY = 17;
  vMENU = 18;
  vRADIO = 19;
  vSCALE = 20;
  vSCROLL = 21;
  vSELECTION = 22;
  vSLIDER = 23;
  vSWINDOW = 24;
  vTEMPLATE = 25;
  vTRAVERSE = 26;
  vUSCALE = 27;
  vUSLIDER = 28;
  vVIEWER = 29;

type
  PEDisplayType = ^TEDisplayType;
  TEDisplayType = longint;

const
  vINVALID = 0;
  vCHAR = 1;
  vHCHAR = 2;
  vINT = 3;
  vHINT = 4;
  vMIXED = 5;
  vHMIXED = 6;
  vUCHAR = 7;
  vLCHAR = 8;
  vUHCHAR = 9;
  vLHCHAR = 10;
  vUMIXED = 11;
  vLMIXED = 12;
  vUHMIXED = 13;
  vLHMIXED = 14;
  vVIEWONLY = 15;

type
  PEHistogramDisplayType = ^TEHistogramDisplayType;
  TEHistogramDisplayType = longint;

const
  vNONE = 0;
  vPERCENT = 1;
  vFRACTION = 2;
  vREAL = 3;

type
  PEGraphDisplayType = ^TEGraphDisplayType;
  TEGraphDisplayType = longint;

const
  vPLOT = 0;
  vLINE = 1;

type
  PEStripType = ^TEStripType;
  TEStripType = longint;

const
  vFRONT = 0;
  vBACK = 1;
  vBOTH = 2;

type
  PEExitType = ^TEExitType;
  TEExitType = longint;

const
  vEARLY_EXIT = 0;
  vESCAPE_HIT = 1;
  vNORMAL = 2;
  vNEVER_ACTIVATED = 3;
  vERROR = 4;

type
  Pboolean = ^Tboolean;
  Tboolean = Boolean32;  // typedef int boolean;

const
  LEFT = 9000;
  RIGHT = 9001;
  CENTER = 9002;
  TOP = 9003;
  BOTTOM = 9004;
  HORIZONTAL = 9005;
  VERTICAL = 9006;
  FULL = 9007;
  NONE = 0;
  ROW = 1;
  COL = 2;
  MAX_BINDINGS = 300;
  MAX_ITEMS = 2000;
  MAX_BUTTONS = 200;


var
  CDKDEBUG: PFILE; cvar;external libcdk;
{
 * =========================================================
 *   Declare Debugging Routines.
 * =========================================================
  }

function startCDKDebug(filename: pchar): PFILE; cdecl; external libcdk;
procedure writeCDKDebugMessage(fd: PFILE; filename: pchar; _function: pchar; line: longint; message: pchar); cdecl; external libcdk;
procedure stopCDKDebug(fd: PFILE); cdecl; external libcdk;


// In ncurses als external vorhaden
//function mvwhline(win,y,x,c,n : longint) : LongInt;
//function mvwvline(win,y,x,c,n : longint) : LongInt;

function MAXIMUM(a, b: longint): longint;
function MINIMUM(a, b: longint): longint;
function HALF(a: longint): longint;
function COLOR_PAIR(a: longint): longint;
function CONTROL(c: longint): longint;

// === Konventiert am: 29-4-25 19:28:30 ===


implementation


//function mvwhline(win, y, x, c, n: longint): LongInt;
//var
//   if_local1 : Boolean;
//(* result types are not known *)
//begin
//  if ERR<>0  then
//    if_local1:=ERR
//  else
////    if_local1:=whline(win,c,n);
////  mvwhline:=(wmove(win,y,x))=(if_local1);
//end;
//
//function mvwvline(win, y, x, c, n: longint): LongInt;
//var
//   if_local1 : Boolean;
//(* result types are not known *)
//begin
//  if ERR then
//    if_local1:=ERR
//  else
////    if_local1:=wvline(win,c,n);
////  mvwvline:=(wmove(win,y,x))=(if_local1);
//end;

function MAXIMUM(a, b: longint): longint;
begin
  if a > b then begin
    Result := a;
  end else begin
    Result := b;
  end;
end;

function MINIMUM(a, b: longint): longint;
begin
  if a < b then begin
    Result := a;
  end else begin
    Result := b;
  end;
end;

function HALF(a: longint): longint;
begin
  HALF := a shr 1;
end;

function COLOR_PAIR(a: longint): longint;
begin
  //  COLOR_PAIR:=A_NORMAL;
end;

function CONTROL(c: longint): longint;
begin
  Result := c and $1f;
end;


end.
