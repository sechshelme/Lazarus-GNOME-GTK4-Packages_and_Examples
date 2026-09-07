
unit pk_package_sack;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_package_sack.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_package_sack
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGPtrArray  = ^GPtrArray;
PPkPackage  = ^PkPackage;
PPkPackageSack  = ^PkPackageSack;
PPkPackageSackClass  = ^PkPackageSackClass;
PPkPackageSackPrivate  = ^PkPackageSackPrivate;
PPkPackageSackSortType  = ^PkPackageSackSortType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_PACKAGE_SACK_H}
{$define __PK_PACKAGE_SACK_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <packagekit-glib2/pk-progress.h>}
{$include <packagekit-glib2/pk-package.h>}

{ was #define dname def_expr }
function PK_TYPE_PACKAGE_SACK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_SACK(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_SACK_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK_GET_CLASS(o : longint) : longint;

{ was #define dname def_expr }
function PK_PACKAGE_SACK_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkPackageSack, g_object_unref) }
{$endif}
type
  PPkPackageSack = ^TPkPackageSack;
  TPkPackageSack = record
      parent : TGObject;
      priv : PPkPackageSackPrivate;
    end;

{ signals  }
{ padding for future expansion  }
  PPkPackageSackClass = ^TPkPackageSackClass;
  TPkPackageSackClass = record
      parent_class : TGObjectClass;
      changed : procedure (sack:PPkPackageSack);cdecl;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;

{*
 * PkPackageSackSortType:
 * @PK_PACKAGE_SACK_SORT_TYPE_NAME: Sort by name
 * @PK_PACKAGE_SACK_SORT_TYPE_INFO: Sort by package info
 * @PK_PACKAGE_SACK_SORT_TYPE_PACKAGE_ID: Sort by package ID
 * @PK_PACKAGE_SACK_SORT_TYPE_SUMMARY: Sort by summary
 * @PK_PACKAGE_SACK_SORT_TYPE_LAST:
 *
 * Type of sort to perform.
 * }

  PPkPackageSackSortType = ^TPkPackageSackSortType;
  TPkPackageSackSortType =  Longint;
  Const
    PK_PACKAGE_SACK_SORT_TYPE_NAME = 0;
    PK_PACKAGE_SACK_SORT_TYPE_INFO = 1;
    PK_PACKAGE_SACK_SORT_TYPE_PACKAGE_ID = 2;
    PK_PACKAGE_SACK_SORT_TYPE_SUMMARY = 3;
    PK_PACKAGE_SACK_SORT_TYPE_LAST = 4;
;

function pk_package_sack_get_type:TGType;cdecl;external;
function pk_package_sack_new:PPkPackageSack;cdecl;external;
{*
 * PkPackageSackFilterFunc:
 * @package: the package being considered
 * @user_data: User data supplied when the callback was registered
 *
 * Function to filter packages in #PkPackageSack.
 *
 * Return value: %TRUE if @package should remain in the sack.
  }
type

  TPkPackageSackFilterFunc = function (package:PPkPackage; user_data:Tgpointer):Tgboolean;cdecl;
{ managing the array  }

procedure pk_package_sack_clear(sack:PPkPackageSack);cdecl;external;
function pk_package_sack_get_ids(sack:PPkPackageSack):^Pgchar;cdecl;external;
function pk_package_sack_get_size(sack:PPkPackageSack):Tguint;cdecl;external;
function pk_package_sack_get_array(sack:PPkPackageSack):PGPtrArray;cdecl;external;
procedure pk_package_sack_sort(sack:PPkPackageSack; _type:TPkPackageSackSortType);cdecl;external;
function pk_package_sack_add_package(sack:PPkPackageSack; package:PPkPackage):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_package_sack_add_package_by_id(sack:PPkPackageSack; package_id:Pgchar; error:PPGError):Tgboolean;cdecl;external;
function pk_package_sack_add_packages_from_file(sack:PPkPackageSack; file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function pk_package_sack_to_file(sack:PPkPackageSack; file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function pk_package_sack_remove_package(sack:PPkPackageSack; package:PPkPackage):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_package_sack_remove_package_by_id(sack:PPkPackageSack; package_id:Pgchar):Tgboolean;cdecl;external;
function pk_package_sack_remove_by_filter(sack:PPkPackageSack; filter_cb:TPkPackageSackFilterFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_package_sack_find_by_id(sack:PPkPackageSack; package_id:Pgchar):PPkPackage;cdecl;external;
(* Const before type ignored *)
function pk_package_sack_find_by_id_name_arch(sack:PPkPackageSack; package_id:Pgchar):PPkPackage;cdecl;external;
function pk_package_sack_filter_by_info(sack:PPkPackageSack; info:TPkInfoEnum):PPkPackageSack;cdecl;external;
function pk_package_sack_filter(sack:PPkPackageSack; filter_cb:TPkPackageSackFilterFunc; user_data:Tgpointer):PPkPackageSack;cdecl;external;
function pk_package_sack_get_total_bytes(sack:PPkPackageSack):Tguint64;cdecl;external;
function pk_package_sack_merge_generic_finish(sack:PPkPackageSack; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ merging in data to the array using Resolve()  }
procedure pk_package_sack_resolve_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
{ merging in data to the array using Details()  }
procedure pk_package_sack_get_details_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
{ merging in data to the array using UpdateDetail()  }
procedure pk_package_sack_get_update_detail_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
{$endif}
{ __PK_PACKAGE_SACK_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_PACKAGE_SACK : longint; { return type might be wrong }
  begin
    PK_TYPE_PACKAGE_SACK:=pk_package_sack_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK(o : longint) : longint;
begin
  PK_PACKAGE_SACK:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_PACKAGE_SACK,PkPackageSack);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK_CLASS(k : longint) : longint;
begin
  PK_PACKAGE_SACK_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_PACKAGE_SACK,PkPackageSackClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_SACK(o : longint) : longint;
begin
  PK_IS_PACKAGE_SACK:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_PACKAGE_SACK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_SACK_CLASS(k : longint) : longint;
begin
  PK_IS_PACKAGE_SACK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_PACKAGE_SACK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_SACK_GET_CLASS(o : longint) : longint;
begin
  PK_PACKAGE_SACK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_PACKAGE_SACK,PkPackageSackClass);
end;

{ was #define dname def_expr }
function PK_PACKAGE_SACK_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_PACKAGE_SACK_TYPE_ERROR:=pk_package_sack_error_get_type;
  end;


end.
