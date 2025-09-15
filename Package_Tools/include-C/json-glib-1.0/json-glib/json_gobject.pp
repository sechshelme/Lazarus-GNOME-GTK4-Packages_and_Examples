
unit json_gobject;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_gobject.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_gobject.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGObject  = ^GObject;
PGParamSpec  = ^GParamSpec;
Pgsize  = ^gsize;
Pguint  = ^guint;
PGValue  = ^GValue;
PJsonBoxedSerializeFunc  = ^JsonBoxedSerializeFunc;
PJsonNode  = ^JsonNode;
PJsonNodeType  = ^JsonNodeType;
PJsonSerializable  = ^JsonSerializable;
PJsonSerializableIface  = ^JsonSerializableIface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-gobject.h - JSON GObject integration
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
{$ifndef __JSON_GOBJECT_H__}
{$define __JSON_GOBJECT_H__}
{$include <json-glib/json-types.h>}

{ was #define dname def_expr }
function JSON_TYPE_SERIALIZABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_SERIALIZABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_SERIALIZABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_SERIALIZABLE_GET_IFACE(obj : longint) : longint;

type
{ dummy  }
{*
 * JsonSerializableIface:
 * @serialize_property: virtual function for serializing an object property
 *   into JSON
 * @deserialize_property: virtual function for deserializing JSON
 *   into an object property
 * @find_property: virtual function for finding a property definition using
 *   its name
 * @list_properties: virtual function for listing the installed property
 *   definitions
 * @set_property: virtual function for setting a property
 * @get_property: virtual function for getting a property
 *
 * Interface that allows serializing and deserializing object instances
 * with properties storing complex data types.
 *
 * The [func@Json.gobject_from_data] and [func@Json.gobject_to_data]
 * functions will check if the passed object type implements this interface,
 * so it can also be used to override the default property serialization
 * sequence.
  }
{< private > }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PJsonSerializableIface = ^TJsonSerializableIface;
  TJsonSerializableIface = record
      g_iface : TGTypeInterface;
      serialize_property : function (serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec):PJsonNode;cdecl;
      deserialize_property : function (serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec; property_node:PJsonNode):Tgboolean;cdecl;
      find_property : function (serializable:PJsonSerializable; name:Pchar):PGParamSpec;cdecl;
      list_properties : function (serializable:PJsonSerializable; n_pspecs:Pguint):PPGParamSpec;cdecl;
      set_property : procedure (serializable:PJsonSerializable; pspec:PGParamSpec; value:PGValue);cdecl;
      get_property : procedure (serializable:PJsonSerializable; pspec:PGParamSpec; value:PGValue);cdecl;
    end;


function json_serializable_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function json_serializable_serialize_property(serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_serializable_deserialize_property(serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec; property_node:PJsonNode):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_serializable_find_property(serializable:PJsonSerializable; name:Pchar):PGParamSpec;cdecl;external;
function json_serializable_list_properties(serializable:PJsonSerializable; n_pspecs:Pguint):^PGParamSpec;cdecl;external;
(* Const before type ignored *)
procedure json_serializable_set_property(serializable:PJsonSerializable; pspec:PGParamSpec; value:PGValue);cdecl;external;
procedure json_serializable_get_property(serializable:PJsonSerializable; pspec:PGParamSpec; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function json_serializable_default_serialize_property(serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_serializable_default_deserialize_property(serializable:PJsonSerializable; property_name:Pgchar; value:PGValue; pspec:PGParamSpec; property_node:PJsonNode):Tgboolean;cdecl;external;
{*
 * JsonBoxedSerializeFunc:
 * @boxed: a boxed data structure
 *
 * Serializes the passed `GBoxed` and stores it inside a `JsonNode`, for instance:
 *
 * ```c
 * static JsonNode *
 * my_point_serialize (gconstpointer boxed)
 * 
 *   const MyPoint *point = boxed;
 *
 *   g_autoptr(JsonBuilder) builder = json_builder_new ();
 *
 *   json_builder_begin_object (builder);
 *   json_builder_set_member_name (builder, "x");
 *   json_builder_add_double_value (builder, point->x);
 *   json_builder_set_member_name (builder, "y");
 *   json_builder_add_double_value (builder, point->y);
 *   json_builder_end_object (builder);
 *
 *   return json_builder_get_root (builder);
 * 
 * ```
 *
 * Return value: the newly created JSON node tree representing the boxed data
 *
 * Since: 0.10
  }
type
  PJsonBoxedSerializeFunc = ^TJsonBoxedSerializeFunc;
  TJsonBoxedSerializeFunc = function (boxed:Tgconstpointer):PJsonNode;cdecl;
{*
 * JsonBoxedDeserializeFunc:
 * @node: a node tree representing a boxed data
 *
 * Deserializes the contents of the passed `JsonNode` into a `GBoxed`, for instance:
 *
 * ```c
 * static gpointer
 * my_point_deserialize (JsonNode *node)
 * 
 *   double x = 0.0, y = 0.0;
 *
 *   if (JSON_NODE_HOLDS_ARRAY (node))
 *     
 *       JsonArray *array = json_node_get_array (node);
 *
 *       if (json_array_get_length (array) == 2)
 *         
 *           x = json_array_get_double_element (array, 0);
 *           y = json_array_get_double_element (array, 1);
 *         
 *     
 *   else if (JSON_NODE_HOLDS_OBJECT (node))
 *     
 *       JsonObject *obj = json_node_get_object (node);
 *
 *       x = json_object_get_double_member_with_default (obj, "x", 0.0);
 *       y = json_object_get_double_member_with_default (obj, "y", 0.0);
 *     
 *
 *   // my_point_new() is defined elsewhere
 *   return my_point_new (x, y);
 * 
 * ```
 *
 * Return value: the newly created boxed structure
 *
 * Since: 0.10
  }

  TJsonBoxedDeserializeFunc = function (node:PJsonNode):Tgpointer;cdecl;

procedure json_boxed_register_serialize_func(gboxed_type:TGType; node_type:TJsonNodeType; serialize_func:TJsonBoxedSerializeFunc);cdecl;external;
procedure json_boxed_register_deserialize_func(gboxed_type:TGType; node_type:TJsonNodeType; deserialize_func:TJsonBoxedDeserializeFunc);cdecl;external;
function json_boxed_can_serialize(gboxed_type:TGType; node_type:PJsonNodeType):Tgboolean;cdecl;external;
function json_boxed_can_deserialize(gboxed_type:TGType; node_type:TJsonNodeType):Tgboolean;cdecl;external;
function json_boxed_serialize(gboxed_type:TGType; boxed:Tgconstpointer):PJsonNode;cdecl;external;
function json_boxed_deserialize(gboxed_type:TGType; node:PJsonNode):Tgpointer;cdecl;external;
function json_gobject_serialize(gobject:PGObject):PJsonNode;cdecl;external;
function json_gobject_deserialize(gtype:TGType; node:PJsonNode):PGObject;cdecl;external;
(* Const before type ignored *)
function json_gobject_from_data(gtype:TGType; data:Pgchar; length:Tgssize; error:PPGError):PGObject;cdecl;external;
function json_gobject_to_data(gobject:PGObject; length:Pgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function json_construct_gobject(gtype:TGType; data:Pgchar; length:Tgsize; error:PPGError):PGObject;cdecl;external;
{ JSON_DEPRECATED_IN_1_0_FOR(json_gobject_from_data) }
function json_serialize_gobject(gobject:PGObject; length:Pgsize):Pgchar;cdecl;external;
{ JSON_DEPRECATED_IN_1_0_FOR(json_gobject_to_data) }
{$endif}
{ __JSON_GOBJECT_H__  }

implementation

{ was #define dname def_expr }
function JSON_TYPE_SERIALIZABLE : longint; { return type might be wrong }
  begin
    JSON_TYPE_SERIALIZABLE:=json_serializable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_SERIALIZABLE(obj : longint) : longint;
begin
  JSON_SERIALIZABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,JSON_TYPE_SERIALIZABLE,JsonSerializable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_IS_SERIALIZABLE(obj : longint) : longint;
begin
  JSON_IS_SERIALIZABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,JSON_TYPE_SERIALIZABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_SERIALIZABLE_GET_IFACE(obj : longint) : longint;
begin
  JSON_SERIALIZABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,JSON_TYPE_SERIALIZABLE,JsonSerializableIface);
end;


end.
