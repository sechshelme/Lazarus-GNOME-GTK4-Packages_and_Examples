
unit pk_progress;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_progress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_progress.h
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
Pgchar  = ^gchar;
PPkItemProgress  = ^PkItemProgress;
PPkPackage  = ^PkPackage;
PPkProgress  = ^PkProgress;
PPkProgressClass  = ^PkProgressClass;
PPkProgressPrivate  = ^PkProgressPrivate;
PPkProgressType  = ^PkProgressType;
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
{$ifndef __PK_PROGRESS_H}
{$define __PK_PROGRESS_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-enum.h>}
{$include <packagekit-glib2/pk-package.h>}
{$include <packagekit-glib2/pk-item-progress.h>}

{ was #define dname def_expr }
function PK_TYPE_PROGRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PROGRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PROGRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS_GET_CLASS(o : longint) : longint;

{ was #define dname def_expr }
function PK_PROGRESS_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkProgress, g_object_unref) }
{$endif}
type
  PPkProgress = ^TPkProgress;
  TPkProgress = record
      parent : TGObject;
      priv : PPkProgressPrivate;
    end;

{ padding for future expansion  }
  PPkProgressClass = ^TPkProgressClass;
  TPkProgressClass = record
      parent_class : TGObjectClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_progress_get_type:TGType;cdecl;external;
function pk_progress_new:PPkProgress;cdecl;external;
{*
 * PkProgressType:
 * @PK_PROGRESS_TYPE_PACKAGE_ID: package id updated
 * @PK_PROGRESS_TYPE_TRANSACTION_ID: transaction ID updated
 * @PK_PROGRESS_TYPE_PERCENTAGE: percentage updated
 * @PK_PROGRESS_TYPE_ALLOW_CANCEL: allow cancel updated
 * @PK_PROGRESS_TYPE_STATUS: status updated
 * @PK_PROGRESS_TYPE_ROLE: role updated
 * @PK_PROGRESS_TYPE_CALLER_ACTIVE: called active updated
 * @PK_PROGRESS_TYPE_ELAPSED_TIME: elapsed time updated
 * @PK_PROGRESS_TYPE_REMAINING_TIME: remaining time updated
 * @PK_PROGRESS_TYPE_SPEED: speed updated
 * @PK_PROGRESS_TYPE_DOWNLOAD_SIZE_REMAINING: download size remaining updated
 * @PK_PROGRESS_TYPE_UID: uid updated
 * @PK_PROGRESS_TYPE_PACKAGE: package updated
 * @PK_PROGRESS_TYPE_ITEM_PROGRESS: item progress updated
 * @PK_PROGRESS_TYPE_TRANSACTION_FLAGS: transaction flags updated
 * @PK_PROGRESS_TYPE_SENDER: D-Bus name of sender updated (Since: 1.2.6)
 * @PK_PROGRESS_TYPE_INVALID:
 *
 * Flag to show which progress field has been updated.
 * }
type
  PPkProgressType = ^TPkProgressType;
  TPkProgressType =  Longint;
  Const
    PK_PROGRESS_TYPE_PACKAGE_ID = 0;
    PK_PROGRESS_TYPE_TRANSACTION_ID = 1;
    PK_PROGRESS_TYPE_PERCENTAGE = 2;
    PK_PROGRESS_TYPE_ALLOW_CANCEL = 3;
    PK_PROGRESS_TYPE_STATUS = 4;
    PK_PROGRESS_TYPE_ROLE = 5;
    PK_PROGRESS_TYPE_CALLER_ACTIVE = 6;
    PK_PROGRESS_TYPE_ELAPSED_TIME = 7;
    PK_PROGRESS_TYPE_REMAINING_TIME = 8;
    PK_PROGRESS_TYPE_SPEED = 9;
    PK_PROGRESS_TYPE_DOWNLOAD_SIZE_REMAINING = 10;
    PK_PROGRESS_TYPE_UID = 11;
    PK_PROGRESS_TYPE_PACKAGE = 12;
    PK_PROGRESS_TYPE_ITEM_PROGRESS = 13;
    PK_PROGRESS_TYPE_TRANSACTION_FLAGS = 14;
    PK_PROGRESS_TYPE_INVALID = 15;
    PK_PROGRESS_TYPE_SENDER = 16;
;
{*
 * PkProgressCallback:
 * @progress: a #PkProgress
 * @type: the type of progress update this is
 * @user_data: User data supplied when the callback was registered.
 *
 * Function that is called when progress updates are given.
  }
type

  TPkProgressCallback = procedure (progress:PPkProgress; _type:TPkProgressType; user_data:Tgpointer);cdecl;
(* Const before type ignored *)

function pk_progress_set_package_id(progress:PPkProgress; package_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_progress_get_package_id(progress:PPkProgress):Pgchar;cdecl;external;
function pk_progress_set_item_progress(progress:PPkProgress; item_progress:PPkItemProgress):Tgboolean;cdecl;external;
function pk_progress_get_item_progress(progress:PPkProgress):PPkItemProgress;cdecl;external;
(* Const before type ignored *)
function pk_progress_set_transaction_id(progress:PPkProgress; transaction_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_progress_get_transaction_id(progress:PPkProgress):Pgchar;cdecl;external;
function pk_progress_set_percentage(progress:PPkProgress; percentage:Tgint):Tgboolean;cdecl;external;
function pk_progress_get_percentage(progress:PPkProgress):Tgint;cdecl;external;
function pk_progress_set_status(progress:PPkProgress; status:TPkStatusEnum):Tgboolean;cdecl;external;
function pk_progress_get_status(progress:PPkProgress):TPkStatusEnum;cdecl;external;
function pk_progress_set_role(progress:PPkProgress; role:TPkRoleEnum):Tgboolean;cdecl;external;
function pk_progress_get_role(progress:PPkProgress):TPkRoleEnum;cdecl;external;
function pk_progress_set_allow_cancel(progress:PPkProgress; allow_cancel:Tgboolean):Tgboolean;cdecl;external;
function pk_progress_get_allow_cancel(progress:PPkProgress):Tgboolean;cdecl;external;
function pk_progress_set_caller_active(progress:PPkProgress; caller_active:Tgboolean):Tgboolean;cdecl;external;
function pk_progress_get_caller_active(progress:PPkProgress):Tgboolean;cdecl;external;
function pk_progress_set_elapsed_time(progress:PPkProgress; elapsed_time:Tguint):Tgboolean;cdecl;external;
function pk_progress_get_elapsed_time(progress:PPkProgress):Tguint;cdecl;external;
function pk_progress_set_remaining_time(progress:PPkProgress; remaining_time:Tguint):Tgboolean;cdecl;external;
function pk_progress_get_remaining_time(progress:PPkProgress):Tguint;cdecl;external;
function pk_progress_set_speed(progress:PPkProgress; speed:Tguint):Tgboolean;cdecl;external;
function pk_progress_get_speed(progress:PPkProgress):Tguint;cdecl;external;
function pk_progress_set_download_size_remaining(progress:PPkProgress; download_size_remaining:Tguint64):Tgboolean;cdecl;external;
function pk_progress_get_download_size_remaining(progress:PPkProgress):Tguint64;cdecl;external;
function pk_progress_set_transaction_flags(progress:PPkProgress; transaction_flags:Tguint64):Tgboolean;cdecl;external;
function pk_progress_get_transaction_flags(progress:PPkProgress):Tguint64;cdecl;external;
function pk_progress_set_uid(progress:PPkProgress; uid:Tguint):Tgboolean;cdecl;external;
function pk_progress_get_uid(progress:PPkProgress):Tguint;cdecl;external;
(* Const before type ignored *)
function pk_progress_set_sender(progress:PPkProgress; bus_name:Pgchar):Tgboolean;cdecl;external;
function pk_progress_get_sender(progress:PPkProgress):Pgchar;cdecl;external;
function pk_progress_set_package(progress:PPkProgress; package:PPkPackage):Tgboolean;cdecl;external;
function pk_progress_get_package(progress:PPkProgress):PPkPackage;cdecl;external;
{$endif}
{ __PK_PROGRESS_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_PROGRESS : longint; { return type might be wrong }
  begin
    PK_TYPE_PROGRESS:=pk_progress_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS(o : longint) : longint;
begin
  PK_PROGRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_PROGRESS,PkProgress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS_CLASS(k : longint) : longint;
begin
  PK_PROGRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_PROGRESS,PkProgressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PROGRESS(o : longint) : longint;
begin
  PK_IS_PROGRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_PROGRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PROGRESS_CLASS(k : longint) : longint;
begin
  PK_IS_PROGRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_PROGRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PROGRESS_GET_CLASS(o : longint) : longint;
begin
  PK_PROGRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_PROGRESS,PkProgressClass);
end;

{ was #define dname def_expr }
function PK_PROGRESS_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_PROGRESS_TYPE_ERROR:=pk_progress_error_get_type;
  end;


end.
