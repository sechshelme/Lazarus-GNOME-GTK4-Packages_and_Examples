
unit json_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_utils.h
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
Pchar  = ^char;
PGError  = ^GError;
PJsonNode  = ^JsonNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-utils.h - JSON utility API
 * 
 * This file is part of JSON-GLib
 * Copyright 2015  Emmanuele Bassi
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
  }
{$ifndef __JSON_UTILS_H__}
{$define __JSON_UTILS_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}
(* Const before type ignored *)

function json_from_string(str:Pchar; error:PPGError):PJsonNode;cdecl;external;
function json_to_string(node:PJsonNode; pretty:Tgboolean):Pchar;cdecl;external;
{$endif}
{ __JSON_UTILS_H__  }

implementation


end.
