
unit gsettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsettings.h
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
PGAction  = ^GAction;
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
PGObject  = ^GObject;
Pgpointer  = ^gpointer;
PGQuark  = ^GQuark;
PGSettings  = ^GSettings;
PGSettingsBackend  = ^GSettingsBackend;
PGSettingsBindFlags  = ^GSettingsBindFlags;
PGSettingsBindSetMapping  = ^GSettingsBindSetMapping;
PGSettingsClass  = ^GSettingsClass;
PGSettingsPrivate  = ^GSettingsPrivate;
PGSettingsSchema  = ^GSettingsSchema;
PGValue  = ^GValue;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009, 2010 Codethink Limited
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
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_SETTINGS_H__}
{$define __G_SETTINGS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsettingsschema.h>}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SETTINGS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_GET_CLASS(inst : longint) : longint;

type
{ Signals  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PGSettingsClass = ^TGSettingsClass;
  TGSettingsClass = record
      parent_class : TGObjectClass;
      writable_changed : procedure (settings:PGSettings; key:Pgchar);cdecl;
      changed : procedure (settings:PGSettings; key:Pgchar);cdecl;
      writable_change_event : function (settings:PGSettings; key:TGQuark):Tgboolean;cdecl;
      change_event : function (settings:PGSettings; keys:PGQuark; n_keys:Tgint):Tgboolean;cdecl;
      padding : array[0..19] of Tgpointer;
    end;

  PGSettings = ^TGSettings;
  TGSettings = record
      parent_instance : TGObject;
      priv : PGSettingsPrivate;
    end;


function g_settings_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_40_FOR(g_settings_schema_source_list_schemas) }
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_settings_list_schemas:^Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_40_FOR(g_settings_schema_source_list_schemas) }
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_settings_list_relocatable_schemas:^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_settings_new(schema_id:Pgchar):PGSettings;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_settings_new_with_path(schema_id:Pgchar; path:Pgchar):PGSettings;cdecl;external;
(* Const before type ignored *)
function g_settings_new_with_backend(schema_id:Pgchar; backend:PGSettingsBackend):PGSettings;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_settings_new_with_backend_and_path(schema_id:Pgchar; backend:PGSettingsBackend; path:Pgchar):PGSettings;cdecl;external;
(* Const before type ignored *)
function g_settings_new_full(schema:PGSettingsSchema; backend:PGSettingsBackend; path:Pgchar):PGSettings;cdecl;external;
function g_settings_list_children(settings:PGSettings):^Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_settings_schema_list_keys) }
function g_settings_list_keys(settings:PGSettings):^Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_40_FOR(g_settings_schema_key_get_range) }
(* Const before type ignored *)
function g_settings_get_range(settings:PGSettings; key:Pgchar):PGVariant;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_40_FOR(g_settings_schema_key_range_check) }
(* Const before type ignored *)
function g_settings_range_check(settings:PGSettings; key:Pgchar; value:PGVariant):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_set_value(settings:PGSettings; key:Pgchar; value:PGVariant):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_value(settings:PGSettings; key:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_settings_get_user_value(settings:PGSettings; key:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_settings_get_default_value(settings:PGSettings; key:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_settings_set(settings:PGSettings; key:Pgchar; format:Pgchar; args:array of const):Tgboolean;cdecl;external;
function g_settings_set(settings:PGSettings; key:Pgchar; format:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_settings_get(settings:PGSettings; key:Pgchar; format:Pgchar; args:array of const);cdecl;external;
procedure g_settings_get(settings:PGSettings; key:Pgchar; format:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_settings_reset(settings:PGSettings; key:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_settings_get_int(settings:PGSettings; key:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
function g_settings_set_int(settings:PGSettings; key:Pgchar; value:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_int64(settings:PGSettings; key:Pgchar):Tgint64;cdecl;external;
(* Const before type ignored *)
function g_settings_set_int64(settings:PGSettings; key:Pgchar; value:Tgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_uint(settings:PGSettings; key:Pgchar):Tguint;cdecl;external;
(* Const before type ignored *)
function g_settings_set_uint(settings:PGSettings; key:Pgchar; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_uint64(settings:PGSettings; key:Pgchar):Tguint64;cdecl;external;
(* Const before type ignored *)
function g_settings_set_uint64(settings:PGSettings; key:Pgchar; value:Tguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_string(settings:PGSettings; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_settings_set_string(settings:PGSettings; key:Pgchar; value:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_boolean(settings:PGSettings; key:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_set_boolean(settings:PGSettings; key:Pgchar; value:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_double(settings:PGSettings; key:Pgchar):Tgdouble;cdecl;external;
(* Const before type ignored *)
function g_settings_set_double(settings:PGSettings; key:Pgchar; value:Tgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_strv(settings:PGSettings; key:Pgchar):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_settings_set_strv(settings:PGSettings; key:Pgchar; value:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_enum(settings:PGSettings; key:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
function g_settings_set_enum(settings:PGSettings; key:Pgchar; value:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_flags(settings:PGSettings; key:Pgchar):Tguint;cdecl;external;
(* Const before type ignored *)
function g_settings_set_flags(settings:PGSettings; key:Pgchar; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_settings_get_child(settings:PGSettings; name:Pgchar):PGSettings;cdecl;external;
(* Const before type ignored *)
function g_settings_is_writable(settings:PGSettings; name:Pgchar):Tgboolean;cdecl;external;
procedure g_settings_delay(settings:PGSettings);cdecl;external;
procedure g_settings_apply(settings:PGSettings);cdecl;external;
procedure g_settings_revert(settings:PGSettings);cdecl;external;
function g_settings_get_has_unapplied(settings:PGSettings):Tgboolean;cdecl;external;
procedure g_settings_sync;cdecl;external;
{*
 * GSettingsBindSetMapping:
 * @value: the property value to map
 * @expected_type: expected type of the result
 * @user_data: user data that was specified when the binding was created
 *
 * The type for the function that is used to convert an object property
 * value to a [struct@GLib.Variant] for storing it in [class@Gio.Settings].
 *
 * Returns: (nullable): a new [struct@GLib.Variant] holding the data from @value,
 *   or `NULL` in case of an error
  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGSettingsBindSetMapping = ^TGSettingsBindSetMapping;
  TGSettingsBindSetMapping = function (value:PGValue; expected_type:PGVariantType; user_data:Tgpointer):PGVariant;cdecl;
{*
 * GSettingsBindGetMapping:
 * @value: return location for the property value
 * @variant: variant to map to the property value
 * @user_data: user data that was specified when the binding was created
 *
 * The type for the function that is used to convert from [class@Gio.Settings]
 * to an object property.
 *
 * The @value is already initialized to hold values of the appropriate type.
 *
 * Returns: true if the conversion succeeded, false in case of an error
  }

  TGSettingsBindGetMapping = function (value:PGValue; variant:PGVariant; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GSettingsGetMapping:
 * @value: (nullable): variant to map to the application value
 * @result: (out): the result of the mapping
 * @user_data: (closure): the user data that was passed to
 *   [method@Gio.Settings.get_mapped]
 *
 * The type of the function that is used to convert from a value stored
 * in a [class@Gio.Settings] to a value that is useful to the application.
 *
 * If the value is successfully mapped, the result should be stored at
 * @result and true returned.  If mapping fails (for example, if @value
 * is not in the right format) then false should be returned.
 *
 * If @value is `NULL` then it means that the mapping function is being
 * given a ‘last chance’ to successfully return a valid value.  True
 * must be returned in this case.
 *
 * Returns: true if the conversion succeeded, false in case of an error
 * }

  TGSettingsGetMapping = function (value:PGVariant; result:Pgpointer; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GSettingsBindFlags:
 * @G_SETTINGS_BIND_DEFAULT: Equivalent to `G_SETTINGS_BIND_GET|G_SETTINGS_BIND_SET`
 * @G_SETTINGS_BIND_GET: Update the [class@GObject.Object] property when the setting changes.
 *   It is an error to use this flag if the property is not writable.
 * @G_SETTINGS_BIND_SET: Update the setting when the [class@GObject.Object] property changes.
 *   It is an error to use this flag if the property is not readable.
 * @G_SETTINGS_BIND_NO_SENSITIVITY: Do not try to bind a ‘sensitivity’ property to the writability of the setting
 * @G_SETTINGS_BIND_GET_NO_CHANGES: When set in addition to [flags@Gio.SettingsBindFlags.GET],
 *   set the [class@GObject.Object] property
 *   value initially from the setting, but do not listen for changes of the setting
 * @G_SETTINGS_BIND_INVERT_BOOLEAN: When passed to [method@Gio.Settings.bind],
 *   uses a pair of mapping functions that invert
 *   the boolean value when mapping between the setting and the property.  The setting and property must both
 *   be booleans.  You cannot pass this flag to [method@Gio.Settings.bind_with_mapping].
 *
 * Flags used when creating a binding.
 *
 * These flags determine in which direction the binding works. The default is to
 * synchronize in both directions.
  }

  PGSettingsBindFlags = ^TGSettingsBindFlags;
  TGSettingsBindFlags =  Longint;
  Const
    G_SETTINGS_BIND_DEFAULT = 0;
    G_SETTINGS_BIND_GET = 1 shl 0;
    G_SETTINGS_BIND_SET = 1 shl 1;
    G_SETTINGS_BIND_NO_SENSITIVITY = 1 shl 2;
    G_SETTINGS_BIND_GET_NO_CHANGES = 1 shl 3;
    G_SETTINGS_BIND_INVERT_BOOLEAN = 1 shl 4;
;
(* Const before type ignored *)
(* Const before type ignored *)

procedure g_settings_bind(settings:PGSettings; key:Pgchar; object:Tgpointer; _property:Pgchar; flags:TGSettingsBindFlags);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_settings_bind_with_mapping(settings:PGSettings; key:Pgchar; object:Tgpointer; _property:Pgchar; flags:TGSettingsBindFlags; 
            get_mapping:TGSettingsBindGetMapping; set_mapping:TGSettingsBindSetMapping; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_settings_bind_with_mapping_closures(settings:PGSettings; key:Pchar; object:PGObject; _property:Pchar; flags:TGSettingsBindFlags; 
            get_mapping:PGClosure; set_mapping:PGClosure);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_settings_bind_writable(settings:PGSettings; key:Pgchar; object:Tgpointer; _property:Pgchar; inverted:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_settings_unbind(object:Tgpointer; _property:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_settings_create_action(settings:PGSettings; key:Pgchar):PGAction;cdecl;external;
(* Const before type ignored *)
function g_settings_get_mapped(settings:PGSettings; key:Pgchar; mapping:TGSettingsGetMapping; user_data:Tgpointer):Tgpointer;cdecl;external;
{$endif}
{ __G_SETTINGS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SETTINGS : longint; { return type might be wrong }
  begin
    G_TYPE_SETTINGS:=g_settings_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS(inst : longint) : longint;
begin
  G_SETTINGS:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SETTINGS,GSettings);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_CLASS(_class : longint) : longint;
begin
  G_SETTINGS_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SETTINGS,GSettingsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS(inst : longint) : longint;
begin
  G_IS_SETTINGS:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SETTINGS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_CLASS(_class : longint) : longint;
begin
  G_IS_SETTINGS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SETTINGS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_GET_CLASS(inst : longint) : longint;
begin
  G_SETTINGS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SETTINGS,GSettingsClass);
end;


end.
