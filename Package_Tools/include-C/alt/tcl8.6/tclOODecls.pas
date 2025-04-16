unit tclOODecls;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is (mostly) automatically generated from tclOO.decls.
  }
{$ifndef _TCLOODECLS}
{$define _TCLOODECLS}
{ !BEGIN!: Do not edit below this line.  }
{ C++ extern C conditionnal removed }
{
 * Exported function declarations:
  }
{ 0  }

function Tcl_CopyObjectInstance(interp:PTcl_Interp; sourceObject:TTcl_Object; targetName:Pchar; targetNamespaceName:Pchar):TTcl_Object;cdecl;external libtclstub8_6;
{ 1  }
function Tcl_GetClassAsObject(clazz:TTcl_Class):TTcl_Object;cdecl;external libtclstub8_6;
{ 2  }
function Tcl_GetObjectAsClass(object:TTcl_Object):TTcl_Class;cdecl;external libtclstub8_6;
{ 3  }
function Tcl_GetObjectCommand(object:TTcl_Object):TTcl_Command;cdecl;external libtclstub8_6;
{ 4  }
function Tcl_GetObjectFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj):TTcl_Object;cdecl;external libtclstub8_6;
{ 5  }
function Tcl_GetObjectNamespace(object:TTcl_Object):PTcl_Namespace;cdecl;external libtclstub8_6;
{ 6  }
function Tcl_MethodDeclarerClass(method:TTcl_Method):TTcl_Class;cdecl;external libtclstub8_6;
{ 7  }
function Tcl_MethodDeclarerObject(method:TTcl_Method):TTcl_Object;cdecl;external libtclstub8_6;
{ 8  }
function Tcl_MethodIsPublic(method:TTcl_Method):longint;cdecl;external libtclstub8_6;
{ 9  }
function Tcl_MethodIsType(method:TTcl_Method; typePtr:PTcl_MethodType; clientDataPtr:Ppointer):longint;cdecl;external libtclstub8_6;
{ 10  }
function Tcl_MethodName(method:TTcl_Method):PTcl_Obj;cdecl;external libtclstub8_6;
{ 11  }
function Tcl_NewInstanceMethod(interp:PTcl_Interp; object:TTcl_Object; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
           clientData:pointer):TTcl_Method;cdecl;external libtclstub8_6;
{ 12  }
function Tcl_NewMethod(interp:PTcl_Interp; cls:TTcl_Class; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
           clientData:pointer):TTcl_Method;cdecl;external libtclstub8_6;
{ 13  }
function Tcl_NewObjectInstance(interp:PTcl_Interp; cls:TTcl_Class; nameStr:Pchar; nsNameStr:Pchar; objc:longint; 
           objv:PPTcl_Obj; skip:longint):TTcl_Object;cdecl;external libtclstub8_6;
{ 14  }
function Tcl_ObjectDeleted(object:TTcl_Object):longint;cdecl;external libtclstub8_6;
{ 15  }
function Tcl_ObjectContextIsFiltering(context:TTcl_ObjectContext):longint;cdecl;external libtclstub8_6;
{ 16  }
function Tcl_ObjectContextMethod(context:TTcl_ObjectContext):TTcl_Method;cdecl;external libtclstub8_6;
{ 17  }
function Tcl_ObjectContextObject(context:TTcl_ObjectContext):TTcl_Object;cdecl;external libtclstub8_6;
{ 18  }
function Tcl_ObjectContextSkippedArgs(context:TTcl_ObjectContext):longint;cdecl;external libtclstub8_6;
{ 19  }
function Tcl_ClassGetMetadata(clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;external libtclstub8_6;
{ 20  }
procedure Tcl_ClassSetMetadata(clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;external libtclstub8_6;
{ 21  }
function Tcl_ObjectGetMetadata(object:TTcl_Object; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;external libtclstub8_6;
{ 22  }
procedure Tcl_ObjectSetMetadata(object:TTcl_Object; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;external libtclstub8_6;
{ 23  }
function Tcl_ObjectContextInvokeNext(interp:PTcl_Interp; context:TTcl_ObjectContext; objc:longint; objv:PPTcl_Obj; skip:longint):longint;cdecl;external libtclstub8_6;
{ 24  }
function Tcl_ObjectGetMethodNameMapper(object:TTcl_Object):PTcl_ObjectMapMethodNameProc;cdecl;external libtclstub8_6;
{ 25  }
procedure Tcl_ObjectSetMethodNameMapper(object:TTcl_Object; mapMethodNameProc:PTcl_ObjectMapMethodNameProc);cdecl;external libtclstub8_6;
{ 26  }
procedure Tcl_ClassSetConstructor(interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;external libtclstub8_6;
{ 27  }
procedure Tcl_ClassSetDestructor(interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;external libtclstub8_6;
{ 28  }
function Tcl_GetObjectName(interp:PTcl_Interp; object:TTcl_Object):PTcl_Obj;cdecl;external libtclstub8_6;
{ Slot 29 is reserved  }
{ Slot 30 is reserved  }
{ Slot 31 is reserved  }
{ Slot 32 is reserved  }
{ Slot 33 is reserved  }
{ 34  }
procedure TclOOUnusedStubEntry;cdecl;external libtclstub8_6;
type
  PTclOOStubHooks = ^TTclOOStubHooks;
  TTclOOStubHooks = record
      tclOOIntStubs : PTclOOIntStubs;
    end;
{ 0  }
{ 1  }
{ 2  }
{ 3  }
{ 4  }
{ 5  }
{ 6  }
{ 7  }
{ 8  }
{ 9  }
{ 10  }
{ 11  }
{ 12  }
{ 13  }
{ 14  }
{ 15  }
{ 16  }
{ 17  }
{ 18  }
{ 19  }
{ 20  }
{ 21  }
{ 22  }
{ 23  }
{ 24  }
{ 25  }
{ 26  }
{ 27  }
{ 28  }
{ 34  }

  PTclOOStubs = ^TTclOOStubs;
  TTclOOStubs = record
      magic : longint;
      hooks : PTclOOStubHooks;
      tcl_CopyObjectInstance : function (interp:PTcl_Interp; sourceObject:TTcl_Object; targetName:Pchar; targetNamespaceName:Pchar):TTcl_Object;cdecl;
      tcl_GetClassAsObject : function (clazz:TTcl_Class):TTcl_Object;cdecl;
      tcl_GetObjectAsClass : function (object:TTcl_Object):TTcl_Class;cdecl;
      tcl_GetObjectCommand : function (object:TTcl_Object):TTcl_Command;cdecl;
      tcl_GetObjectFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj):TTcl_Object;cdecl;
      tcl_GetObjectNamespace : function (object:TTcl_Object):PTcl_Namespace;cdecl;
      tcl_MethodDeclarerClass : function (method:TTcl_Method):TTcl_Class;cdecl;
      tcl_MethodDeclarerObject : function (method:TTcl_Method):TTcl_Object;cdecl;
      tcl_MethodIsPublic : function (method:TTcl_Method):longint;cdecl;
      tcl_MethodIsType : function (method:TTcl_Method; typePtr:PTcl_MethodType; clientDataPtr:Ppointer):longint;cdecl;
      tcl_MethodName : function (method:TTcl_Method):PTcl_Obj;cdecl;
      tcl_NewInstanceMethod : function (interp:PTcl_Interp; object:TTcl_Object; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
                   clientData:pointer):TTcl_Method;cdecl;
      tcl_NewMethod : function (interp:PTcl_Interp; cls:TTcl_Class; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
                   clientData:pointer):TTcl_Method;cdecl;
      tcl_NewObjectInstance : function (interp:PTcl_Interp; cls:TTcl_Class; nameStr:Pchar; nsNameStr:Pchar; objc:longint; 
                   objv:PPTcl_Obj; skip:longint):TTcl_Object;cdecl;
      tcl_ObjectDeleted : function (object:TTcl_Object):longint;cdecl;
      tcl_ObjectContextIsFiltering : function (context:TTcl_ObjectContext):longint;cdecl;
      tcl_ObjectContextMethod : function (context:TTcl_ObjectContext):TTcl_Method;cdecl;
      tcl_ObjectContextObject : function (context:TTcl_ObjectContext):TTcl_Object;cdecl;
      tcl_ObjectContextSkippedArgs : function (context:TTcl_ObjectContext):longint;cdecl;
      tcl_ClassGetMetadata : function (clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;
      tcl_ClassSetMetadata : procedure (clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;
      tcl_ObjectGetMetadata : function (object:TTcl_Object; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;
      tcl_ObjectSetMetadata : procedure (object:TTcl_Object; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;
      tcl_ObjectContextInvokeNext : function (interp:PTcl_Interp; context:TTcl_ObjectContext; objc:longint; objv:PPTcl_Obj; skip:longint):longint;cdecl;
      tcl_ObjectGetMethodNameMapper : function (object:TTcl_Object):PTcl_ObjectMapMethodNameProc;cdecl;
      tcl_ObjectSetMethodNameMapper : procedure (object:TTcl_Object; mapMethodNameProc:PTcl_ObjectMapMethodNameProc);cdecl;
      tcl_ClassSetConstructor : procedure (interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;
      tcl_ClassSetDestructor : procedure (interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;
      tcl_GetObjectName : function (interp:PTcl_Interp; object:TTcl_Object):PTcl_Obj;cdecl;
      reserved29 : procedure ;cdecl;
      reserved30 : procedure ;cdecl;
      reserved31 : procedure ;cdecl;
      reserved32 : procedure ;cdecl;
      reserved33 : procedure ;cdecl;
      tclOOUnusedStubEntry : procedure ;cdecl;
    end;
  var
    tclOOStubsPtr : PTclOOStubs;cvar;external libtclstub8_6;
{ C++ end of extern C conditionnal removed }
{$if defined(USE_TCLOO_STUBS)}
{
 * Inline function declarations:
  }
{ 0  }

const
  Tcl_CopyObjectInstance = tclOOStubsPtr^.tcl_CopyObjectInstance;  
{ 1  }
  Tcl_GetClassAsObject = tclOOStubsPtr^.tcl_GetClassAsObject;  
{ 2  }
  Tcl_GetObjectAsClass = tclOOStubsPtr^.tcl_GetObjectAsClass;  
{ 3  }
  Tcl_GetObjectCommand = tclOOStubsPtr^.tcl_GetObjectCommand;  
{ 4  }
  Tcl_GetObjectFromObj = tclOOStubsPtr^.tcl_GetObjectFromObj;  
{ 5  }
  Tcl_GetObjectNamespace = tclOOStubsPtr^.tcl_GetObjectNamespace;  
{ 6  }
  Tcl_MethodDeclarerClass = tclOOStubsPtr^.tcl_MethodDeclarerClass;  
{ 7  }
  Tcl_MethodDeclarerObject = tclOOStubsPtr^.tcl_MethodDeclarerObject;  
{ 8  }
  Tcl_MethodIsPublic = tclOOStubsPtr^.tcl_MethodIsPublic;  
{ 9  }
  Tcl_MethodIsType = tclOOStubsPtr^.tcl_MethodIsType;  
{ 10  }
  Tcl_MethodName = tclOOStubsPtr^.tcl_MethodName;  
{ 11  }
  Tcl_NewInstanceMethod = tclOOStubsPtr^.tcl_NewInstanceMethod;  
{ 12  }
  Tcl_NewMethod = tclOOStubsPtr^.tcl_NewMethod;  
{ 13  }
  Tcl_NewObjectInstance = tclOOStubsPtr^.tcl_NewObjectInstance;  
{ 14  }
  Tcl_ObjectDeleted = tclOOStubsPtr^.tcl_ObjectDeleted;  
{ 15  }
  Tcl_ObjectContextIsFiltering = tclOOStubsPtr^.tcl_ObjectContextIsFiltering;  
{ 16  }
  Tcl_ObjectContextMethod = tclOOStubsPtr^.tcl_ObjectContextMethod;  
{ 17  }
  Tcl_ObjectContextObject = tclOOStubsPtr^.tcl_ObjectContextObject;  
{ 18  }
  Tcl_ObjectContextSkippedArgs = tclOOStubsPtr^.tcl_ObjectContextSkippedArgs;  
{ 19  }
  Tcl_ClassGetMetadata = tclOOStubsPtr^.tcl_ClassGetMetadata;  
{ 20  }
  Tcl_ClassSetMetadata = tclOOStubsPtr^.tcl_ClassSetMetadata;  
{ 21  }
  Tcl_ObjectGetMetadata = tclOOStubsPtr^.tcl_ObjectGetMetadata;  
{ 22  }
  Tcl_ObjectSetMetadata = tclOOStubsPtr^.tcl_ObjectSetMetadata;  
{ 23  }
  Tcl_ObjectContextInvokeNext = tclOOStubsPtr^.tcl_ObjectContextInvokeNext;  
{ 24  }
  Tcl_ObjectGetMethodNameMapper = tclOOStubsPtr^.tcl_ObjectGetMethodNameMapper;  
{ 25  }
  Tcl_ObjectSetMethodNameMapper = tclOOStubsPtr^.tcl_ObjectSetMethodNameMapper;  
{ 26  }
  Tcl_ClassSetConstructor = tclOOStubsPtr^.tcl_ClassSetConstructor;  
{ 27  }
  Tcl_ClassSetDestructor = tclOOStubsPtr^.tcl_ClassSetDestructor;  
{ 28  }
  Tcl_GetObjectName = tclOOStubsPtr^.tcl_GetObjectName;  
{ Slot 29 is reserved  }
{ Slot 30 is reserved  }
{ Slot 31 is reserved  }
{ Slot 32 is reserved  }
{ Slot 33 is reserved  }
{ 34  }
  TclOOUnusedStubEntry = tclOOStubsPtr^.tclOOUnusedStubEntry;  
{$endif}
{ defined(USE_TCLOO_STUBS)  }
{ !END!: Do not edit above this line.  }
{$undef TclOOUnusedStubEntry}
{$endif}
{ _TCLOODECLS  }

// === Konventiert am: 15-4-25 13:26:15 ===


implementation



end.
