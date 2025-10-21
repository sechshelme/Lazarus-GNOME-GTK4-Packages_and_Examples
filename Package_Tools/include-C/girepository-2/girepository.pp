
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
PGClosure  = ^GClosure;
PGError  = ^GError;
PGIBaseInfo  = ^GIBaseInfo;
PGIEnumInfo  = ^GIEnumInfo;
PGIInterfaceInfo  = ^GIInterfaceInfo;
PGIRepository  = ^GIRepository;
PGIRepositoryError  = ^GIRepositoryError;
PGIRepositoryLoadFlags  = ^GIRepositoryLoadFlags;
PGITypelib  = ^GITypelib;
PGOptionGroup  = ^GOptionGroup;
PGValue  = ^GValue;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Repository
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gmodule.h>}
{$include <girepository/gi-visibility.h>}
{$define __GIREPOSITORY_H_INSIDE__}
{$include <girepository/giarginfo.h>}
{$include <girepository/gibaseinfo.h>}
{$include <girepository/gicallableinfo.h>}
{$include <girepository/gicallbackinfo.h>}
{$include <girepository/giconstantinfo.h>}
{$include <girepository/gienuminfo.h>}
{$include <girepository/gifieldinfo.h>}
{$include <girepository/giflagsinfo.h>}
{$include <girepository/gifunctioninfo.h>}
{$include <girepository/giinterfaceinfo.h>}
{$include <girepository/giobjectinfo.h>}
{$include <girepository/gipropertyinfo.h>}
{$include <girepository/giregisteredtypeinfo.h>}
{$include <girepository/gisignalinfo.h>}
{$include <girepository/gistructinfo.h>}
{$include <girepository/gitypeinfo.h>}
{$include <girepository/gitypelib.h>}
{$include <girepository/gitypes.h>}
{$include <girepository/giunioninfo.h>}
{$include <girepository/giunresolvedinfo.h>}
{$include <girepository/givalueinfo.h>}
{$include <girepository/givfuncinfo.h>}

{ was #define dname def_expr }
function GI_TYPE_REPOSITORY : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GIRepository, gi_repository, GI, REPOSITORY, GObject) }
{*
 * GIRepositoryLoadFlags:
 * @GI_REPOSITORY_LOAD_FLAG_NONE: No flags set.
 * @GI_REPOSITORY_LOAD_FLAG_LAZY: Lazily load the typelib.
 *
 * Flags that control how a typelib is loaded.
 *
 * Since: 2.80
  }
type
  PGIRepositoryLoadFlags = ^TGIRepositoryLoadFlags;
  TGIRepositoryLoadFlags =  Longint;
  Const
    GI_REPOSITORY_LOAD_FLAG_NONE = 0;
    GI_REPOSITORY_LOAD_FLAG_LAZY = 1 shl 0;
;
{ Repository  }

function gi_repository_new:PGIRepository;cdecl;external;
(* Const before type ignored *)
procedure gi_repository_prepend_search_path(repository:PGIRepository; directory:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gi_repository_prepend_library_path(repository:PGIRepository; directory:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gi_repository_get_search_path(repository:PGIRepository; n_paths_out:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gi_repository_get_library_path(repository:PGIRepository; n_paths_out:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function gi_repository_load_typelib(repository:PGIRepository; typelib:PGITypelib; flags:TGIRepositoryLoadFlags; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_is_registered(repository:PGIRepository; namespace_:Pchar; version:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_find_by_name(repository:PGIRepository; namespace_:Pchar; name:Pchar):PGIBaseInfo;cdecl;external;
(* Const before type ignored *)
function gi_repository_enumerate_versions(repository:PGIRepository; namespace_:Pchar; n_versions_out:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_require(repository:PGIRepository; namespace_:Pchar; version:Pchar; flags:TGIRepositoryLoadFlags; error:PPGError):PGITypelib;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_require_private(repository:PGIRepository; typelib_dir:Pchar; namespace_:Pchar; version:Pchar; flags:TGIRepositoryLoadFlags; 
           error:PPGError):PGITypelib;cdecl;external;
(* Const before type ignored *)
function gi_repository_get_immediate_dependencies(repository:PGIRepository; namespace_:Pchar; n_dependencies_out:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function gi_repository_get_dependencies(repository:PGIRepository; namespace_:Pchar; n_dependencies_out:Psize_t):^Pchar;cdecl;external;
function gi_repository_get_loaded_namespaces(repository:PGIRepository; n_namespaces_out:Psize_t):^Pchar;cdecl;external;
function gi_repository_find_by_gtype(repository:PGIRepository; gtype:TGType):PGIBaseInfo;cdecl;external;
procedure gi_repository_get_object_gtype_interfaces(repository:PGIRepository; gtype:TGType; n_interfaces_out:Psize_t; interfaces_out:PPPGIInterfaceInfo);cdecl;external;
(* Const before type ignored *)
function gi_repository_get_n_infos(repository:PGIRepository; namespace_:Pchar):dword;cdecl;external;
(* Const before type ignored *)
function gi_repository_get_info(repository:PGIRepository; namespace_:Pchar; idx:dword):PGIBaseInfo;cdecl;external;
function gi_repository_find_by_error_domain(repository:PGIRepository; domain:TGQuark):PGIEnumInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_get_typelib_path(repository:PGIRepository; namespace_:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function gi_repository_get_shared_libraries(repository:PGIRepository; namespace_:Pchar; out_n_elements:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_get_c_prefix(repository:PGIRepository; namespace_:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_get_version(repository:PGIRepository; namespace_:Pchar):Pchar;cdecl;external;
function gi_repository_get_option_group:PGOptionGroup;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_repository_dump(input_filename:Pchar; output_filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
{*
 * GIRepositoryError:
 * @GI_REPOSITORY_ERROR_TYPELIB_NOT_FOUND: the typelib could not be found.
 * @GI_REPOSITORY_ERROR_NAMESPACE_MISMATCH: the namespace does not match the
 *   requested namespace.
 * @GI_REPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT: the version of the
 *   typelib does not match the requested version.
 * @GI_REPOSITORY_ERROR_LIBRARY_NOT_FOUND: the library used by the typelib
 *   could not be found.
 *
 * An error code used with `GI_REPOSITORY_ERROR` in a [type@GLib.Error]
 * returned from a [class@GIRepository.Repository] routine.
 *
 * Since: 2.80
  }
type
  PGIRepositoryError = ^TGIRepositoryError;
  TGIRepositoryError =  Longint;
  Const
    GI_REPOSITORY_ERROR_TYPELIB_NOT_FOUND = 0;
    GI_REPOSITORY_ERROR_NAMESPACE_MISMATCH = 1;
    GI_REPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT = 2;
    GI_REPOSITORY_ERROR_LIBRARY_NOT_FOUND = 3;
;
{*
 * GI_REPOSITORY_ERROR:
 *
 * Error domain for [class@GIRepository.Repository].
 *
 * Errors in this domain will be from the [enum@GIRepository.Error] enumeration.
 * See [type@GLib.Error] for more information on error domains.
 *
 * Since: 2.80
  }

{ was #define dname def_expr }
function GI_REPOSITORY_ERROR : longint; { return type might be wrong }

function gi_repository_error_quark:TGQuark;cdecl;external;
{ Global utility functions  }
(* Const before type ignored *)
procedure gi_cclosure_marshal_generic(closure:PGClosure; return_gvalue:PGValue; n_param_values:dword; param_values:PGValue; invocation_hint:pointer; 
            marshal_data:pointer);cdecl;external;
{$include <girepository/girepository-autocleanups.h>}

implementation

{ was #define dname def_expr }
function GI_TYPE_REPOSITORY : longint; { return type might be wrong }
  begin
    GI_TYPE_REPOSITORY:=gi_repository_get_type;
  end;

{ was #define dname def_expr }
function GI_REPOSITORY_ERROR : longint; { return type might be wrong }
  begin
    GI_REPOSITORY_ERROR:=gi_repository_error_quark;
  end;


end.
