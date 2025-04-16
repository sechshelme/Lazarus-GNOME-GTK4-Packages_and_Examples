unit tkInt;

interface

uses
  x, xlib, ctypes, tcl, tk, tk_tcl_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type

  PTkpCursor = ^TTkpCursor;
  TTkpCursor = record
  end;

  PTkRegion = ^TTkRegion;
  TTkRegion = record
  end;

  PTkBindInfo = ^TTkBindInfo;
  TTkBindInfo = record
  end;


  TkColormap = record
  end;
  PTkColormap = ^TkColormap;

  TkFontAttributes = record
  end;
  PTkFontAttributes = ^TkFontAttributes;

  TkGrabEvent = record
  end;
  PTkGrabEvent = ^TkGrabEvent;

  TkStressedCmap = record
  end;
  PTkStressedCmap = ^TkStressedCmap;

  PTkBusy = ^TTkBusy;
  TTkBusy = PBusy;

  PTkCursor = ^TTkCursor;
  TTkCursor = record
  end;

  PTkCaret = ^TTkCaret;
  TTkCaret = record
  end;

const
  TK_DISPLAY_COLLAPSE_MOTION_EVENTS = 1 shl 0;
  TK_DISPLAY_USE_IM = 1 shl 1;
  TK_DISPLAY_WM_TRACING = 1 shl 3;
  TK_DISPLAY_IN_WARP = 1 shl 4;
  TK_DISPLAY_USE_XKB = 1 shl 5;

type
  TlockUsage = longint;

const
  LU_IGNORE = 0;
  LU_CAPS = 1;
  LU_SHIFT = 2;

type
  PTkErrorHandler = ^TTkErrorHandler;

  PTkDisplay = ^TTkDisplay;
  TTkDisplay = record
  end;

  TTkErrorHandler = record
  end;

  PTkEventHandler = ^TTkEventHandler;
  TTkEventHandler = record
  end;

  PTkMainInfo = ^TTkMainInfo;
  TTkMainInfo = record
  end;
  PTkPredefBitmap = ^TTkPredefBitmap;
  TTkPredefBitmap = record
  end;

type
  PTkWindow = ^TTkWindow;
  TTkWindow = record
  end;

var
  tkStateStrings: PPchar; cvar;external libtk8_6;
  tkCompoundStrings: PPchar; cvar;external libtk8_6;

type
  PTkKeyEvent = ^TTkKeyEvent;
  TTkKeyEvent = record
  end;

const
  TK_MAKE_MENU_TEAROFF = 0;
  TK_MAKE_MENU_POPUP = 1;
  TK_MAKE_MENU_DROPDOWN = 2;

type
  PTkEnsemble = ^TTkEnsemble;
  TTkEnsemble = record
  end;

  PTkStateMap = ^TTkStateMap;
  TTkStateMap = record
  end;

  PTkpClipMask = ^TTkpClipMask;
  TTkpClipMask = record
  end;

const
  TKP_CLIP_PIXMAP = 0;
  TKP_CLIP_REGION = 1;

  TK_GRAB_NONE = 0;
  TK_GRAB_IN_TREE = 1;
  TK_GRAB_ANCESTOR = 2;
  TK_GRAB_EXCLUDED = 3;

  TK_ISOLATE_END = 32;

const
  EMBEDDED_APP_WANTS_FOCUS = NotifyNormal + 20;

  META_MASK = AnyModifier shl 1;
  ALT_MASK = AnyModifier shl 2;
  EXTENDED_MASK = AnyModifier shl 3;
  ALL_BUTTONS = (((Button1Mask or Button2Mask) or Button3Mask) or Button4Mask) or Button5Mask;

function TkGetButtonMask(para1: dword): dword; cdecl; external libtk8_6;

var
  tkBorderObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkBitmapObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkColorObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkCursorObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkFontObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkStateKeyObjType: TTcl_ObjType; cvar;external libtk8_6;
  tkTextIndexType: TTcl_ObjType; cvar;external libtk8_6;

  tkBezierSmoothMethod: TTk_SmoothMethod; cvar;external libtk8_6;
  tkBitmapImageType: TTk_ImageType; cvar;external libtk8_6;
  tkImgFmtGIF: TTk_PhotoImageFormat; cvar;external libtk8_6;
  tkHandleEventProc: procedure(eventPtr: PXEvent); cvar;external libtk8_6;
  tkImgFmtPNG: TTk_PhotoImageFormat; cvar;external libtk8_6;
  tkImgFmtPPM: TTk_PhotoImageFormat; cvar;external libtk8_6;
  tkMainWindowList: PTkMainInfo; cvar;external libtk8_6;
  tkPhotoImageType: TTk_ImageType; cvar;external libtk8_6;
  tkPredefBitmapTable: TTcl_HashTable; cvar;external libtk8_6;
  tkWebColors: array[0..19] of pchar; cvar;external libtk8_6;


procedure Tcl_Panic(para1: pchar; args: array of const); cdecl; external libtk8_6;
procedure Tcl_Panic(para1: pchar); cdecl; external libtk8_6;

function Ttk_Init(interp: PTcl_Interp): longint; cdecl; external libtk8_6;
procedure Ttk_TkDestroyedHandler(interp: PTcl_Interp); cdecl; external libtk8_6;

function Tk_BellObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_BindObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_BindtagsObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_BusyObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ButtonObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_CanvasObjCmd(clientData: TClientData; interp: PTcl_Interp; argc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_CheckbuttonObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ClipboardObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ChooseColorObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ChooseDirectoryObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_DestroyObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_EntryObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_EventObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_FrameObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_FocusObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_FontObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_GetOpenFileObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_GetSaveFileObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_GrabObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_GridObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ImageObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_LabelObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_LabelframeObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ListboxObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_LowerObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_MenuObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_MenubuttonObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_MessageBoxObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_MessageObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_PanedWindowObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_OptionObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_PackObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_PlaceObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_RadiobuttonObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_RaiseObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ScaleObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ScrollbarObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_SelectionObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_SendObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_SpinboxObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_TextObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_TkwaitObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_ToplevelObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_UpdateObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_WinfoObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_WmObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function Tk_GetDoublePixelsFromObj(interp: PTcl_Interp; tkwin: TTk_Window; objPtr: PTcl_Obj; doublePtr: Pdouble): longint; cdecl; external libtk8_6;

function TkSetGeometryContainer(interp: PTcl_Interp; tkwin: TTk_Window; Name: pchar): longint; cdecl; external libtk8_6;

procedure TkFreeGeometryContainer(tkwin: TTk_Window; Name: pchar); cdecl; external libtk8_6;
procedure TkEventInit; cdecl; external libtk8_6;
procedure TkRegisterObjTypes; cdecl; external libtk8_6;
function TkDeadAppObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function TkCanvasGetCoordObj(interp: PTcl_Interp; canvas: TTk_Canvas; obj: PTcl_Obj; doublePtr: Pdouble): longint; cdecl; external libtk8_6;
function TkGetDoublePixels(interp: PTcl_Interp; tkwin: TTk_Window; _string: pchar; doublePtr: Pdouble): longint; cdecl; external libtk8_6;
function TkPostscriptImage(interp: PTcl_Interp; tkwin: TTk_Window; psInfo: TTk_PostscriptInfo; ximage: PXImage; x: longint;
  y: longint; Width: longint; Height: longint): longint; cdecl; external libtk8_6;
procedure TkMapTopFrame(tkwin: TTk_Window); cdecl; external libtk8_6;
function TkpGetBindingXEvent(interp: PTcl_Interp): PXEvent; cdecl; external libtk8_6;
procedure TkCreateExitHandler(proc: PTcl_ExitProc; clientData: pointer); cdecl; external libtk8_6;
procedure TkDeleteExitHandler(proc: PTcl_ExitProc; clientData: TClientData); cdecl; external libtk8_6;

var
  TkFinalize: TTcl_ExitProc; cvar;external libtk8_6;
  TkFinalizeThread: TTcl_ExitProc; cvar;external libtk8_6;

procedure TkpBuildRegionFromAlphaData(region: TTkRegion; x: dword; y: dword; Width: dword; Height: dword;
  dataPtr: pbyte; pixelStride: dword; lineStride: dword); cdecl; external libtk8_6;
procedure TkAppendPadAmount(bufferObj: PTcl_Obj; buffer: pchar; pad1: longint; pad2: longint); cdecl; external libtk8_6;
function TkParsePadAmount(interp: PTcl_Interp; tkwin: TTk_Window; objPtr: PTcl_Obj; pad1Ptr: Plongint; pad2Ptr: Plongint): longint; cdecl; external libtk8_6;
procedure TkFocusSplit(winPtr: PTkWindow); cdecl; external libtk8_6;
procedure TkFocusJoin(winPtr: PTkWindow); cdecl; external libtk8_6;
function TkpAlwaysShowSelection(tkwin: TTk_Window): longint; cdecl; external libtk8_6;
procedure TkpDrawCharsInContext(display: PDisplay; drawable: TDrawable; gc: TGC; tkfont: TTk_Font; Source: pchar;
  numBytes: longint; rangeStart: longint; rangeLength: longint; x: longint; y: longint); cdecl; external libtk8_6;
procedure TkpDrawAngledCharsInContext(display: PDisplay; drawable: TDrawable; gc: TGC; tkfont: TTk_Font; Source: pchar;
  numBytes: longint; rangeStart: longint; rangeLength: longint; x: double; y: double;
  angle: double); cdecl; external libtk8_6;
function TkpMeasureCharsInContext(tkfont: TTk_Font; Source: pchar; numBytes: longint; rangeStart: longint; rangeLength: longint;
  maxLength: longint; flags: longint; lengthPtr: Plongint): longint; cdecl; external libtk8_6;
procedure TkUnderlineCharsInContext(display: PDisplay; drawable: TDrawable; gc: TGC; tkfont: TTk_Font; _string: pchar;
  numBytes: longint; x: longint; y: longint; firstByte: longint; lastByte: longint); cdecl; external libtk8_6;
procedure TkpGetFontAttrsForChar(tkwin: TTk_Window; tkfont: TTk_Font; c: longint; faPtr: PTkFontAttributes); cdecl; external libtk8_6;
function TkNewWindowObj(tkwin: TTk_Window): PTcl_Obj; cdecl; external libtk8_6;
procedure TkpShowBusyWindow(busy: TTkBusy); cdecl; external libtk8_6;
procedure TkpHideBusyWindow(busy: TTkBusy); cdecl; external libtk8_6;
procedure TkpMakeTransparentWindowExist(tkwin: TTk_Window; parent: TWindow); cdecl; external libtk8_6;
procedure TkpCreateBusy(winPtr: PTk_FakeWin; tkRef: TTk_Window; parentPtr: PWindow; tkParent: TTk_Window; busy: TTkBusy); cdecl; external libtk8_6;
function TkBackgroundEvalObjv(interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj; flags: longint): longint; cdecl; external libtk8_6;
procedure TkSendVirtualEvent(tgtWin: TTk_Window; eventName: pchar; detail: PTcl_Obj); cdecl; external libtk8_6;
function TkMakeEnsemble(interp: PTcl_Interp; nsname: pchar; Name: pchar; clientData: TClientData; map: PTkEnsemble): TTcl_Command; cdecl; external libtk8_6;
function TkInitTkCmd(interp: PTcl_Interp; clientData: TClientData): longint; cdecl; external libtk8_6;
function TkInitFontchooser(interp: PTcl_Interp; clientData: TClientData): longint; cdecl; external libtk8_6;
procedure TkpWarpPointer(dispPtr: PTkDisplay); cdecl; external libtk8_6;
procedure TkpCancelWarp(dispPtr: PTkDisplay); cdecl; external libtk8_6;
function TkListCreateFrame(clientData: TClientData; interp: PTcl_Interp; listObj: PTcl_Obj; toplevel: longint; nameObj: PTcl_Obj): longint; cdecl; external libtk8_6;

function TkParseColor(display: PDisplay; map: TColormap; spec: pchar; colorPtr: PXColor): TStatus; cdecl; external libtk8_6;

procedure TkUnixSetXftClipRegion(clipRegion: TTkRegion); cdecl; external libtk8_6;

procedure TkpCopyRegion(dst: TTkRegion; src: TTkRegion); cdecl; external libtk8_6;


function TkUtfToUniChar(para1: pchar; para2: Plongint): longint; cdecl; external libtk8_6;
function TkUniCharToUtf(para1: longint; para2: pchar): longint; cdecl; external libtk8_6;
function TkUtfPrev(para1: pchar; para2: pchar): pchar; cdecl; external libtk8_6;
function TkUtfAtIndex(src: pchar; index: longint): pchar; cdecl; external libtk8_6;

function TkUnsupported1ObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function SquareObjCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl; external libtk8_6;
function TkOldTestInit(interp: PTcl_Interp): longint; cdecl; external libtk8_6;


function TkplatformtestInit(interp: PTcl_Interp): longint; cdecl; external libtk8_6;

function UCHAR(klass: longint): byte;
function TK_OPTION_ENUM_VAR: longint;
function TkplatformtestInit(x: longint): longint;

// === Konventiert am: 16-4-25 19:41:17 ===


implementation


function TK_OPTION_ENUM_VAR: longint;
begin
  TK_OPTION_ENUM_VAR := (longint((sizeof(TTk_OptionType)) and ((sizeof(longint)) - 1))) shl 6;
end;

function UCHAR(klass: longint): byte;
begin
  UCHAR := byte(klass);
end;

function TkplatformtestInit(x: longint): longint;
begin
  TkplatformtestInit := TCL_OK;
end;


end.
