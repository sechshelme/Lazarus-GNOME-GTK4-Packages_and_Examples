
unit json_path;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_path.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_path.h
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
PJsonPath  = ^JsonPath;
PJsonPathError  = ^JsonPathError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-path.h - JSONPath implementation
 *
 * This file is part of JSON-GLib
 * Copyright © 2011  Intel Corp.
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
 *   Emmanuele Bassi  <ebassi@linux.intel.com>
  }
{$ifndef __JSON_PATH_H__}
{$define __JSON_PATH_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}

{ was #define dname def_expr }
function JSON_TYPE_PATH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PATH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PATH(obj : longint) : longint;

{*
 * JSON_PATH_ERROR:
 *
 * Error domain for `JsonPath`.
 *
 * Since: 0.14
  }
{ was #define dname def_expr }
function JSON_PATH_ERROR : longint; { return type might be wrong }

{*
 * JsonPathError:
 * @JSON_PATH_ERROR_INVALID_QUERY: Invalid query
 *
 * Error codes for `JSON_PATH_ERROR`.
 *
 * This enumeration can be extended at later date
 *
 * Since: 0.14
  }
type
  PJsonPathError = ^TJsonPathError;
  TJsonPathError =  Longint;
  Const
    JSON_PATH_ERROR_INVALID_QUERY = 0;
;
type

function json_path_get_type:TGType;cdecl;external;
function json_path_error_quark:TGQuark;cdecl;external;
function json_path_new:PJsonPath;cdecl;external;
(* Const before type ignored *)
function json_path_compile(path:PJsonPath; expression:Pchar; error:PPGError):Tgboolean;cdecl;external;
function json_path_match(path:PJsonPath; root:PJsonNode):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_path_query(expression:Pchar; root:PJsonNode; error:PPGError):PJsonNode;cdecl;external;
{$endif}
{ __JSON_PATH_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_PATH : longint; { return type might be wrong }
  begin
    JSON_TYPE_PATH:=json_path_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PATH(obj : longint) : longint;
begin
  JSON_PATH:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_PATH,JsonPath);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PATH(obj : longint) : longint;
begin
  JSON_IS_PATH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_PATH);
end;

{ was #define dname def_expr }
function JSON_PATH_ERROR : longint; { return type might be wrong }
  begin
    JSON_PATH_ERROR:=json_path_error_quark;
  end;


end.
