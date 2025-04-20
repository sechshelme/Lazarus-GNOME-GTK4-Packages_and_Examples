{$IFDEF read_interface}


{$ifdef WIN32}
function Tk_AttachHWND(tkwin:TTk_Window; hwnd:THWND):TWindow;cdecl;external libtkstub8_6;
function Tk_GetHINSTANCE:THINSTANCE;cdecl;external libtkstub8_6;
function Tk_GetHWND(window:TWindow):THWND;cdecl;external libtkstub8_6;
function Tk_HWNDToWindow(hwnd:THWND):TTk_Window;cdecl;external libtkstub8_6;
procedure Tk_PointerEvent(hwnd:THWND; x:longint; y:longint);cdecl;external libtkstub8_6;
function Tk_TranslateWinEvent(hwnd:THWND; message:TUINT; wParam:TWPARAM; lParam:TLPARAM; result:PLRESULT):longint;cdecl;external libtkstub8_6;
{$endif}

{$ifdef darwin}
procedure Tk_MacOSXSetEmbedHandler(registerWinProcPtr:PTk_MacOSXEmbedRegisterWinProc; getPortProcPtr:PTk_MacOSXEmbedGetGrafPortProc; containerExistProcPtr:PTk_MacOSXEmbedMakeContainerExistProc; getClipProc:PTk_MacOSXEmbedGetClipProc; getOffsetProc:PTk_MacOSXEmbedGetOffsetInParentProc);cdecl;external libtkstub8_6;
procedure Tk_MacOSXTurnOffMenus;cdecl;external libtkstub8_6;
procedure Tk_MacOSXTkOwnsCursor(tkOwnsIt:longint);cdecl;external libtkstub8_6;
procedure TkMacOSXInitMenus(interp:PTcl_Interp);cdecl;external libtkstub8_6;
procedure TkMacOSXInitAppleEvents(interp:PTcl_Interp);cdecl;external libtkstub8_6;
procedure TkGenWMConfigureEvent(tkwin:TTk_Window; x:longint; y:longint; width:longint; height:longint;
            flags:longint);cdecl;external libtkstub8_6;
procedure TkMacOSXInvalClipRgns(tkwin:TTk_Window);cdecl;external libtkstub8_6;
function TkMacOSXGetDrawablePort(drawable:TDrawable):pointer;cdecl;external libtkstub8_6;
function TkMacOSXGetRootControl(drawable:TDrawable):pointer;cdecl;external libtkstub8_6;
procedure Tk_MacOSXSetupTkNotifier;cdecl;external libtkstub8_6;
function Tk_MacOSXIsAppInFront:longint;cdecl;external libtkstub8_6;
function Tk_MacOSXGetTkWindow(w:pointer):TTk_Window;cdecl;external libtkstub8_6;
function Tk_MacOSXGetCGContextForDrawable(drawable:TDrawable):pointer;cdecl;external libtkstub8_6;
function Tk_MacOSXGetNSWindowForDrawable(drawable:TDrawable):pointer;cdecl;external libtkstub8_6;
procedure TkGenWMConfigureEvent_(tkwin:TTk_Window; x:longint; y:longint; width:longint; height:longint;
            flags:longint);cdecl;external libtkstub8_6;
{$endif}
type
  PTkPlatStubs = ^TTkPlatStubs;
  TTkPlatStubs = record
    end;
  var
    tkPlatStubsPtr : PTkPlatStubs;cvar;external libtkstub8_6;


// === Konventiert am: 15-4-25 13:27:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
