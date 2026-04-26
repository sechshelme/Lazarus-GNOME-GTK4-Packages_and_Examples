
unit operation;
interface

{
  Automatically converted by H2Pas 1.0.0 from operation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    operation.h
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
PGOptionGroup  = ^GOptionGroup;
PVipsBuf  = ^VipsBuf;
PVipsObject  = ^VipsObject;
PVipsOperation  = ^VipsOperation;
PVipsOperationClass  = ^VipsOperationClass;
PVipsOperationFlags  = ^VipsOperationFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ base class for all vips operations
  }
{

	Copyright (C) 1991-2005 The National Gallery

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_OPERATION_H}
{$define VIPS_OPERATION_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/buf.h>}
{$include <vips/basic.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{< flags > }type
  PVipsOperationFlags = ^TVipsOperationFlags;
  TVipsOperationFlags =  Longint;
  Const
    VIPS_OPERATION_NONE = 0;
    VIPS_OPERATION_SEQUENTIAL = 1;
    VIPS_OPERATION_SEQUENTIAL_UNBUFFERED = 2;
    VIPS_OPERATION_NOCACHE = 4;
    VIPS_OPERATION_DEPRECATED = 8;
    VIPS_OPERATION_UNTRUSTED = 16;
    VIPS_OPERATION_BLOCKED = 32;
    VIPS_OPERATION_REVALIDATE = 64;
;

{ was #define dname def_expr }
function VIPS_TYPE_OPERATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OPERATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OPERATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION_GET_CLASS(obj : longint) : longint;

type

  TVipsOperationBuildFn = function (object:PVipsObject):Tgboolean;cdecl;
{ Keep the hash here.
	  }
{ Pixels calculated ... handy for measuring over-calculation.
	  }

  PVipsOperation = ^TVipsOperation;
  TVipsOperation = record
      parent_instance : TVipsObject;
      hash : Tguint;
      found_hash : Tgboolean;
      pixels : longint;
    end;
{ Print the usage message.
	  }
{ Return a set of operation flags.
	  }
{ One of our input images has signalled "invalidate". The cache uses
	 * VipsOperation::invalidate to drop dirty ops.
	  }

  PVipsOperationClass = ^TVipsOperationClass;
  TVipsOperationClass = record
      parent_class : TVipsObjectClass;
      usage : procedure (cls:PVipsOperationClass; buf:PVipsBuf);cdecl;
      get_flags : function (operation:PVipsOperation):TVipsOperationFlags;cdecl;
      flags : TVipsOperationFlags;
      invalidate : procedure (operation:PVipsOperation);cdecl;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_operation_get_type:TGType;cdecl;external;
function vips_operation_get_flags(operation:PVipsOperation):TVipsOperationFlags;cdecl;external;
procedure vips_operation_class_print_usage(operation_class:PVipsOperationClass);cdecl;external;
procedure vips_operation_invalidate(operation:PVipsOperation);cdecl;external;
function vips_operation_call_valist(operation:PVipsOperation; ap:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function vips_operation_new(name:Pchar):PVipsOperation;cdecl;external;
function vips_call_required_optional(operation:PPVipsOperation; required:Tva_list; optional:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function vips_call(operation_name:Pchar; args:array of const):longint;cdecl;external;
function vips_call(operation_name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_call_split(operation_name:Pchar; optional:Tva_list; args:array of const):longint;cdecl;external;
function vips_call_split(operation_name:Pchar; optional:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_call_split_option_string(operation_name:Pchar; option_string:Pchar; optional:Tva_list; args:array of const):longint;cdecl;external;
function vips_call_split_option_string(operation_name:Pchar; option_string:Pchar; optional:Tva_list):longint;cdecl;external;
procedure vips_call_options(group:PGOptionGroup; operation:PVipsOperation);cdecl;external;
function vips_call_argv(operation:PVipsOperation; argc:longint; argv:PPchar):longint;cdecl;external;
procedure vips_cache_drop_all;cdecl;external;
{xxxx VIPS_DEPRECATED_FOR(vips_cache_operation_buildp) }
function vips_cache_operation_lookup(operation:PVipsOperation):PVipsOperation;cdecl;external;
{xxxx VIPS_DEPRECATED_FOR(vips_cache_operation_buildp) }
procedure vips_cache_operation_add(operation:PVipsOperation);cdecl;external;
function vips_cache_operation_buildp(operation:PPVipsOperation):longint;cdecl;external;
function vips_cache_operation_build(operation:PVipsOperation):PVipsOperation;cdecl;external;
procedure vips_cache_print;cdecl;external;
procedure vips_cache_set_max(max:longint);cdecl;external;
procedure vips_cache_set_max_mem(max_mem:Tsize_t);cdecl;external;
function vips_cache_get_max:longint;cdecl;external;
function vips_cache_get_size:longint;cdecl;external;
function vips_cache_get_max_mem:Tsize_t;cdecl;external;
function vips_cache_get_max_files:longint;cdecl;external;
procedure vips_cache_set_max_files(max_files:longint);cdecl;external;
procedure vips_cache_set_dump(dump:Tgboolean);cdecl;external;
procedure vips_cache_set_trace(trace:Tgboolean);cdecl;external;
{ Part of threadpool, really, but we want these in a header that gets scanned
 * for our typelib.
  }
procedure vips_concurrency_set(concurrency:longint);cdecl;external;
function vips_concurrency_get:longint;cdecl;external;
(* Const before type ignored *)
procedure vips_operation_block_set(name:Pchar; state:Tgboolean);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_OPERATION_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_OPERATION : longint; { return type might be wrong }
  begin
    VIPS_TYPE_OPERATION:=vips_operation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION(obj : longint) : longint;
begin
  VIPS_OPERATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_OPERATION,VipsOperation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION_CLASS(klass : longint) : longint;
begin
  VIPS_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_OPERATION,VipsOperationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OPERATION(obj : longint) : longint;
begin
  VIPS_IS_OPERATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OPERATION_CLASS(klass : longint) : longint;
begin
  VIPS_IS_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OPERATION_GET_CLASS(obj : longint) : longint;
begin
  VIPS_OPERATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_OPERATION,VipsOperationClass);
end;


end.
