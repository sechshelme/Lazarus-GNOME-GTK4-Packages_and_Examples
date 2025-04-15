
unit tclOODecls;
interface

{
  Automatically converted by H2Pas 1.0.0 from tclOODecls.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tclOODecls.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PTcl_Interp  = ^Tcl_Interp;
PTcl_MethodType  = ^Tcl_MethodType;
PTcl_Namespace  = ^Tcl_Namespace;
PTcl_Obj  = ^Tcl_Obj;
PTcl_ObjectMapMethodNameProc  = ^Tcl_ObjectMapMethodNameProc;
PTcl_ObjectMetadataType  = ^Tcl_ObjectMetadataType;
PTclOOIntStubs  = ^TclOOIntStubs;
PTclOOStubHooks  = ^TclOOStubHooks;
PTclOOStubs  = ^TclOOStubs;
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
(* Const before type ignored *)
(* Const before type ignored *)

function Tcl_CopyObjectInstance(interp:PTcl_Interp; sourceObject:TTcl_Object; targetName:Pchar; targetNamespaceName:Pchar):TTcl_Object;cdecl;external;
{ 1  }
function Tcl_GetClassAsObject(clazz:TTcl_Class):TTcl_Object;cdecl;external;
{ 2  }
function Tcl_GetObjectAsClass(object:TTcl_Object):TTcl_Class;cdecl;external;
{ 3  }
function Tcl_GetObjectCommand(object:TTcl_Object):TTcl_Command;cdecl;external;
{ 4  }
function Tcl_GetObjectFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj):TTcl_Object;cdecl;external;
{ 5  }
function Tcl_GetObjectNamespace(object:TTcl_Object):PTcl_Namespace;cdecl;external;
{ 6  }
function Tcl_MethodDeclarerClass(method:TTcl_Method):TTcl_Class;cdecl;external;
{ 7  }
function Tcl_MethodDeclarerObject(method:TTcl_Method):TTcl_Object;cdecl;external;
{ 8  }
function Tcl_MethodIsPublic(method:TTcl_Method):longint;cdecl;external;
{ 9  }
(* Const before type ignored *)
function Tcl_MethodIsType(method:TTcl_Method; typePtr:PTcl_MethodType; clientDataPtr:Ppointer):longint;cdecl;external;
{ 10  }
function Tcl_MethodName(method:TTcl_Method):PTcl_Obj;cdecl;external;
{ 11  }
(* Const before type ignored *)
function Tcl_NewInstanceMethod(interp:PTcl_Interp; object:TTcl_Object; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
           clientData:pointer):TTcl_Method;cdecl;external;
{ 12  }
(* Const before type ignored *)
function Tcl_NewMethod(interp:PTcl_Interp; cls:TTcl_Class; nameObj:PTcl_Obj; isPublic:longint; typePtr:PTcl_MethodType; 
           clientData:pointer):TTcl_Method;cdecl;external;
{ 13  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function Tcl_NewObjectInstance(interp:PTcl_Interp; cls:TTcl_Class; nameStr:Pchar; nsNameStr:Pchar; objc:longint; 
           objv:PPTcl_Obj; skip:longint):TTcl_Object;cdecl;external;
{ 14  }
function Tcl_ObjectDeleted(object:TTcl_Object):longint;cdecl;external;
{ 15  }
function Tcl_ObjectContextIsFiltering(context:TTcl_ObjectContext):longint;cdecl;external;
{ 16  }
function Tcl_ObjectContextMethod(context:TTcl_ObjectContext):TTcl_Method;cdecl;external;
{ 17  }
function Tcl_ObjectContextObject(context:TTcl_ObjectContext):TTcl_Object;cdecl;external;
{ 18  }
function Tcl_ObjectContextSkippedArgs(context:TTcl_ObjectContext):longint;cdecl;external;
{ 19  }
(* Const before type ignored *)
function Tcl_ClassGetMetadata(clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;external;
{ 20  }
(* Const before type ignored *)
procedure Tcl_ClassSetMetadata(clazz:TTcl_Class; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;external;
{ 21  }
(* Const before type ignored *)
function Tcl_ObjectGetMetadata(object:TTcl_Object; typePtr:PTcl_ObjectMetadataType):pointer;cdecl;external;
{ 22  }
(* Const before type ignored *)
procedure Tcl_ObjectSetMetadata(object:TTcl_Object; typePtr:PTcl_ObjectMetadataType; metadata:pointer);cdecl;external;
{ 23  }
(* Const before declarator ignored *)
function Tcl_ObjectContextInvokeNext(interp:PTcl_Interp; context:TTcl_ObjectContext; objc:longint; objv:PPTcl_Obj; skip:longint):longint;cdecl;external;
{ 24  }
function Tcl_ObjectGetMethodNameMapper(object:TTcl_Object):PTcl_ObjectMapMethodNameProc;cdecl;external;
{ 25  }
procedure Tcl_ObjectSetMethodNameMapper(object:TTcl_Object; mapMethodNameProc:PTcl_ObjectMapMethodNameProc);cdecl;external;
{ 26  }
procedure Tcl_ClassSetConstructor(interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;external;
{ 27  }
procedure Tcl_ClassSetDestructor(interp:PTcl_Interp; clazz:TTcl_Class; method:TTcl_Method);cdecl;external;
{ 28  }
function Tcl_GetObjectName(interp:PTcl_Interp; object:TTcl_Object):PTcl_Obj;cdecl;external;
{ Slot 29 is reserved  }
{ Slot 30 is reserved  }
{ Slot 31 is reserved  }
{ Slot 32 is reserved  }
{ Slot 33 is reserved  }
{ 34  }
procedure TclOOUnusedStubEntry;cdecl;external;
(* Const before type ignored *)
type
  PTclOOStubHooks = ^TTclOOStubHooks;
  TTclOOStubHooks = record
      tclOOIntStubs : PTclOOIntStubs;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ 0  }
{ 1  }
{ 2  }
{ 3  }
{ 4  }
{ 5  }
{ 6  }
{ 7  }
{ 8  }
(* Const before type ignored *)
{ 9  }
{ 10  }
(* Const before type ignored *)
{ 11  }
(* Const before type ignored *)
{ 12  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
{ 13  }
{ 14  }
{ 15  }
{ 16  }
{ 17  }
{ 18  }
(* Const before type ignored *)
{ 19  }
(* Const before type ignored *)
{ 20  }
(* Const before type ignored *)
{ 21  }
(* Const before type ignored *)
{ 22  }
(* Const before declarator ignored *)
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
(* Const before type ignored *)
  var
    tclOOStubsPtr : PTclOOStubs;cvar;external;
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

implementation


end.
