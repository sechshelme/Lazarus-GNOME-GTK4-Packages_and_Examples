
unit json_generator;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_generator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_generator.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGOutputStream  = ^GOutputStream;
Pgsize  = ^gsize;
PGString  = ^GString;
PJsonGenerator  = ^JsonGenerator;
PJsonGeneratorClass  = ^JsonGeneratorClass;
PJsonGeneratorPrivate  = ^JsonGeneratorPrivate;
PJsonNode  = ^JsonNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-generator.h - JSON streams generator
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
{$ifndef __JSON_GENERATOR_H__}
{$define __JSON_GENERATOR_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <json-glib/json-types.h>}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function JSON_TYPE_GENERATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_GENERATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_GENERATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR_GET_CLASS(obj : longint) : longint;

type
{< private > }
  PJsonGenerator = ^TJsonGenerator;
  TJsonGenerator = record
      parent_instance : TGObject;
      priv : PJsonGeneratorPrivate;
    end;

{< private > }
{ padding, for future expansion  }
  PJsonGeneratorClass = ^TJsonGeneratorClass;
  TJsonGeneratorClass = record
      parent_class : TGObjectClass;
      _json_reserved1 : procedure ;cdecl;
      _json_reserved2 : procedure ;cdecl;
      _json_reserved3 : procedure ;cdecl;
      _json_reserved4 : procedure ;cdecl;
    end;


function json_generator_get_type:TGType;cdecl;external;
function json_generator_new:PJsonGenerator;cdecl;external;
procedure json_generator_set_pretty(generator:PJsonGenerator; is_pretty:Tgboolean);cdecl;external;
function json_generator_get_pretty(generator:PJsonGenerator):Tgboolean;cdecl;external;
procedure json_generator_set_indent(generator:PJsonGenerator; indent_level:Tguint);cdecl;external;
function json_generator_get_indent(generator:PJsonGenerator):Tguint;cdecl;external;
procedure json_generator_set_indent_char(generator:PJsonGenerator; indent_char:Tgunichar);cdecl;external;
function json_generator_get_indent_char(generator:PJsonGenerator):Tgunichar;cdecl;external;
procedure json_generator_set_root(generator:PJsonGenerator; node:PJsonNode);cdecl;external;
function json_generator_get_root(generator:PJsonGenerator):PJsonNode;cdecl;external;
function json_generator_to_gstring(generator:PJsonGenerator; _string:PGString):PGString;cdecl;external;
function json_generator_to_data(generator:PJsonGenerator; length:Pgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function json_generator_to_file(generator:PJsonGenerator; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external;
function json_generator_to_stream(generator:PJsonGenerator; stream:PGOutputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __JSON_GENERATOR_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_GENERATOR : longint; { return type might be wrong }
  begin
    JSON_TYPE_GENERATOR:=json_generator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR(obj : longint) : longint;
begin
  JSON_GENERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_GENERATOR,JsonGenerator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR_CLASS(klass : longint) : longint;
begin
  JSON_GENERATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,JSON_TYPE_GENERATOR,JsonGeneratorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_GENERATOR(obj : longint) : longint;
begin
  JSON_IS_GENERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_GENERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_GENERATOR_CLASS(klass : longint) : longint;
begin
  JSON_IS_GENERATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,JSON_TYPE_GENERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_GENERATOR_GET_CLASS(obj : longint) : longint;
begin
  JSON_GENERATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,JSON_TYPE_GENERATOR,JsonGeneratorClass);
end;


end.
