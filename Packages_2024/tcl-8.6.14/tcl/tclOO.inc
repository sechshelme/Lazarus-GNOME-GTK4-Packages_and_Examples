{$IFDEF read_interface}

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
  TTcl_MethodDeleteProc = procedure(clientData: pointer); cdecl;
  TTcl_CloneProc = function(interp: PTcl_Interp; oldClientData: pointer; newClientData: Ppointer): longint; cdecl;
  TTcl_ObjectMetadataDeleteProc = procedure(clientData: pointer); cdecl;
  TTcl_ObjectMapMethodNameProc = function(interp: PTcl_Interp; obj: TTcl_Object; startClsPtr: PTcl_Class; methodNameObj: PTcl_Obj): longint; cdecl;

  TTcl_MethodType = record
    version: longint;
    Name: pchar;
    callProc: TTcl_MethodCallProc;
    deleteProc: TTcl_MethodDeleteProc;
    cloneProc: TTcl_CloneProc;
  end;
  PTcl_MethodType = ^TTcl_MethodType;

const
  TCL_OO_METHOD_VERSION_CURRENT = 1;

type
  PTcl_ObjectMetadataType = ^TTcl_ObjectMetadataType;

  TTcl_ObjectMetadataType = record
    version: longint;
    Name: pchar;
    deleteProc: TTcl_ObjectMetadataDeleteProc;
    cloneProc: TTcl_CloneProc;
  end;

const
  TCL_OO_METADATA_VERSION_CURRENT = 1;

function Tcl_OOInitStubs(interp: TTcl_Interp): pchar;
function TclOOInitializeStubs(interp: TTcl_Interp; version: pchar): pchar;

// === Konventiert am: 15-4-25 13:26:05 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}


function Tcl_OOInitStubs(interp: TTcl_Interp): pchar;
begin
  Tcl_OOInitStubs := TclOOInitializeStubs(interp, TCLOO_VERSION);
end;

function TclOOInitializeStubs(interp: TTcl_Interp; version: pchar): pchar;
begin
  TclOOInitializeStubs := TCLOO_PATCHLEVEL;
end;


{$ENDIF read_implementation}
