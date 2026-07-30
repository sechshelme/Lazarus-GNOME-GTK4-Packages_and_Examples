
unit as_launchable;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_launchable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_launchable.h
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
PAsLaunchable  = ^AsLaunchable;
PAsLaunchableClass  = ^AsLaunchableClass;
PAsLaunchableKind  = ^AsLaunchableKind;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
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

{ was #define dname def_expr }
function AS_TYPE_LAUNCHABLE : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_launchable_kind_to_string(kind:TAsLaunchableKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_launchable_kind_from_string(kind_str:Pgchar):TAsLaunchableKind;cdecl;external;
function as_launchable_new:PAsLaunchable;cdecl;external;
function as_launchable_get_kind(launch:PAsLaunchable):TAsLaunchableKind;cdecl;external;
procedure as_launchable_set_kind(launch:PAsLaunchable; kind:TAsLaunchableKind);cdecl;external;
function as_launchable_get_entries(launch:PAsLaunchable):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_launchable_add_entry(launch:PAsLaunchable; entry:Pgchar);cdecl;external;
{$endif}
{ __AS_LAUNCHABLE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_LAUNCHABLE : longint; { return type might be wrong }
  begin
    AS_TYPE_LAUNCHABLE:=as_launchable_get_type;
  end;


end.
