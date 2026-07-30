unit as_provided;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_PROVIDED_H}
{$define __AS_PROVIDED_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsProvided, as_provided, AS, PROVIDED, GObject) }
{< private > }
type
  PAsProvidedClass = ^TAsProvidedClass;
  TAsProvidedClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsProvidedKind:
 * @AS_PROVIDED_KIND_UNKNOWN:		Unknown kind
 * @AS_PROVIDED_KIND_LIBRARY:		A shared library
 * @AS_PROVIDED_KIND_BINARY:		A binary installed into a directory in PATH
 * @AS_PROVIDED_KIND_MEDIATYPE:		Provides a handler for a mimetype
 * @AS_PROVIDED_KIND_FONT:		A font
 * @AS_PROVIDED_KIND_MODALIAS:		A modalias
 * @AS_PROVIDED_KIND_PYTHON:		A Python 3 module
 * @AS_PROVIDED_KIND_DBUS_SYSTEM:	A DBus service name on the system bus.
 * @AS_PROVIDED_KIND_DBUS_USER:		A DBus service name on the user/session bus.
 * @AS_PROVIDED_KIND_FIRMWARE_RUNTIME:	Firmware flashed at runtime.
 * @AS_PROVIDED_KIND_FIRMWARE_FLASHED:	Firmware flashed permanently to the device.
 * @AS_PROVIDED_KIND_ID:		An AppStream component
 *
 * Type of the public interface components can provide.
 * }
{< private > }

  PAsProvidedKind = ^TAsProvidedKind;
  TAsProvidedKind =  Longint;
  Const
    AS_PROVIDED_KIND_UNKNOWN = 0;
    AS_PROVIDED_KIND_LIBRARY = 1;
    AS_PROVIDED_KIND_BINARY = 2;
    AS_PROVIDED_KIND_MEDIATYPE = 3;
    AS_PROVIDED_KIND_FONT = 4;
    AS_PROVIDED_KIND_MODALIAS = 5;
    AS_PROVIDED_KIND_PYTHON = 6;
    AS_PROVIDED_KIND_DBUS_SYSTEM = 7;
    AS_PROVIDED_KIND_DBUS_USER = 8;
    AS_PROVIDED_KIND_FIRMWARE_RUNTIME = 9;
    AS_PROVIDED_KIND_FIRMWARE_FLASHED = 10;
    AS_PROVIDED_KIND_ID = 11;
    AS_PROVIDED_KIND_LAST = 12;
;

function as_provided_kind_to_string(kind:TAsProvidedKind):Pgchar;cdecl;external libappstream;
function as_provided_kind_from_string(kind_str:Pgchar):TAsProvidedKind;cdecl;external libappstream;
function as_provided_kind_to_l10n_string(kind:TAsProvidedKind):Pgchar;cdecl;external libappstream;
function as_provided_new:PAsProvided;cdecl;external libappstream;
function as_provided_get_kind(prov:PAsProvided):TAsProvidedKind;cdecl;external libappstream;
procedure as_provided_set_kind(prov:PAsProvided; kind:TAsProvidedKind);cdecl;external libappstream;
function as_provided_get_items(prov:PAsProvided):PGPtrArray;cdecl;external libappstream;
procedure as_provided_add_item(prov:PAsProvided; item:Pgchar);cdecl;external libappstream;
function as_provided_has_item(prov:PAsProvided; item:Pgchar):Tgboolean;cdecl;external libappstream;
{$endif}
{ __AS_PROVIDED_H  }

// === Konventiert am: 30-7-26 19:35:40 ===

function AS_TYPE_PROVIDED: TGType;
function AS_PROVIDED(obj: Pointer): PAsProvided;
function AS_IS_PROVIDED(obj: Pointer): Tgboolean;
function AS_PROVIDED_CLASS(klass: Pointer): PAsProvidedClass;
function AS_IS_PROVIDED_CLASS(klass: Pointer): Tgboolean;
function AS_PROVIDED_GET_CLASS(obj: Pointer): PAsProvidedClass;

implementation

function AS_TYPE_PROVIDED: TGType;
begin
  Result := as_provided_get_type;
end;

function AS_PROVIDED(obj: Pointer): PAsProvided;
begin
  Result := PAsProvided(g_type_check_instance_cast(obj, AS_TYPE_PROVIDED));
end;

function AS_IS_PROVIDED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_PROVIDED);
end;

function AS_PROVIDED_CLASS(klass: Pointer): PAsProvidedClass;
begin
  Result := PAsProvidedClass(g_type_check_class_cast(klass, AS_TYPE_PROVIDED));
end;

function AS_IS_PROVIDED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_PROVIDED);
end;

function AS_PROVIDED_GET_CLASS(obj: Pointer): PAsProvidedClass;
begin
  Result := PAsProvidedClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsProvided = record
    parent_instance: TGObject;
  end;
  PAsProvided = ^TAsProvided;

  PAsProvidedClass = type Pointer;

function as_provided_get_type: TGType; cdecl; external libgxxxxxxx;



end.
