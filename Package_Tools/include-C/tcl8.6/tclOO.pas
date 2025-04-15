unit tclOO;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * tclOO.h --
 *
 *	This file contains the public API definitions and some of the function
 *	declarations for the object-system (NB: not Tcl_Obj, but ::oo).
 *
 * Copyright (c) 2006-2010 by Donal K. Fellows
 *
 * See the file "license.terms" for information on usage and redistribution of
 * this file, and for a DISCLAIMER OF ALL WARRANTIES.
  }
{$ifndef TCLOO_H_INCLUDED}
{$define TCLOO_H_INCLUDED}
{
 * Be careful when it comes to versioning; need to make sure that the
 * standalone TclOO version matches. Also make sure that this matches the
 * version in the files:
 *
 * tests/oo.test
 * tests/ooNext2.test
 * unix/tclooConfig.sh
 * win/tclooConfig.sh
  }

const
  TCLOO_VERSION = '1.1.0';  
  TCLOO_PATCHLEVEL = TCLOO_VERSION;  
{$include "tcl.h"}
{
 * For C++ compilers, use extern "C"
  }
{ C++ extern C conditionnal removed }

function TclOOInitializeStubs(para1:PTcl_Interp; version:Pchar):Pchar;cdecl;external libtcl8_6;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_OOInitStubs(interp : longint) : longint;

{$ifndef USE_TCL_STUBS}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function TclOOInitializeStubs(interp,version : longint) : longint;

{$endif}
{
 * These are opaque types.
  }
type
  PTcl_Class = ^TTcl_Class;
  TTcl_Class = PTcl_Class_;

  PTcl_Method = ^TTcl_Method;
  TTcl_Method = PTcl_Method_;

  PTcl_Object = ^TTcl_Object;
  TTcl_Object = PTcl_Object_;

  PTcl_ObjectContext = ^TTcl_ObjectContext;
  TTcl_ObjectContext = PTcl_ObjectContext_;
{
 * Public datatypes for callbacks and structures used in the TIP#257 (OO)
 * implementation. These are used to implement custom types of method calls
 * and to allow the attachment of arbitrary data to objects and classes.
  }
{
 * The type of a method implementation. This describes how to call the method
 * implementation, how to delete it (when the object or class is deleted) and
 * how to create a clone of it (when the object or class is copied).
  }
{ Structure version field. Always to be equal
				 * to TCL_OO_METHOD_VERSION_CURRENT in
				 * declarations.  }
{ Name of this type of method, mostly for
				 * debugging purposes.  }
{ How to invoke this method.  }
{ How to delete this method's type-specific
				 * data, or NULL if the type-specific data
				 * does not need deleting.  }
{ How to copy this method's type-specific
				 * data, or NULL if the type-specific data can
				 * be copied directly.  }

  PTcl_MethodType = ^TTcl_MethodType;
  TTcl_MethodType = record
      version : longint;
      name : Pchar;
      callProc : PTcl_MethodCallProc;
      deleteProc : PTcl_MethodDeleteProc;
      cloneProc : PTcl_CloneProc;
    end;
{
 * The correct value for the version field of the Tcl_MethodType structure.
 * This allows new versions of the structure to be introduced without breaking
 * binary compatibility.
  }

const
  TCL_OO_METHOD_VERSION_CURRENT = 1;  
{
 * The type of some object (or class) metadata. This describes how to delete
 * the metadata (when the object or class is deleted) and how to create a
 * clone of it (when the object or class is copied).
  }
{ Structure version field. Always to be equal
				 * to TCL_OO_METADATA_VERSION_CURRENT in
				 * declarations.  }
{ How to delete the metadata. This must not
				 * be NULL.  }
{ How to copy the metadata, or NULL if the
				 * type-specific data can be copied
				 * directly.  }
type
  PTcl_ObjectMetadataType = ^TTcl_ObjectMetadataType;
  TTcl_ObjectMetadataType = record
      version : longint;
      name : Pchar;
      deleteProc : PTcl_ObjectMetadataDeleteProc;
      cloneProc : PTcl_CloneProc;
    end;
{
 * The correct value for the version field of the Tcl_ObjectMetadataType
 * structure. This allows new versions of the structure to be introduced
 * without breaking binary compatibility.
  }

const
  TCL_OO_METADATA_VERSION_CURRENT = 1;  
{
 * Include all the public API, generated from tclOO.decls.
  }
{$include "tclOODecls.h"}
{ C++ end of extern C conditionnal removed }
{$endif}
{
 * Local Variables:
 * mode: c
 * c-basic-offset: 4
 * fill-column: 78
 * End:
  }

// === Konventiert am: 15-4-25 13:26:05 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_OOInitStubs(interp : longint) : longint;
begin
  Tcl_OOInitStubs:=TclOOInitializeStubs(interp,TCLOO_VERSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TclOOInitializeStubs(interp,version : longint) : longint;
begin
  TclOOInitializeStubs:=TCLOO_PATCHLEVEL;
end;


end.
