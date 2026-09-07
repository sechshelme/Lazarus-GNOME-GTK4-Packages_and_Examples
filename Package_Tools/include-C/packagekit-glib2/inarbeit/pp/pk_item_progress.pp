
unit pk_item_progress;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_item_progress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_item_progress.h
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
PPkItemProgressClass  = ^PkItemProgressClass;
PPkItemProgressPrivate  = ^PkItemProgressPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
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
 * Lesser General Public License for more item_progress.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_ITEM_PROGRESS_H}
{$define __PK_ITEM_PROGRESS_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

{ was #define dname def_expr }
function PK_TYPE_ITEM_PROGRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_ITEM_PROGRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_ITEM_PROGRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS_GET_CLASS(o : longint) : longint;

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkItemProgress, g_object_unref) }
{$endif}
type
  PPkItemProgress = ^TPkItemProgress;
  TPkItemProgress = record
      parent : TPkSource;
      priv : PPkItemProgressPrivate;
    end;

{ padding for future expansion  }
  PPkItemProgressClass = ^TPkItemProgressClass;
  TPkItemProgressClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_item_progress_get_type:TGType;cdecl;external;
function pk_item_progress_new:PPkItemProgress;cdecl;external;
function pk_item_progress_get_status(item_progress:PPkItemProgress):TPkStatusEnum;cdecl;external;
function pk_item_progress_get_percentage(item_progress:PPkItemProgress):Tguint;cdecl;external;
(* Const before type ignored *)
function pk_item_progress_get_package_id(item_progress:PPkItemProgress):Pgchar;cdecl;external;
{$endif}
{ __PK_ITEM_PROGRESS_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_ITEM_PROGRESS : longint; { return type might be wrong }
  begin
    PK_TYPE_ITEM_PROGRESS:=pk_item_progress_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS(o : longint) : longint;
begin
  PK_ITEM_PROGRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_ITEM_PROGRESS,PkItemProgress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS_CLASS(k : longint) : longint;
begin
  PK_ITEM_PROGRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_ITEM_PROGRESS,PkItemProgressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_ITEM_PROGRESS(o : longint) : longint;
begin
  PK_IS_ITEM_PROGRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_ITEM_PROGRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_ITEM_PROGRESS_CLASS(k : longint) : longint;
begin
  PK_IS_ITEM_PROGRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_ITEM_PROGRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_ITEM_PROGRESS_GET_CLASS(o : longint) : longint;
begin
  PK_ITEM_PROGRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_ITEM_PROGRESS,PkItemProgressClass);
end;


end.
