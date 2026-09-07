unit pk_package_sack;

interface

uses
  fp_glib2, fp_packagekit;

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

function pk_package_sack_get_type:TGType;cdecl;external libpackagekit ;
function pk_package_sack_new:PPkPackageSack;cdecl;external libpackagekit ;
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

procedure pk_package_sack_clear(sack:PPkPackageSack);cdecl;external libpackagekit ;
function pk_package_sack_get_ids(sack:PPkPackageSack):^Pgchar;cdecl;external libpackagekit ;
function pk_package_sack_get_size(sack:PPkPackageSack):Tguint;cdecl;external libpackagekit ;
function pk_package_sack_get_array(sack:PPkPackageSack):PGPtrArray;cdecl;external libpackagekit ;
procedure pk_package_sack_sort(sack:PPkPackageSack; _type:TPkPackageSackSortType);cdecl;external libpackagekit ;
function pk_package_sack_add_package(sack:PPkPackageSack; package:PPkPackage):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_add_package_by_id(sack:PPkPackageSack; package_id:Pgchar; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_add_packages_from_file(sack:PPkPackageSack; file:PGFile; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_to_file(sack:PPkPackageSack; file:PGFile; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_remove_package(sack:PPkPackageSack; package:PPkPackage):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_remove_package_by_id(sack:PPkPackageSack; package_id:Pgchar):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_remove_by_filter(sack:PPkPackageSack; filter_cb:TPkPackageSackFilterFunc; user_data:Tgpointer):Tgboolean;cdecl;external libpackagekit ;
function pk_package_sack_find_by_id(sack:PPkPackageSack; package_id:Pgchar):PPkPackage;cdecl;external libpackagekit ;
function pk_package_sack_find_by_id_name_arch(sack:PPkPackageSack; package_id:Pgchar):PPkPackage;cdecl;external libpackagekit ;
function pk_package_sack_filter_by_info(sack:PPkPackageSack; info:TPkInfoEnum):PPkPackageSack;cdecl;external libpackagekit ;
function pk_package_sack_filter(sack:PPkPackageSack; filter_cb:TPkPackageSackFilterFunc; user_data:Tgpointer):PPkPackageSack;cdecl;external libpackagekit ;
function pk_package_sack_get_total_bytes(sack:PPkPackageSack):Tguint64;cdecl;external libpackagekit ;
function pk_package_sack_merge_generic_finish(sack:PPkPackageSack; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
{ merging in data to the array using Resolve()  }
procedure pk_package_sack_resolve_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
{ merging in data to the array using Details()  }
procedure pk_package_sack_get_details_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
{ merging in data to the array using UpdateDetail()  }
procedure pk_package_sack_get_update_detail_async(sack:PPkPackageSack; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
{$endif}
{ __PK_PACKAGE_SACK_H  }

// === Konventiert am: 7-9-26 15:10:52 ===

function PK_TYPE_PACKAGE_SACK : TGType;
function PK_PACKAGE_SACK(obj : Pointer) : PPkPackageSack;
function PK_PACKAGE_SACK_CLASS(klass : Pointer) : PPkPackageSackClass;
function PK_IS_PACKAGE_SACK(obj : Pointer) : Tgboolean;
function PK_IS_PACKAGE_SACK_CLASS(klass : Pointer) : Tgboolean;
function PK_PACKAGE_SACK_GET_CLASS(obj : Pointer) : PPkPackageSackClass;

implementation

function PK_TYPE_PACKAGE_SACK : TGType;
  begin
    PK_TYPE_PACKAGE_SACK:=pk_package_sack_get_type;
  end;

function PK_PACKAGE_SACK(obj : Pointer) : PPkPackageSack;
begin
  Result := PPkPackageSack(g_type_check_instance_cast(obj, PK_TYPE_PACKAGE_SACK));
end;

function PK_PACKAGE_SACK_CLASS(klass : Pointer) : PPkPackageSackClass;
begin
  Result := PPkPackageSackClass(g_type_check_class_cast(klass, PK_TYPE_PACKAGE_SACK));
end;

function PK_IS_PACKAGE_SACK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_PACKAGE_SACK);
end;

function PK_IS_PACKAGE_SACK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_PACKAGE_SACK);
end;

function PK_PACKAGE_SACK_GET_CLASS(obj : Pointer) : PPkPackageSackClass;
begin
  Result := PPkPackageSackClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PK_PACKAGE_SACK_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_PACKAGE_SACK_TYPE_ERROR:=pk_package_sack_error_get_type;
  end;


end.
