
unit gsettingsschema;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsettingsschema.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsettingsschema.h
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
PGSettingsSchema  = ^GSettingsSchema;
PGSettingsSchemaKey  = ^GSettingsSchemaKey;
PGSettingsSchemaSource  = ^GSettingsSchemaSource;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
 * Copyright © 2011 Canonical Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_SETTINGS_SCHEMA_H__}
{$define __G_SETTINGS_SCHEMA_H__}
{$include <glib-object.h>}
{$include <gio/gio-visibility.h>}
type

{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA_SOURCE : longint; { return type might be wrong }

function g_settings_schema_source_get_type:TGType;cdecl;external;
function g_settings_schema_source_get_default:PGSettingsSchemaSource;cdecl;external;
function g_settings_schema_source_ref(source:PGSettingsSchemaSource):PGSettingsSchemaSource;cdecl;external;
procedure g_settings_schema_source_unref(source:PGSettingsSchemaSource);cdecl;external;
(* Const before type ignored *)
function g_settings_schema_source_new_from_directory(directory:Pgchar; parent:PGSettingsSchemaSource; trusted:Tgboolean; error:PPGError):PGSettingsSchemaSource;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_source_lookup(source:PGSettingsSchemaSource; schema_id:Pgchar; recursive:Tgboolean):PGSettingsSchema;cdecl;external;
procedure g_settings_schema_source_list_schemas(source:PGSettingsSchemaSource; recursive:Tgboolean; non_relocatable:PPPgchar; relocatable:PPPgchar);cdecl;external;
{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA : longint; { return type might be wrong }

function g_settings_schema_get_type:TGType;cdecl;external;
function g_settings_schema_ref(schema:PGSettingsSchema):PGSettingsSchema;cdecl;external;
procedure g_settings_schema_unref(schema:PGSettingsSchema);cdecl;external;
(* Const before type ignored *)
function g_settings_schema_get_id(schema:PGSettingsSchema):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_get_path(schema:PGSettingsSchema):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_get_key(schema:PGSettingsSchema; name:Pgchar):PGSettingsSchemaKey;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_has_key(schema:PGSettingsSchema; name:Pgchar):Tgboolean;cdecl;external;
function g_settings_schema_list_keys(schema:PGSettingsSchema):^Pgchar;cdecl;external;
function g_settings_schema_list_children(schema:PGSettingsSchema):^Pgchar;cdecl;external;
{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA_KEY : longint; { return type might be wrong }

function g_settings_schema_key_get_type:TGType;cdecl;external;
function g_settings_schema_key_ref(key:PGSettingsSchemaKey):PGSettingsSchemaKey;cdecl;external;
procedure g_settings_schema_key_unref(key:PGSettingsSchemaKey);cdecl;external;
(* Const before type ignored *)
function g_settings_schema_key_get_value_type(key:PGSettingsSchemaKey):PGVariantType;cdecl;external;
function g_settings_schema_key_get_default_value(key:PGSettingsSchemaKey):PGVariant;cdecl;external;
function g_settings_schema_key_get_range(key:PGSettingsSchemaKey):PGVariant;cdecl;external;
function g_settings_schema_key_range_check(key:PGSettingsSchemaKey; value:PGVariant):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_key_get_name(key:PGSettingsSchemaKey):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_key_get_summary(key:PGSettingsSchemaKey):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_settings_schema_key_get_description(key:PGSettingsSchemaKey):Pgchar;cdecl;external;
{$endif}
{ __G_SETTINGS_SCHEMA_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA_SOURCE : longint; { return type might be wrong }
  begin
    G_TYPE_SETTINGS_SCHEMA_SOURCE:=g_settings_schema_source_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA : longint; { return type might be wrong }
  begin
    G_TYPE_SETTINGS_SCHEMA:=g_settings_schema_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_SETTINGS_SCHEMA_KEY : longint; { return type might be wrong }
  begin
    G_TYPE_SETTINGS_SCHEMA_KEY:=g_settings_schema_key_get_type;
  end;


end.
