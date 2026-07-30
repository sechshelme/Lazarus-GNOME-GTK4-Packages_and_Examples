
unit as_developer;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_developer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_developer.h
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
PAsDeveloper  = ^AsDeveloper;
PAsDeveloperClass  = ^AsDeveloperClass;
Pgchar  = ^gchar;
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

{ was #define dname def_expr }
function AS_TYPE_DEVELOPER : longint; { return type might be wrong }

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


function as_developer_new:PAsDeveloper;cdecl;external;
(* Const before type ignored *)
function as_developer_get_id(devp:PAsDeveloper):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_developer_set_id(devp:PAsDeveloper; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_developer_get_name(devp:PAsDeveloper):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_developer_set_name(devp:PAsDeveloper; value:Pgchar; locale:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function AS_TYPE_DEVELOPER : longint; { return type might be wrong }
  begin
    AS_TYPE_DEVELOPER:=as_developer_get_type;
  end;


end.
