unit tclOO;

interface

uses
  ctypes, tk_tcl_common, tcl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  TCLOO_VERSION = '1.1.0';
  TCLOO_PATCHLEVEL = TCLOO_VERSION;

function TclOOInitializeStubs(para1: PTcl_Interp; version: pchar): pchar; cdecl; external libtcl8_6;

type
  PTcl_Class = ^TTcl_Class;
  TTcl_Class = Pointer;

  PTcl_Method = ^TTcl_Method;
  TTcl_Method = Pointer;

  PTcl_Object = ^TTcl_Object;
  TTcl_Object = Pointer;

  PTcl_ObjectContext = ^TTcl_ObjectContext;
  TTcl_ObjectContext = Pointer;

type
  TTcl_MethodCallProc = function(clientData: pointer; interp: PTcl_Interp; objectContext: TTcl_ObjectContext; objc: longint; objv: PPTcl_Obj): longint; cdecl;
  PTcl_MethodCallProc = ^TTcl_MethodCallProc;
  TTcl_MethodDeleteProc = procedure(clientData: pointer); cdecl;
  PTcl_MethodDeleteProc = ^TTcl_MethodDeleteProc;
  TTcl_CloneProc = function(interp: PTcl_Interp; oldClientData: pointer; newClientData: Ppointer): longint; cdecl;
  PTcl_CloneProc = ^TTcl_CloneProc;
  TTcl_ObjectMetadataDeleteProc = procedure(clientData: pointer); cdecl;
  PTcl_ObjectMetadataDeleteProc = ^TTcl_ObjectMetadataDeleteProc;
  TTcl_ObjectMapMethodNameProc = function(interp: PTcl_Interp; obj: TTcl_Object; startClsPtr: PTcl_Class; methodNameObj: PTcl_Obj): longint; cdecl;
  PTcl_ObjectMapMethodNameProc = ^TTcl_ObjectMapMethodNameProc;

  PTcl_MethodType = ^TTcl_MethodType;

  TTcl_MethodType = record
    version: longint;
    Name: pchar;
    callProc: PTcl_MethodCallProc;
    deleteProc: PTcl_MethodDeleteProc;
    cloneProc: PTcl_CloneProc;
  end;

const
  TCL_OO_METHOD_VERSION_CURRENT = 1;

type
  PTcl_ObjectMetadataType = ^TTcl_ObjectMetadataType;

  TTcl_ObjectMetadataType = record
    version: longint;
    Name: pchar;
    deleteProc: PTcl_ObjectMetadataDeleteProc;
    cloneProc: PTcl_CloneProc;
  end;

const
  TCL_OO_METADATA_VERSION_CURRENT = 1;

function Tcl_OOInitStubs(interp: TTcl_Interp): pchar;
function TclOOInitializeStubs(interp: TTcl_Interp; version: pchar): pchar;

// === Konventiert am: 15-4-25 13:26:05 ===

implementation


function Tcl_OOInitStubs(interp: TTcl_Interp): pchar;
begin
  Tcl_OOInitStubs := TclOOInitializeStubs(interp, TCLOO_VERSION);
end;

function TclOOInitializeStubs(interp: TTcl_Interp; version: pchar): pchar;
begin
  TclOOInitializeStubs := TCLOO_PATCHLEVEL;
end;


end.
