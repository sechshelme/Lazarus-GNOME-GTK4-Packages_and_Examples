unit as_launchable;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2017-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_LAUNCHABLE_H}
{$define __AS_LAUNCHABLE_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsLaunchable, as_launchable, AS, LAUNCHABLE, GObject) }
{< private > }
type
  PAsLaunchableClass = ^TAsLaunchableClass;
  TAsLaunchableClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsLaunchableKind:
 * @AS_LAUNCHABLE_KIND_UNKNOWN:			Unknown kind
 * @AS_LAUNCHABLE_KIND_DESKTOP_ID:		Launch by desktop-id
 * @AS_LAUNCHABLE_KIND_SERVICE:			A systemd/SysV-init service name
 * @AS_LAUNCHABLE_KIND_COCKPIT_MANIFEST:	A Cockpit manifest / package name
 * @AS_LAUNCHABLE_KIND_URL:			A web HTTPS URL to launch a web application from
 *
 * Type of launch system the entries belong to.
 * }
{< private > }

  PAsLaunchableKind = ^TAsLaunchableKind;
  TAsLaunchableKind =  Longint;
  Const
    AS_LAUNCHABLE_KIND_UNKNOWN = 0;
    AS_LAUNCHABLE_KIND_DESKTOP_ID = 1;
    AS_LAUNCHABLE_KIND_SERVICE = 2;
    AS_LAUNCHABLE_KIND_COCKPIT_MANIFEST = 3;
    AS_LAUNCHABLE_KIND_URL = 4;
    AS_LAUNCHABLE_KIND_LAST = 5;
;

function as_launchable_kind_to_string(kind:TAsLaunchableKind):Pgchar;cdecl;external libappstream;
function as_launchable_kind_from_string(kind_str:Pgchar):TAsLaunchableKind;cdecl;external libappstream;
function as_launchable_new:PAsLaunchable;cdecl;external libappstream;
function as_launchable_get_kind(launch:PAsLaunchable):TAsLaunchableKind;cdecl;external libappstream;
procedure as_launchable_set_kind(launch:PAsLaunchable; kind:TAsLaunchableKind);cdecl;external libappstream;
function as_launchable_get_entries(launch:PAsLaunchable):PGPtrArray;cdecl;external libappstream;
procedure as_launchable_add_entry(launch:PAsLaunchable; entry:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_LAUNCHABLE_H  }

// === Konventiert am: 30-7-26 19:35:50 ===

function AS_TYPE_LAUNCHABLE: TGType;
function AS_LAUNCHABLE(obj: Pointer): PAsLaunchable;
function AS_IS_LAUNCHABLE(obj: Pointer): Tgboolean;
function AS_LAUNCHABLE_CLASS(klass: Pointer): PAsLaunchableClass;
function AS_IS_LAUNCHABLE_CLASS(klass: Pointer): Tgboolean;
function AS_LAUNCHABLE_GET_CLASS(obj: Pointer): PAsLaunchableClass;

implementation

function AS_TYPE_LAUNCHABLE: TGType;
begin
  Result := as_launchable_get_type;
end;

function AS_LAUNCHABLE(obj: Pointer): PAsLaunchable;
begin
  Result := PAsLaunchable(g_type_check_instance_cast(obj, AS_TYPE_LAUNCHABLE));
end;

function AS_IS_LAUNCHABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_LAUNCHABLE);
end;

function AS_LAUNCHABLE_CLASS(klass: Pointer): PAsLaunchableClass;
begin
  Result := PAsLaunchableClass(g_type_check_class_cast(klass, AS_TYPE_LAUNCHABLE));
end;

function AS_IS_LAUNCHABLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_LAUNCHABLE);
end;

function AS_LAUNCHABLE_GET_CLASS(obj: Pointer): PAsLaunchableClass;
begin
  Result := PAsLaunchableClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsLaunchable = record
    parent_instance: TGObject;
  end;
  PAsLaunchable = ^TAsLaunchable;

  PAsLaunchableClass = type Pointer;

function as_launchable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
