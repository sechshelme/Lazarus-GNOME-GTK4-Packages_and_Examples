unit tclOODecls;

interface

uses
  ctypes, tk_tcl_common, tcl, tk, tclOO;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function Tcl_CopyObjectInstance(interp: PTcl_Interp; sourceObject: TTcl_Object; targetName: pchar; targetNamespaceName: pchar): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_GetClassAsObject(clazz: TTcl_Class): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_GetObjectAsClass(obj: TTcl_Object): TTcl_Class; cdecl; external libtclstub8_6;
function Tcl_GetObjectCommand(obj: TTcl_Object): TTcl_Command; cdecl; external libtclstub8_6;
function Tcl_GetObjectFromObj(interp: PTcl_Interp; objPtr: PTcl_Obj): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_GetObjectNamespace(obj: TTcl_Object): PTcl_Namespace; cdecl; external libtclstub8_6;
function Tcl_MethodDeclarerClass(method: TTcl_Method): TTcl_Class; cdecl; external libtclstub8_6;
function Tcl_MethodDeclarerObject(method: TTcl_Method): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_MethodIsPublic(method: TTcl_Method): longint; cdecl; external libtclstub8_6;
function Tcl_MethodIsType(method: TTcl_Method; typePtr: PTcl_MethodType; clientDataPtr: Ppointer): longint; cdecl; external libtclstub8_6;
function Tcl_MethodName(method: TTcl_Method): PTcl_Obj; cdecl; external libtclstub8_6;
function Tcl_NewInstanceMethod(interp: PTcl_Interp; obj: TTcl_Object; nameObj: PTcl_Obj; isPublic: longint; typePtr: PTcl_MethodType;
  clientData: pointer): TTcl_Method; cdecl; external libtclstub8_6;
function Tcl_NewMethod(interp: PTcl_Interp; cls: TTcl_Class; nameObj: PTcl_Obj; isPublic: longint; typePtr: PTcl_MethodType;
  clientData: pointer): TTcl_Method; cdecl; external libtclstub8_6;
function Tcl_NewObjectInstance(interp: PTcl_Interp; cls: TTcl_Class; nameStr: pchar; nsNameStr: pchar; objc: longint;
  objv: PPTcl_Obj; skip: longint): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_ObjectDeleted(obj: TTcl_Object): longint; cdecl; external libtclstub8_6;
function Tcl_ObjectContextIsFiltering(context: TTcl_ObjectContext): longint; cdecl; external libtclstub8_6;
function Tcl_ObjectContextMethod(context: TTcl_ObjectContext): TTcl_Method; cdecl; external libtclstub8_6;
function Tcl_ObjectContextObject(context: TTcl_ObjectContext): TTcl_Object; cdecl; external libtclstub8_6;
function Tcl_ObjectContextSkippedArgs(context: TTcl_ObjectContext): longint; cdecl; external libtclstub8_6;
function Tcl_ClassGetMetadata(clazz: TTcl_Class; typePtr: PTcl_ObjectMetadataType): pointer; cdecl; external libtclstub8_6;
procedure Tcl_ClassSetMetadata(clazz: TTcl_Class; typePtr: PTcl_ObjectMetadataType; metadata: pointer); cdecl; external libtclstub8_6;
function Tcl_ObjectGetMetadata(obj: TTcl_Object; typePtr: PTcl_ObjectMetadataType): pointer; cdecl; external libtclstub8_6;
procedure Tcl_ObjectSetMetadata(obj: TTcl_Object; typePtr: PTcl_ObjectMetadataType; metadata: pointer); cdecl; external libtclstub8_6;
function Tcl_ObjectContextInvokeNext(interp: PTcl_Interp; context: TTcl_ObjectContext; objc: longint; objv: PPTcl_Obj; skip: longint): longint; cdecl; external libtclstub8_6;
function Tcl_ObjectGetMethodNameMapper(obj: TTcl_Object): PTcl_ObjectMapMethodNameProc; cdecl; external libtclstub8_6;
procedure Tcl_ObjectSetMethodNameMapper(obj: TTcl_Object; mapMethodNameProc: PTcl_ObjectMapMethodNameProc); cdecl; external libtclstub8_6;
procedure Tcl_ClassSetConstructor(interp: PTcl_Interp; clazz: TTcl_Class; method: TTcl_Method); cdecl; external libtclstub8_6;
procedure Tcl_ClassSetDestructor(interp: PTcl_Interp; clazz: TTcl_Class; method: TTcl_Method); cdecl; external libtclstub8_6;
function Tcl_GetObjectName(interp: PTcl_Interp; obj: TTcl_Object): PTcl_Obj; cdecl; external libtclstub8_6;
procedure TclOOUnusedStubEntry; cdecl; external libtclstub8_6;

type
  PTclOOStubHooks = ^TTclOOStubHooks;
  TTclOOStubHooks = record
  end;

  PTclOOStubs = ^TTclOOStubs;

  TTclOOStubs = record
    magic: longint;
    hooks: PTclOOStubHooks;
    tcl_CopyObjectInstance: function(interp: PTcl_Interp; sourceObject: TTcl_Object; targetName: pchar; targetNamespaceName: pchar): TTcl_Object; cdecl;
    tcl_GetClassAsObject: function(clazz: TTcl_Class): TTcl_Object; cdecl;
    tcl_GetObjectAsClass: function(obj: TTcl_Object): TTcl_Class; cdecl;
    tcl_GetObjectCommand: function(obj: TTcl_Object): TTcl_Command; cdecl;
    tcl_GetObjectFromObj: function(interp: PTcl_Interp; objPtr: PTcl_Obj): TTcl_Object; cdecl;
    tcl_GetObjectNamespace: function(obj: TTcl_Object): PTcl_Namespace; cdecl;
    tcl_MethodDeclarerClass: function(method: TTcl_Method): TTcl_Class; cdecl;
    tcl_MethodDeclarerObject: function(method: TTcl_Method): TTcl_Object; cdecl;
    tcl_MethodIsPublic: function(method: TTcl_Method): longint; cdecl;
    tcl_MethodIsType: function(method: TTcl_Method; typePtr: PTcl_MethodType; clientDataPtr: Ppointer): longint; cdecl;
    tcl_MethodName: function(method: TTcl_Method): PTcl_Obj; cdecl;
    tcl_NewInstanceMethod: function(interp: PTcl_Interp; obj: TTcl_Object; nameObj: PTcl_Obj; isPublic: longint; typePtr: PTcl_MethodType;
      clientData: pointer): TTcl_Method; cdecl;
    tcl_NewMethod: function(interp: PTcl_Interp; cls: TTcl_Class; nameObj: PTcl_Obj; isPublic: longint; typePtr: PTcl_MethodType;
      clientData: pointer): TTcl_Method; cdecl;
    tcl_NewObjectInstance: function(interp: PTcl_Interp; cls: TTcl_Class; nameStr: pchar; nsNameStr: pchar; objc: longint;
      objv: PPTcl_Obj; skip: longint): TTcl_Object; cdecl;
    tcl_ObjectDeleted: function(obj: TTcl_Object): longint; cdecl;
    tcl_ObjectContextIsFiltering: function(context: TTcl_ObjectContext): longint; cdecl;
    tcl_ObjectContextMethod: function(context: TTcl_ObjectContext): TTcl_Method; cdecl;
    tcl_ObjectContextObject: function(context: TTcl_ObjectContext): TTcl_Object; cdecl;
    tcl_ObjectContextSkippedArgs: function(context: TTcl_ObjectContext): longint; cdecl;
    tcl_ClassGetMetadata: function(clazz: TTcl_Class; typePtr: PTcl_ObjectMetadataType): pointer; cdecl;
    tcl_ClassSetMetadata: procedure(clazz: TTcl_Class; typePtr: PTcl_ObjectMetadataType; metadata: pointer); cdecl;
    tcl_ObjectGetMetadata: function(obj: TTcl_Object; typePtr: PTcl_ObjectMetadataType): pointer; cdecl;
    tcl_ObjectSetMetadata: procedure(obj: TTcl_Object; typePtr: PTcl_ObjectMetadataType; metadata: pointer); cdecl;
    tcl_ObjectContextInvokeNext: function(interp: PTcl_Interp; context: TTcl_ObjectContext; objc: longint; objv: PPTcl_Obj; skip: longint): longint; cdecl;
    tcl_ObjectGetMethodNameMapper: function(obj: TTcl_Object): PTcl_ObjectMapMethodNameProc; cdecl;
    tcl_ObjectSetMethodNameMapper: procedure(obj: TTcl_Object; mapMethodNameProc: PTcl_ObjectMapMethodNameProc); cdecl;
    tcl_ClassSetConstructor: procedure(interp: PTcl_Interp; clazz: TTcl_Class; method: TTcl_Method); cdecl;
    tcl_ClassSetDestructor: procedure(interp: PTcl_Interp; clazz: TTcl_Class; method: TTcl_Method); cdecl;
    tcl_GetObjectName: function(interp: PTcl_Interp; obj: TTcl_Object): PTcl_Obj; cdecl;
    reserved29: procedure; cdecl;
    reserved30: procedure; cdecl;
    reserved31: procedure; cdecl;
    reserved32: procedure; cdecl;
    reserved33: procedure; cdecl;
    tclOOUnusedStubEntry: procedure; cdecl;
  end;

var
  tclOOStubsPtr: PTclOOStubs; cvar;external libtclstub8_6;

  // === Konventiert am: 15-4-25 13:26:15 ===


implementation



end.
