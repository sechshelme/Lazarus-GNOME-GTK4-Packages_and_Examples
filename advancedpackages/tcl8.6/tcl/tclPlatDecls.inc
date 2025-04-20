{$IFDEF read_interface}

  {$IFDEF MSWINDOWS}
type
  TTCHAR = widechar;
  PTCHAR = ^TTCHAR;
const
  _TCHAR_DEFINED = True;
  {$ENDIF}

{$IFDEF MSWINDOWS}
function Tcl_WinUtfToTChar(str: pchar; len: longint; dsPtr: PTcl_DString): PTCHAR; cdecl; external libtclstub8_6;
function Tcl_WinTCharToUtf(str: PTCHAR; len: longint; dsPtr: PTcl_DString): pchar; cdecl; external libtclstub8_6;
procedure TclWinConvertError_(errCode: dword); cdecl; external libtclstub8_6;
{$ENDIF}
{$IFDEF DARWIN}
function Tcl_MacOSXOpenBundleResources(interp: PTcl_Interp; bundleName: pchar; hasResourceFile: longint; maxPathLen: longint; libraryPath: pchar): longint; cdecl; external libtclstub8_6;
function Tcl_MacOSXOpenVersionedBundleResources(interp: PTcl_Interp; bundleName: pchar; bundleVersion: pchar; hasResourceFile: longint; maxPathLen: longint;
  libraryPath: pchar): longint; cdecl; external libtclstub8_6;
procedure TclMacOSXNotifierAddRunLoopMode_(runLoopMode: pointer); cdecl; external libtclstub8_6;
{$ENDIF}
type
  PTclPlatStubs = ^TTclPlatStubs;

  TTclPlatStubs = record
    magic: longint;
    hooks: pointer;
    {$IFDEF MSWINDOWS}
    tcl_WinUtfToTChar: function(str: pchar; len: longint; dsPtr: PTcl_DString): PTCHAR; cdecl;
    tcl_WinTCharToUtf: function(str: PTCHAR; len: longint; dsPtr: PTcl_DString): pchar; cdecl;
    reserved2: procedure; cdecl;
    tclWinConvertError_: procedure(errCode: dword); cdecl;
    {$ENDIF}
    {$IFDEF DARWIN}
    tcl_MacOSXOpenBundleResources: function(interp: PTcl_Interp; bundleName: pchar; hasResourceFile: longint; maxPathLen: longint; libraryPath: pchar): longint; cdecl;
    tcl_MacOSXOpenVersionedBundleResources: function(interp: PTcl_Interp; bundleName: pchar; bundleVersion: pchar; hasResourceFile: longint; maxPathLen: longint;
      libraryPath: pchar): longint; cdecl;
    tclMacOSXNotifierAddRunLoopMode_: procedure(runLoopMode: pointer); cdecl;
    {$ENDIF}
  end;

var
  tclPlatStubsPtr: PTclPlatStubs; cvar;external libtclstub8_6;

  {$IFDEF MSWINDOWS}
  //const
  //  Tcl_WinUtfToTChar = tclPlatStubsPtr^.tcl_WinUtfToTChar;
  //  Tcl_WinTCharToUtf = tclPlatStubsPtr^.tcl_WinTCharToUtf;
  //  TclWinConvertError_ = tclPlatStubsPtr^.tclWinConvertError_;
  {$ENDIF}

  {$IFDEF DARWIN}
  //const
  //  Tcl_MacOSXOpenBundleResources = tclPlatStubsPtr^.tcl_MacOSXOpenBundleResources;
  //  Tcl_MacOSXOpenVersionedBundleResources = tclPlatStubsPtr^.tcl_MacOSXOpenVersionedBundleResources;
  //  TclMacOSXNotifierAddRunLoopMode_ = tclPlatStubsPtr^.tclMacOSXNotifierAddRunLoopMode_;
  {$ENDIF}


{$IFDEF DARWIN}
function Tcl_MacOSXOpenBundleResources(a, b, c, d, e: longint): longint;
{$ENDIF}


// === Konventiert am: 15-4-25 13:26:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$IFDEF DARWIN}
function Tcl_MacOSXOpenBundleResources(a, b, c, d, e: longint): longint;
begin
  //  Tcl_MacOSXOpenBundleResources:=Tcl_MacOSXOpenVersionedBundleResources(a,b,NULL,c,d,e);
end;
{$ENDIF}


{$ENDIF read_implementation}
