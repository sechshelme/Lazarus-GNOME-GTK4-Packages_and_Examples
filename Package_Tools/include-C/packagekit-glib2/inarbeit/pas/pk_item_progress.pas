unit pk_item_progress;

interface

uses
  fp_glib2, fp_packagekit;

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


function pk_item_progress_get_type:TGType;cdecl;external libpackagekit ;
function pk_item_progress_new:PPkItemProgress;cdecl;external libpackagekit ;
function pk_item_progress_get_status(item_progress:PPkItemProgress):TPkStatusEnum;cdecl;external libpackagekit ;
function pk_item_progress_get_percentage(item_progress:PPkItemProgress):Tguint;cdecl;external libpackagekit ;
function pk_item_progress_get_package_id(item_progress:PPkItemProgress):Pgchar;cdecl;external libpackagekit ;
{$endif}
{ __PK_ITEM_PROGRESS_H  }

// === Konventiert am: 7-9-26 15:08:28 ===

function PK_TYPE_ITEM_PROGRESS : TGType;
function PK_ITEM_PROGRESS(obj : Pointer) : PPkItemProgress;
function PK_ITEM_PROGRESS_CLASS(klass : Pointer) : PPkItemProgressClass;
function PK_IS_ITEM_PROGRESS(obj : Pointer) : Tgboolean;
function PK_IS_ITEM_PROGRESS_CLASS(klass : Pointer) : Tgboolean;
function PK_ITEM_PROGRESS_GET_CLASS(obj : Pointer) : PPkItemProgressClass;

implementation

function PK_TYPE_ITEM_PROGRESS : TGType;
  begin
    PK_TYPE_ITEM_PROGRESS:=pk_item_progress_get_type;
  end;

function PK_ITEM_PROGRESS(obj : Pointer) : PPkItemProgress;
begin
  Result := PPkItemProgress(g_type_check_instance_cast(obj, PK_TYPE_ITEM_PROGRESS));
end;

function PK_ITEM_PROGRESS_CLASS(klass : Pointer) : PPkItemProgressClass;
begin
  Result := PPkItemProgressClass(g_type_check_class_cast(klass, PK_TYPE_ITEM_PROGRESS));
end;

function PK_IS_ITEM_PROGRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_ITEM_PROGRESS);
end;

function PK_IS_ITEM_PROGRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_ITEM_PROGRESS);
end;

function PK_ITEM_PROGRESS_GET_CLASS(obj : Pointer) : PPkItemProgressClass;
begin
  Result := PPkItemProgressClass(PGTypeInstance(obj)^.g_class);
end;



end.
