
unit json_parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_parser.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PJsonArray  = ^JsonArray;
PJsonNode  = ^JsonNode;
PJsonObject  = ^JsonObject;
PJsonParser  = ^JsonParser;
PJsonParserClass  = ^JsonParserClass;
PJsonParserError  = ^JsonParserError;
PJsonParserPrivate  = ^JsonParserPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-parser.h - JSON streams parser
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
 *   Emmanuele Bassi  <ebassi@linux.intel.com>
  }
{$ifndef __JSON_PARSER_H__}
{$define __JSON_PARSER_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include <json-glib/json-types.h>}

{ was #define dname def_expr }
function JSON_TYPE_PARSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PARSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PARSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER_GET_CLASS(obj : longint) : longint;

{*
 * JSON_PARSER_ERROR:
 *
 * Error domain for `JsonParser`.
  }
{ was #define dname def_expr }
function JSON_PARSER_ERROR : longint; { return type might be wrong }

type
{*
 * JsonParserError:
 * @JSON_PARSER_ERROR_PARSE: parse error
 * @JSON_PARSER_ERROR_TRAILING_COMMA: unexpected trailing comma
 * @JSON_PARSER_ERROR_MISSING_COMMA: expected comma
 * @JSON_PARSER_ERROR_MISSING_COLON: expected colon
 * @JSON_PARSER_ERROR_INVALID_BAREWORD: invalid bareword
 * @JSON_PARSER_ERROR_EMPTY_MEMBER_NAME: empty member name (Since: 0.16)
 * @JSON_PARSER_ERROR_INVALID_DATA: invalid data (Since: 0.18)
 * @JSON_PARSER_ERROR_UNKNOWN: unknown error
 *
 * Error codes for `JSON_PARSER_ERROR`.
 *
 * This enumeration can be extended at later date
  }

  PJsonParserError = ^TJsonParserError;
  TJsonParserError =  Longint;
  Const
    JSON_PARSER_ERROR_PARSE = 0;
    JSON_PARSER_ERROR_TRAILING_COMMA = 1;
    JSON_PARSER_ERROR_MISSING_COMMA = 2;
    JSON_PARSER_ERROR_MISSING_COLON = 3;
    JSON_PARSER_ERROR_INVALID_BAREWORD = 4;
    JSON_PARSER_ERROR_EMPTY_MEMBER_NAME = 5;
    JSON_PARSER_ERROR_INVALID_DATA = 6;
    JSON_PARSER_ERROR_UNKNOWN = 7;
;
{< private > }
type
  PJsonParser = ^TJsonParser;
  TJsonParser = record
      parent_instance : TGObject;
      priv : PJsonParserPrivate;
    end;

{*
 * JsonParserClass:
 * @parse_start: class handler for the JsonParser::parse-start signal
 * @object_start: class handler for the JsonParser::object-start signal
 * @object_member: class handler for the JsonParser::object-member signal
 * @object_end: class handler for the JsonParser::object-end signal
 * @array_start: class handler for the JsonParser::array-start signal
 * @array_element: class handler for the JsonParser::array-element signal
 * @array_end: class handler for the JsonParser::array-end signal
 * @parse_end: class handler for the JsonParser::parse-end signal
 * @error: class handler for the JsonParser::error signal
 *
 * The class structure for the JsonParser type.
  }
{< private > }
{< public  > }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ padding for future expansion  }
  PJsonParserClass = ^TJsonParserClass;
  TJsonParserClass = record
      parent_class : TGObjectClass;
      parse_start : procedure (parser:PJsonParser);cdecl;
      object_start : procedure (parser:PJsonParser);cdecl;
      object_member : procedure (parser:PJsonParser; object:PJsonObject; member_name:Pgchar);cdecl;
      object_end : procedure (parser:PJsonParser; object:PJsonObject);cdecl;
      array_start : procedure (parser:PJsonParser);cdecl;
      array_element : procedure (parser:PJsonParser; array:PJsonArray; index_:Tgint);cdecl;
      array_end : procedure (parser:PJsonParser; array:PJsonArray);cdecl;
      parse_end : procedure (parser:PJsonParser);cdecl;
      error : procedure (parser:PJsonParser; error:PGError);cdecl;
      _json_reserved1 : procedure ;cdecl;
      _json_reserved2 : procedure ;cdecl;
      _json_reserved3 : procedure ;cdecl;
      _json_reserved4 : procedure ;cdecl;
      _json_reserved5 : procedure ;cdecl;
      _json_reserved6 : procedure ;cdecl;
      _json_reserved7 : procedure ;cdecl;
      _json_reserved8 : procedure ;cdecl;
    end;


function json_parser_error_quark:TGQuark;cdecl;external;
function json_parser_get_type:TGType;cdecl;external;
function json_parser_new:PJsonParser;cdecl;external;
function json_parser_new_immutable:PJsonParser;cdecl;external;
(* Const before type ignored *)
function json_parser_load_from_file(parser:PJsonParser; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_parser_load_from_mapped_file(parser:PJsonParser; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_parser_load_from_data(parser:PJsonParser; data:Pgchar; length:Tgssize; error:PPGError):Tgboolean;cdecl;external;
function json_parser_load_from_stream(parser:PJsonParser; stream:PGInputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure json_parser_load_from_stream_async(parser:PJsonParser; stream:PGInputStream; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function json_parser_load_from_stream_finish(parser:PJsonParser; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function json_parser_get_root(parser:PJsonParser):PJsonNode;cdecl;external;
function json_parser_steal_root(parser:PJsonParser):PJsonNode;cdecl;external;
function json_parser_get_current_line(parser:PJsonParser):Tguint;cdecl;external;
function json_parser_get_current_pos(parser:PJsonParser):Tguint;cdecl;external;
function json_parser_has_assignment(parser:PJsonParser; variable_name:PPgchar):Tgboolean;cdecl;external;
{$endif}
{ __JSON_PARSER_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_PARSER : longint; { return type might be wrong }
  begin
    JSON_TYPE_PARSER:=json_parser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER(obj : longint) : longint;
begin
  JSON_PARSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_PARSER,JsonParser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER_CLASS(klass : longint) : longint;
begin
  JSON_PARSER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,JSON_TYPE_PARSER,JsonParserClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PARSER(obj : longint) : longint;
begin
  JSON_IS_PARSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_PARSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_PARSER_CLASS(klass : longint) : longint;
begin
  JSON_IS_PARSER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,JSON_TYPE_PARSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_PARSER_GET_CLASS(obj : longint) : longint;
begin
  JSON_PARSER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,JSON_TYPE_PARSER,JsonParserClass);
end;

{ was #define dname def_expr }
function JSON_PARSER_ERROR : longint; { return type might be wrong }
  begin
    JSON_PARSER_ERROR:=json_parser_error_quark;
  end;


end.
