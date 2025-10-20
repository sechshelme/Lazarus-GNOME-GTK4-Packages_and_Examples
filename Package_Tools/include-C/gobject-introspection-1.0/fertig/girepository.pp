
unit girepository;
interface

{
  Automatically converted by H2Pas 1.0.0 from girepository.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    girepository.h
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
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
PGError  = ^GError;
PGIBaseInfo  = ^GIBaseInfo;
PGIEnumInfo  = ^GIEnumInfo;
PGIInterfaceInfo  = ^GIInterfaceInfo;
PGIRepository  = ^GIRepository;
PGIRepositoryClass  = ^GIRepositoryClass;
PGIRepositoryError  = ^GIRepositoryError;
PGIRepositoryLoadFlags  = ^GIRepositoryLoadFlags;
PGIRepositoryPrivate  = ^GIRepositoryPrivate;
PGITypelib  = ^GITypelib;
PGList  = ^GList;
PGOptionGroup  = ^GOptionGroup;
PGSList  = ^GSList;
Pguint  = ^guint;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Repository
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __G_IREPOSITORY_H__}
{$define __G_IREPOSITORY_H__}
{$include <glib-object.h>}
{$include <gmodule.h>}
{$define __GIREPOSITORY_H_INSIDE__}
{$include <giarginfo.h>}
{$include <gibaseinfo.h>}
{$include <gicallableinfo.h>}
{$include <giconstantinfo.h>}
{$include <gienuminfo.h>}
{$include <gifieldinfo.h>}
{$include <gifunctioninfo.h>}
{$include <giinterfaceinfo.h>}
{$include <giobjectinfo.h>}
{$include <gipropertyinfo.h>}
{$include <giregisteredtypeinfo.h>}
{$include <gisignalinfo.h>}
{$include <gistructinfo.h>}
{$include <gitypeinfo.h>}
{$include <gitypelib.h>}
{$include <gitypes.h>}
{$include <giunioninfo.h>}
{$include <giversionmacros.h>}
{$include <givfuncinfo.h>}
{$include <giversion.h>}

{ was #define dname def_expr }
function G_TYPE_IREPOSITORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IREPOSITORY(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IREPOSITORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY_GET_CLASS(obj : longint) : longint;

{*
 * GIRepository:
 *
 * The GIRepository structure contains private data and should only be
 * accessed using the provided API.
  }
type
{< private > }
  PGIRepository = ^TGIRepository;
  TGIRepository = record
      parent : TGObject;
      priv : PGIRepositoryPrivate;
    end;

{< private > }
  PGIRepositoryClass = ^TGIRepositoryClass;
  TGIRepositoryClass = record
      parent : TGObjectClass;
    end;

{*
 * GIRepositoryLoadFlags:
 * @G_IREPOSITORY_LOAD_FLAG_LAZY: Lazily load the typelib.
 *
 * Flags that control how a typelib is loaded.
  }

  PGIRepositoryLoadFlags = ^TGIRepositoryLoadFlags;
  TGIRepositoryLoadFlags =  Longint;
  Const
    G_IREPOSITORY_LOAD_FLAG_LAZY = 1 shl 0;
;
{ Repository  }

function g_irepository_get_type:TGType;cdecl;external;
function g_irepository_get_default:PGIRepository;cdecl;external;
(* Const before type ignored *)
procedure g_irepository_prepend_search_path(directory:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_irepository_prepend_library_path(directory:Pchar);cdecl;external;
function g_irepository_get_search_path:PGSList;cdecl;external;
(* Const before type ignored *)
function g_irepository_load_typelib(repository:PGIRepository; typelib:PGITypelib; flags:TGIRepositoryLoadFlags; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_is_registered(repository:PGIRepository; namespace_:Pgchar; version:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_find_by_name(repository:PGIRepository; namespace_:Pgchar; name:Pgchar):PGIBaseInfo;cdecl;external;
(* Const before type ignored *)
function g_irepository_enumerate_versions(repository:PGIRepository; namespace_:Pgchar):PGList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_require(repository:PGIRepository; namespace_:Pgchar; version:Pgchar; flags:TGIRepositoryLoadFlags; error:PPGError):PGITypelib;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_require_private(repository:PGIRepository; typelib_dir:Pgchar; namespace_:Pgchar; version:Pgchar; flags:TGIRepositoryLoadFlags; 
           error:PPGError):PGITypelib;cdecl;external;
(* Const before type ignored *)
function g_irepository_get_immediate_dependencies(repository:PGIRepository; namespace_:Pgchar):^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_irepository_get_dependencies(repository:PGIRepository; namespace_:Pgchar):^Pgchar;cdecl;external;
function g_irepository_get_loaded_namespaces(repository:PGIRepository):^Pgchar;cdecl;external;
function g_irepository_find_by_gtype(repository:PGIRepository; gtype:TGType):PGIBaseInfo;cdecl;external;
procedure g_irepository_get_object_gtype_interfaces(repository:PGIRepository; gtype:TGType; n_interfaces_out:Pguint; interfaces_out:PPPGIInterfaceInfo);cdecl;external;
(* Const before type ignored *)
function g_irepository_get_n_infos(repository:PGIRepository; namespace_:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
function g_irepository_get_info(repository:PGIRepository; namespace_:Pgchar; index:Tgint):PGIBaseInfo;cdecl;external;
function g_irepository_find_by_error_domain(repository:PGIRepository; domain:TGQuark):PGIEnumInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_get_typelib_path(repository:PGIRepository; namespace_:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_get_shared_library(repository:PGIRepository; namespace_:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_get_c_prefix(repository:PGIRepository; namespace_:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_irepository_get_version(repository:PGIRepository; namespace_:Pgchar):Pgchar;cdecl;external;
function g_irepository_get_option_group:PGOptionGroup;cdecl;external;
(* Const before type ignored *)
function g_irepository_dump(arg:Pchar; error:PPGError):Tgboolean;cdecl;external;
{*
 * GIRepositoryError:
 * @G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND: the typelib could not be found.
 * @G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH: the namespace does not match the
 *   requested namespace.
 * @G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT: the version of the
 *   typelib does not match the requested version.
 * @G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND: the library used by the typelib
 *   could not be found.
 *
 * An error code used with #G_IREPOSITORY_ERROR in a #GError returned
 * from a #GIRepository routine.
  }
type
  PGIRepositoryError = ^TGIRepositoryError;
  TGIRepositoryError =  Longint;
  Const
    G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND = 0;
    G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH = 1;
    G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT = 2;
    G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND = 3;
;
{*
 * G_IREPOSITORY_ERROR:
 *
 * Error domain for #GIRepository. Errors in this domain will be from the
 * #GIRepositoryError enumeration. See #GError for more information on
 * error domains.
  }

{ was #define dname def_expr }
function G_IREPOSITORY_ERROR : longint; { return type might be wrong }

function g_irepository_error_quark:TGQuark;cdecl;external;
{ Global utility functions  }
(* Const before type ignored *)
procedure gi_cclosure_marshal_generic(closure:PGClosure; return_gvalue:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
{$endif}
{ __G_IREPOSITORY_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_IREPOSITORY : longint; { return type might be wrong }
  begin
    G_TYPE_IREPOSITORY:=g_irepository_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY(object : longint) : longint;
begin
  G_IREPOSITORY:=G_TYPE_CHECK_INSTANCE_CAST(object,G_TYPE_IREPOSITORY,GIRepository);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY_CLASS(klass : longint) : longint;
begin
  G_IREPOSITORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,G_TYPE_IREPOSITORY,GIRepositoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IREPOSITORY(object : longint) : longint;
begin
  G_IS_IREPOSITORY:=G_TYPE_CHECK_INSTANCE_TYPE(object,G_TYPE_IREPOSITORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IREPOSITORY_CLASS(klass : longint) : longint;
begin
  G_IS_IREPOSITORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,G_TYPE_IREPOSITORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IREPOSITORY_GET_CLASS(obj : longint) : longint;
begin
  G_IREPOSITORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,G_TYPE_IREPOSITORY,GIRepositoryClass);
end;

{ was #define dname def_expr }
function G_IREPOSITORY_ERROR : longint; { return type might be wrong }
  begin
    G_IREPOSITORY_ERROR:=g_irepository_error_quark;
  end;


end.
