unit as_developer;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2018-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsDeveloper, as_developer, AS, DEVELOPER, GObject) }
{< private > }
type
  PAsDeveloperClass = ^TAsDeveloperClass;
  TAsDeveloperClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;


function as_developer_new:PAsDeveloper;cdecl;external libappstream;
function as_developer_get_id(devp:PAsDeveloper):Pgchar;cdecl;external libappstream;
procedure as_developer_set_id(devp:PAsDeveloper; id:Pgchar);cdecl;external libappstream;
function as_developer_get_name(devp:PAsDeveloper):Pgchar;cdecl;external libappstream;
procedure as_developer_set_name(devp:PAsDeveloper; value:Pgchar; locale:Pgchar);cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:36:09 ===

function AS_TYPE_DEVELOPER: TGType;
function AS_DEVELOPER(obj: Pointer): PAsDeveloper;
function AS_IS_DEVELOPER(obj: Pointer): Tgboolean;
function AS_DEVELOPER_CLASS(klass: Pointer): PAsDeveloperClass;
function AS_IS_DEVELOPER_CLASS(klass: Pointer): Tgboolean;
function AS_DEVELOPER_GET_CLASS(obj: Pointer): PAsDeveloperClass;

implementation

function AS_TYPE_DEVELOPER: TGType;
begin
  Result := as_developer_get_type;
end;

function AS_DEVELOPER(obj: Pointer): PAsDeveloper;
begin
  Result := PAsDeveloper(g_type_check_instance_cast(obj, AS_TYPE_DEVELOPER));
end;

function AS_IS_DEVELOPER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_DEVELOPER);
end;

function AS_DEVELOPER_CLASS(klass: Pointer): PAsDeveloperClass;
begin
  Result := PAsDeveloperClass(g_type_check_class_cast(klass, AS_TYPE_DEVELOPER));
end;

function AS_IS_DEVELOPER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_DEVELOPER);
end;

function AS_DEVELOPER_GET_CLASS(obj: Pointer): PAsDeveloperClass;
begin
  Result := PAsDeveloperClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsDeveloper = record
    parent_instance: TGObject;
  end;
  PAsDeveloper = ^TAsDeveloper;

  PAsDeveloperClass = type Pointer;

function as_developer_get_type: TGType; cdecl; external libgxxxxxxx;



end.
