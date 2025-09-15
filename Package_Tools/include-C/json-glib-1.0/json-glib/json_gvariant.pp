
unit json_gvariant;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_gvariant.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_gvariant.h
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
PGError  = ^GError;
Pgsize  = ^gsize;
PGVariant  = ^GVariant;
PJsonNode  = ^JsonNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-gvariant.h - JSON GVariant integration
 *
 * This file is part of JSON-GLib
 * Copyright (C) 2007  OpenedHand Ltd.
 * Copyright (C) 2009  Intel Corp.
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author:
 *   Eduardo Lima Mitev  <elima@igalia.com>
  }
{$ifndef __JSON_GVARIANT_H__}
{$define __JSON_GVARIANT_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}

function json_gvariant_serialize(variant:PGVariant):PJsonNode;cdecl;external;
function json_gvariant_serialize_data(variant:PGVariant; length:Pgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function json_gvariant_deserialize(json_node:PJsonNode; signature:Pgchar; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function json_gvariant_deserialize_data(json:Pgchar; length:Tgssize; signature:Pgchar; error:PPGError):PGVariant;cdecl;external;
{$endif}
{ __JSON_GVARIANT_H__  }

implementation


end.
