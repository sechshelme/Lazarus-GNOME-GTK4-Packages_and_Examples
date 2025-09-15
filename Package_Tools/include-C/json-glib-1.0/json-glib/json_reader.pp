
unit json_reader;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_reader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_reader.h
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
PJsonNode  = ^JsonNode;
PJsonReader  = ^JsonReader;
PJsonReaderClass  = ^JsonReaderClass;
PJsonReaderError  = ^JsonReaderError;
PJsonReaderPrivate  = ^JsonReaderPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-reader.h - JSON cursor parser
 * 
 * This file is part of JSON-GLib
 * Copyright (C) 2010  Intel Corp.
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
{$ifndef __JSON_READER_H__}
{$define __JSON_READER_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}

{ was #define dname def_expr }
function JSON_TYPE_READER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_READER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_READER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER_GET_CLASS(obj : longint) : longint;

{*
 * JSON_READER_ERROR:
 *
 * Error domain for `JsonReader`.
 *
 * Since: 0.12
  }
{ was #define dname def_expr }
function JSON_READER_ERROR : longint; { return type might be wrong }

type
{*
 * JsonReaderError:
 * @JSON_READER_ERROR_NO_ARRAY: No array found at the current position
 * @JSON_READER_ERROR_INVALID_INDEX: Index out of bounds
 * @JSON_READER_ERROR_NO_OBJECT: No object found at the current position
 * @JSON_READER_ERROR_INVALID_MEMBER: Member not found
 * @JSON_READER_ERROR_INVALID_NODE: No valid node found at the current position
 * @JSON_READER_ERROR_NO_VALUE: The node at the current position does not
 *   hold a value
 * @JSON_READER_ERROR_INVALID_TYPE: The node at the current position does not
 *   hold a value of the desired type
 *
 * Error codes for `JSON_READER_ERROR`.
 *
 * This enumeration can be extended at later date
 *
 * Since: 0.12
  }

  PJsonReaderError = ^TJsonReaderError;
  TJsonReaderError =  Longint;
  Const
    JSON_READER_ERROR_NO_ARRAY = 0;
    JSON_READER_ERROR_INVALID_INDEX = 1;
    JSON_READER_ERROR_NO_OBJECT = 2;
    JSON_READER_ERROR_INVALID_MEMBER = 3;
    JSON_READER_ERROR_INVALID_NODE = 4;
    JSON_READER_ERROR_NO_VALUE = 5;
    JSON_READER_ERROR_INVALID_TYPE = 6;
;
{< private > }
type
  PJsonReader = ^TJsonReader;
  TJsonReader = record
      parent_instance : TGObject;
      priv : PJsonReaderPrivate;
    end;

{< private > }
  PJsonReaderClass = ^TJsonReaderClass;
  TJsonReaderClass = record
      parent_class : TGObjectClass;
      _json_padding0 : procedure ;cdecl;
      _json_padding1 : procedure ;cdecl;
      _json_padding2 : procedure ;cdecl;
      _json_padding3 : procedure ;cdecl;
      _json_padding4 : procedure ;cdecl;
    end;


function json_reader_error_quark:TGQuark;cdecl;external;
function json_reader_get_type:TGType;cdecl;external;
function json_reader_new(node:PJsonNode):PJsonReader;cdecl;external;
procedure json_reader_set_root(reader:PJsonReader; root:PJsonNode);cdecl;external;
(* Const before type ignored *)
function json_reader_get_error(reader:PJsonReader):PGError;cdecl;external;
function json_reader_is_array(reader:PJsonReader):Tgboolean;cdecl;external;
function json_reader_read_element(reader:PJsonReader; index_:Tguint):Tgboolean;cdecl;external;
procedure json_reader_end_element(reader:PJsonReader);cdecl;external;
function json_reader_count_elements(reader:PJsonReader):Tgint;cdecl;external;
function json_reader_is_object(reader:PJsonReader):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_reader_read_member(reader:PJsonReader; member_name:Pgchar):Tgboolean;cdecl;external;
procedure json_reader_end_member(reader:PJsonReader);cdecl;external;
function json_reader_count_members(reader:PJsonReader):Tgint;cdecl;external;
function json_reader_list_members(reader:PJsonReader):^Pgchar;cdecl;external;
(* Const before type ignored *)
function json_reader_get_member_name(reader:PJsonReader):Pgchar;cdecl;external;
function json_reader_is_value(reader:PJsonReader):Tgboolean;cdecl;external;
function json_reader_get_value(reader:PJsonReader):PJsonNode;cdecl;external;
function json_reader_get_int_value(reader:PJsonReader):Tgint64;cdecl;external;
function json_reader_get_double_value(reader:PJsonReader):Tgdouble;cdecl;external;
(* Const before type ignored *)
function json_reader_get_string_value(reader:PJsonReader):Pgchar;cdecl;external;
function json_reader_get_boolean_value(reader:PJsonReader):Tgboolean;cdecl;external;
function json_reader_get_null_value(reader:PJsonReader):Tgboolean;cdecl;external;
function json_reader_get_current_node(reader:PJsonReader):PJsonNode;cdecl;external;
{$endif}
{ __JSON_READER_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_READER : longint; { return type might be wrong }
  begin
    JSON_TYPE_READER:=json_reader_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER(obj : longint) : longint;
begin
  JSON_READER:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_READER,JsonReader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER_CLASS(klass : longint) : longint;
begin
  JSON_READER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,JSON_TYPE_READER,JsonReaderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_READER(obj : longint) : longint;
begin
  JSON_IS_READER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_READER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_READER_CLASS(klass : longint) : longint;
begin
  JSON_IS_READER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,JSON_TYPE_READER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_READER_GET_CLASS(obj : longint) : longint;
begin
  JSON_READER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,JSON_TYPE_READER,JsonReaderClass);
end;

{ was #define dname def_expr }
function JSON_READER_ERROR : longint; { return type might be wrong }
  begin
    JSON_READER_ERROR:=json_reader_error_quark;
  end;


end.
