unit pk_media_change_required;

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
{$ifndef __PK_MEDIA_CHANGE_REQUIRED_H}
{$define __PK_MEDIA_CHANGE_REQUIRED_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkMediaChangeRequired, g_object_unref) }
{$endif}
type
  PPkMediaChangeRequired = ^TPkMediaChangeRequired;
  TPkMediaChangeRequired = record
      parent : TPkSource;
      priv : PPkMediaChangeRequiredPrivate;
    end;

{ padding for future expansion  }
  PPkMediaChangeRequiredClass = ^TPkMediaChangeRequiredClass;
  TPkMediaChangeRequiredClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_media_change_required_get_type:TGType;cdecl;external libpackagekit ;
function pk_media_change_required_new:PPkMediaChangeRequired;cdecl;external libpackagekit ;
{$endif}
{ __PK_MEDIA_CHANGE_REQUIRED_H  }

// === Konventiert am: 7-9-26 15:08:22 ===

function PK_TYPE_MEDIA_CHANGE_REQUIRED : TGType;
function PK_MEDIA_CHANGE_REQUIRED(obj : Pointer) : PPkMediaChangeRequired;
function PK_MEDIA_CHANGE_REQUIRED_CLASS(klass : Pointer) : PPkMediaChangeRequiredClass;
function PK_IS_MEDIA_CHANGE_REQUIRED(obj : Pointer) : Tgboolean;
function PK_IS_MEDIA_CHANGE_REQUIRED_CLASS(klass : Pointer) : Tgboolean;
function PK_MEDIA_CHANGE_REQUIRED_GET_CLASS(obj : Pointer) : PPkMediaChangeRequiredClass;

implementation

function PK_TYPE_MEDIA_CHANGE_REQUIRED : TGType;
  begin
    PK_TYPE_MEDIA_CHANGE_REQUIRED:=pk_media_change_required_get_type;
  end;

function PK_MEDIA_CHANGE_REQUIRED(obj : Pointer) : PPkMediaChangeRequired;
begin
  Result := PPkMediaChangeRequired(g_type_check_instance_cast(obj, PK_TYPE_MEDIA_CHANGE_REQUIRED));
end;

function PK_MEDIA_CHANGE_REQUIRED_CLASS(klass : Pointer) : PPkMediaChangeRequiredClass;
begin
  Result := PPkMediaChangeRequiredClass(g_type_check_class_cast(klass, PK_TYPE_MEDIA_CHANGE_REQUIRED));
end;

function PK_IS_MEDIA_CHANGE_REQUIRED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_MEDIA_CHANGE_REQUIRED);
end;

function PK_IS_MEDIA_CHANGE_REQUIRED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_MEDIA_CHANGE_REQUIRED);
end;

function PK_MEDIA_CHANGE_REQUIRED_GET_CLASS(obj : Pointer) : PPkMediaChangeRequiredClass;
begin
  Result := PPkMediaChangeRequiredClass(PGTypeInstance(obj)^.g_class);
end;



end.
