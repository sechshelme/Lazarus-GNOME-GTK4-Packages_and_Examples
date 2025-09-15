
unit json_builder;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_builder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_builder.h
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
PJsonBuilder  = ^JsonBuilder;
PJsonBuilderClass  = ^JsonBuilderClass;
PJsonBuilderPrivate  = ^JsonBuilderPrivate;
PJsonNode  = ^JsonNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-builder.h: JSON tree builder
 *
 * This file is part of JSON-GLib
 * Copyright (C) 2010  Luca Bruno <lethalman88@gmail.com>
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
 *   Luca Bruno  <lethalman88@gmail.com>
  }
{$ifndef __JSON_BUILDER_H__}
{$define __JSON_BUILDER_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}

{ was #define dname def_expr }
function JSON_TYPE_BUILDER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_BUILDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_BUILDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER_GET_CLASS(obj : longint) : longint;

type
{< private > }
  PJsonBuilder = ^TJsonBuilder;
  TJsonBuilder = record
      parent_instance : TGObject;
      priv : PJsonBuilderPrivate;
    end;

{< private > }
{ padding, for future expansion  }
  PJsonBuilderClass = ^TJsonBuilderClass;
  TJsonBuilderClass = record
      parent_class : TGObjectClass;
      _json_reserved1 : procedure ;cdecl;
      _json_reserved2 : procedure ;cdecl;
    end;


function json_builder_get_type:TGType;cdecl;external;
function json_builder_new:PJsonBuilder;cdecl;external;
function json_builder_new_immutable:PJsonBuilder;cdecl;external;
function json_builder_get_root(builder:PJsonBuilder):PJsonNode;cdecl;external;
procedure json_builder_reset(builder:PJsonBuilder);cdecl;external;
function json_builder_begin_array(builder:PJsonBuilder):PJsonBuilder;cdecl;external;
function json_builder_end_array(builder:PJsonBuilder):PJsonBuilder;cdecl;external;
function json_builder_begin_object(builder:PJsonBuilder):PJsonBuilder;cdecl;external;
function json_builder_end_object(builder:PJsonBuilder):PJsonBuilder;cdecl;external;
(* Const before type ignored *)
function json_builder_set_member_name(builder:PJsonBuilder; member_name:Pgchar):PJsonBuilder;cdecl;external;
function json_builder_add_value(builder:PJsonBuilder; node:PJsonNode):PJsonBuilder;cdecl;external;
function json_builder_add_int_value(builder:PJsonBuilder; value:Tgint64):PJsonBuilder;cdecl;external;
function json_builder_add_double_value(builder:PJsonBuilder; value:Tgdouble):PJsonBuilder;cdecl;external;
function json_builder_add_boolean_value(builder:PJsonBuilder; value:Tgboolean):PJsonBuilder;cdecl;external;
(* Const before type ignored *)
function json_builder_add_string_value(builder:PJsonBuilder; value:Pgchar):PJsonBuilder;cdecl;external;
function json_builder_add_null_value(builder:PJsonBuilder):PJsonBuilder;cdecl;external;
{$endif}
{ __JSON_BUILDER_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_BUILDER : longint; { return type might be wrong }
  begin
    JSON_TYPE_BUILDER:=json_builder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER(obj : longint) : longint;
begin
  JSON_BUILDER:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_BUILDER,JsonBuilder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER_CLASS(klass : longint) : longint;
begin
  JSON_BUILDER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,JSON_TYPE_BUILDER,JsonBuilderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_BUILDER(obj : longint) : longint;
begin
  JSON_IS_BUILDER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_BUILDER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_BUILDER_CLASS(klass : longint) : longint;
begin
  JSON_IS_BUILDER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,JSON_TYPE_BUILDER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_BUILDER_GET_CLASS(obj : longint) : longint;
begin
  JSON_BUILDER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,JSON_TYPE_BUILDER,JsonBuilderClass);
end;


end.
