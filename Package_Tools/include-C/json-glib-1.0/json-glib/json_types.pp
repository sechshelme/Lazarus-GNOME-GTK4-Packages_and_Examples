
unit json_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_types.h
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
PGList  = ^GList;
PGValue  = ^GValue;
PJsonArray  = ^JsonArray;
PJsonNode  = ^JsonNode;
PJsonNodeType  = ^JsonNodeType;
PJsonObject  = ^JsonObject;
PJsonObjectIter  = ^JsonObjectIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ json-types.h - JSON data types
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
{$ifndef __JSON_TYPES_H__}
{$define __JSON_TYPES_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <json-glib/json-version-macros.h>}
{*
 * JSON_NODE_TYPE:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to the [enum@Json.NodeType] value contained by the node.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function JSON_NODE_TYPE(node : longint) : longint;

{*
 * JSON_NODE_HOLDS:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 * @t: (type Json.NodeType): the desired [enum@Json.NodeType]
 *
 * Evaluates to `TRUE` if the node holds the given type.
 *
 * Since: 0.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS(node,t : longint) : longint;

{*
 * JSON_NODE_HOLDS_VALUE:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a scalar value.
 *
 * Since: 0.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_VALUE(node : longint) : longint;

{*
 * JSON_NODE_HOLDS_OBJECT:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a JSON object.
 *
 * Since: 0.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_OBJECT(node : longint) : longint;

{*
 * JSON_NODE_HOLDS_ARRAY:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a JSON array.
 *
 * Since: 0.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_ARRAY(node : longint) : longint;

{*
 * JSON_NODE_HOLDS_NULL:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds `null`.
 *
 * Since: 0.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_NULL(node : longint) : longint;

{ was #define dname def_expr }
function JSON_TYPE_NODE : longint; { return type might be wrong }

{ was #define dname def_expr }
function JSON_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname def_expr }
function JSON_TYPE_ARRAY : longint; { return type might be wrong }

type
{*
 * JsonNodeType:
 * @JSON_NODE_OBJECT: The node contains a JSON object
 * @JSON_NODE_ARRAY: The node contains a JSON array
 * @JSON_NODE_VALUE: The node contains a fundamental type
 * @JSON_NODE_NULL: Special type, for nodes containing null
 *
 * Indicates the content of a node.
  }

  PJsonNodeType = ^TJsonNodeType;
  TJsonNodeType =  Longint;
  Const
    JSON_NODE_OBJECT = 0;
    JSON_NODE_ARRAY = 1;
    JSON_NODE_VALUE = 2;
    JSON_NODE_NULL = 3;
;
{*
 * JsonObjectForeach:
 * @object: the iterated JSON object
 * @member_name: the name of the member
 * @member_node: the value of the member
 * @user_data: data passed to the function
 *
 * The function to be passed to [method@Json.Object.foreach_member].
 *
 * You should not add or remove members to and from @object within
 * this function.
 *
 * It is safe to change the value of @member_node.
 *
 * Since: 0.8
  }
(* Const before type ignored *)
type

  TJsonObjectForeach = procedure (object:PJsonObject; member_name:Pgchar; member_node:PJsonNode; user_data:Tgpointer);cdecl;
{*
 * JsonArrayForeach:
 * @array: the iterated JSON array
 * @index_: the index of the element
 * @element_node: the value of the element at the given @index_
 * @user_data: data passed to the function
 *
 * The function to be passed to [method@Json.Array.foreach_element].
 *
 * You should not add or remove elements to and from @array within
 * this function.
 *
 * It is safe to change the value of @element_node.
 *
 * Since: 0.8
  }

  TJsonArrayForeach = procedure (array:PJsonArray; index_:Tguint; element_node:PJsonNode; user_data:Tgpointer);cdecl;
{
 * JsonNode
  }

function json_node_get_type:TGType;cdecl;external;
function json_node_new(_type:TJsonNodeType):PJsonNode;cdecl;external;
function json_node_alloc:PJsonNode;cdecl;external;
function json_node_init(node:PJsonNode; _type:TJsonNodeType):PJsonNode;cdecl;external;
function json_node_init_object(node:PJsonNode; object:PJsonObject):PJsonNode;cdecl;external;
function json_node_init_array(node:PJsonNode; array:PJsonArray):PJsonNode;cdecl;external;
function json_node_init_int(node:PJsonNode; value:Tgint64):PJsonNode;cdecl;external;
function json_node_init_double(node:PJsonNode; value:Tgdouble):PJsonNode;cdecl;external;
function json_node_init_boolean(node:PJsonNode; value:Tgboolean):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_node_init_string(node:PJsonNode; value:Pchar):PJsonNode;cdecl;external;
function json_node_init_null(node:PJsonNode):PJsonNode;cdecl;external;
function json_node_copy(node:PJsonNode):PJsonNode;cdecl;external;
procedure json_node_free(node:PJsonNode);cdecl;external;
function json_node_ref(node:PJsonNode):PJsonNode;cdecl;external;
procedure json_node_unref(node:PJsonNode);cdecl;external;
function json_node_get_node_type(node:PJsonNode):TJsonNodeType;cdecl;external;
function json_node_get_value_type(node:PJsonNode):TGType;cdecl;external;
procedure json_node_set_parent(node:PJsonNode; parent:PJsonNode);cdecl;external;
function json_node_get_parent(node:PJsonNode):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_node_type_name(node:PJsonNode):Pgchar;cdecl;external;
procedure json_node_set_object(node:PJsonNode; object:PJsonObject);cdecl;external;
procedure json_node_take_object(node:PJsonNode; object:PJsonObject);cdecl;external;
function json_node_get_object(node:PJsonNode):PJsonObject;cdecl;external;
function json_node_dup_object(node:PJsonNode):PJsonObject;cdecl;external;
procedure json_node_set_array(node:PJsonNode; array:PJsonArray);cdecl;external;
procedure json_node_take_array(node:PJsonNode; array:PJsonArray);cdecl;external;
function json_node_get_array(node:PJsonNode):PJsonArray;cdecl;external;
function json_node_dup_array(node:PJsonNode):PJsonArray;cdecl;external;
(* Const before type ignored *)
procedure json_node_set_value(node:PJsonNode; value:PGValue);cdecl;external;
procedure json_node_get_value(node:PJsonNode; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure json_node_set_string(node:PJsonNode; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function json_node_get_string(node:PJsonNode):Pgchar;cdecl;external;
function json_node_dup_string(node:PJsonNode):Pgchar;cdecl;external;
procedure json_node_set_int(node:PJsonNode; value:Tgint64);cdecl;external;
function json_node_get_int(node:PJsonNode):Tgint64;cdecl;external;
procedure json_node_set_double(node:PJsonNode; value:Tgdouble);cdecl;external;
function json_node_get_double(node:PJsonNode):Tgdouble;cdecl;external;
procedure json_node_set_boolean(node:PJsonNode; value:Tgboolean);cdecl;external;
function json_node_get_boolean(node:PJsonNode):Tgboolean;cdecl;external;
function json_node_is_null(node:PJsonNode):Tgboolean;cdecl;external;
procedure json_node_seal(node:PJsonNode);cdecl;external;
function json_node_is_immutable(node:PJsonNode):Tgboolean;cdecl;external;
function json_string_hash(key:Tgconstpointer):Tguint;cdecl;external;
function json_string_equal(a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;external;
function json_string_compare(a:Tgconstpointer; b:Tgconstpointer):Tgint;cdecl;external;
function json_node_hash(key:Tgconstpointer):Tguint;cdecl;external;
function json_node_equal(a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;external;
{
 * JsonObject
  }
function json_object_get_type:TGType;cdecl;external;
function json_object_new:PJsonObject;cdecl;external;
function json_object_ref(object:PJsonObject):PJsonObject;cdecl;external;
procedure json_object_unref(object:PJsonObject);cdecl;external;
(* Const before type ignored *)
procedure json_object_add_member(object:PJsonObject; member_name:Pgchar; node:PJsonNode);cdecl;external;
{ JSON_DEPRECATED_IN_1_0_FOR(json_object_set_member) }
(* Const before type ignored *)
procedure json_object_set_member(object:PJsonObject; member_name:Pgchar; node:PJsonNode);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_int_member(object:PJsonObject; member_name:Pgchar; value:Tgint64);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_double_member(object:PJsonObject; member_name:Pgchar; value:Tgdouble);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_boolean_member(object:PJsonObject; member_name:Pgchar; value:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure json_object_set_string_member(object:PJsonObject; member_name:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_null_member(object:PJsonObject; member_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_array_member(object:PJsonObject; member_name:Pgchar; value:PJsonArray);cdecl;external;
(* Const before type ignored *)
procedure json_object_set_object_member(object:PJsonObject; member_name:Pgchar; value:PJsonObject);cdecl;external;
function json_object_get_members(object:PJsonObject):PGList;cdecl;external;
(* Const before type ignored *)
function json_object_get_member(object:PJsonObject; member_name:Pgchar):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_object_dup_member(object:PJsonObject; member_name:Pgchar):PJsonNode;cdecl;external;
(* Const before type ignored *)
function json_object_get_int_member(object:PJsonObject; member_name:Pgchar):Tgint64;cdecl;external;
(* Const before type ignored *)
function json_object_get_int_member_with_default(object:PJsonObject; member_name:Pchar; default_value:Tgint64):Tgint64;cdecl;external;
(* Const before type ignored *)
function json_object_get_double_member(object:PJsonObject; member_name:Pgchar):Tgdouble;cdecl;external;
(* Const before type ignored *)
function json_object_get_double_member_with_default(object:PJsonObject; member_name:Pchar; default_value:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function json_object_get_boolean_member(object:PJsonObject; member_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_object_get_boolean_member_with_default(object:PJsonObject; member_name:Pchar; default_value:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function json_object_get_string_member(object:PJsonObject; member_name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function json_object_get_string_member_with_default(object:PJsonObject; member_name:Pchar; default_value:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function json_object_get_null_member(object:PJsonObject; member_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_object_get_array_member(object:PJsonObject; member_name:Pgchar):PJsonArray;cdecl;external;
(* Const before type ignored *)
function json_object_get_object_member(object:PJsonObject; member_name:Pgchar):PJsonObject;cdecl;external;
(* Const before type ignored *)
function json_object_has_member(object:PJsonObject; member_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure json_object_remove_member(object:PJsonObject; member_name:Pgchar);cdecl;external;
function json_object_get_values(object:PJsonObject):PGList;cdecl;external;
function json_object_get_size(object:PJsonObject):Tguint;cdecl;external;
procedure json_object_foreach_member(object:PJsonObject; func:TJsonObjectForeach; data:Tgpointer);cdecl;external;
procedure json_object_seal(object:PJsonObject);cdecl;external;
function json_object_is_immutable(object:PJsonObject):Tgboolean;cdecl;external;
function json_object_hash(key:Tgconstpointer):Tguint;cdecl;external;
function json_object_equal(a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;external;
{*
 * JsonObjectIter:
 *
 * An iterator object used to iterate over the members of a JSON object.
 *
 * `JsonObjectIter` must be allocated on the stack and initialised using
 * [method@Json.ObjectIter.init] or [method@Json.ObjectIter.init_ordered].
 *
 * The iterator is invalidated if the object is modified during
 * iteration.
 *
 * All the fields in the `JsonObjectIter` structure are private and should
 * never be accessed directly.
 *
 * Since: 1.2 
  }
{< private > }
type
  PJsonObjectIter = ^TJsonObjectIter;
  TJsonObjectIter = record
      priv_pointer : array[0..5] of Tgpointer;
      priv_int : array[0..1] of longint;
      priv_boolean : array[0..0] of Tgboolean;
    end;

procedure json_object_iter_init(iter:PJsonObjectIter; object:PJsonObject);cdecl;external;
(* Const before type ignored *)
function json_object_iter_next(iter:PJsonObjectIter; member_name:PPgchar; member_node:PPJsonNode):Tgboolean;cdecl;external;
procedure json_object_iter_init_ordered(iter:PJsonObjectIter; object:PJsonObject);cdecl;external;
(* Const before type ignored *)
function json_object_iter_next_ordered(iter:PJsonObjectIter; member_name:PPchar; member_node:PPJsonNode):Tgboolean;cdecl;external;
function json_array_get_type:TGType;cdecl;external;
function json_array_new:PJsonArray;cdecl;external;
function json_array_sized_new(n_elements:Tguint):PJsonArray;cdecl;external;
function json_array_ref(array:PJsonArray):PJsonArray;cdecl;external;
procedure json_array_unref(array:PJsonArray);cdecl;external;
procedure json_array_add_element(array:PJsonArray; node:PJsonNode);cdecl;external;
procedure json_array_add_int_element(array:PJsonArray; value:Tgint64);cdecl;external;
procedure json_array_add_double_element(array:PJsonArray; value:Tgdouble);cdecl;external;
procedure json_array_add_boolean_element(array:PJsonArray; value:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure json_array_add_string_element(array:PJsonArray; value:Pgchar);cdecl;external;
procedure json_array_add_null_element(array:PJsonArray);cdecl;external;
procedure json_array_add_array_element(array:PJsonArray; value:PJsonArray);cdecl;external;
procedure json_array_add_object_element(array:PJsonArray; value:PJsonObject);cdecl;external;
function json_array_get_elements(array:PJsonArray):PGList;cdecl;external;
function json_array_get_element(array:PJsonArray; index_:Tguint):PJsonNode;cdecl;external;
function json_array_get_int_element(array:PJsonArray; index_:Tguint):Tgint64;cdecl;external;
function json_array_get_double_element(array:PJsonArray; index_:Tguint):Tgdouble;cdecl;external;
function json_array_get_boolean_element(array:PJsonArray; index_:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function json_array_get_string_element(array:PJsonArray; index_:Tguint):Pgchar;cdecl;external;
function json_array_get_null_element(array:PJsonArray; index_:Tguint):Tgboolean;cdecl;external;
function json_array_get_array_element(array:PJsonArray; index_:Tguint):PJsonArray;cdecl;external;
function json_array_get_object_element(array:PJsonArray; index_:Tguint):PJsonObject;cdecl;external;
function json_array_dup_element(array:PJsonArray; index_:Tguint):PJsonNode;cdecl;external;
procedure json_array_remove_element(array:PJsonArray; index_:Tguint);cdecl;external;
function json_array_get_length(array:PJsonArray):Tguint;cdecl;external;
procedure json_array_foreach_element(array:PJsonArray; func:TJsonArrayForeach; data:Tgpointer);cdecl;external;
procedure json_array_seal(array:PJsonArray);cdecl;external;
function json_array_is_immutable(array:PJsonArray):Tgboolean;cdecl;external;
function json_array_hash(key:Tgconstpointer):Tguint;cdecl;external;
function json_array_equal(a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;external;
{$endif}
{ __JSON_TYPES_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_TYPE(node : longint) : longint;
begin
  JSON_NODE_TYPE:=json_node_get_node_type(node);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS(node,t : longint) : longint;
begin
  JSON_NODE_HOLDS:=(json_node_get_node_type(node))=t;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_VALUE(node : longint) : longint;
begin
  JSON_NODE_HOLDS_VALUE:=JSON_NODE_HOLDS(node,JSON_NODE_VALUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_OBJECT(node : longint) : longint;
begin
  JSON_NODE_HOLDS_OBJECT:=JSON_NODE_HOLDS(node,JSON_NODE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_ARRAY(node : longint) : longint;
begin
  JSON_NODE_HOLDS_ARRAY:=JSON_NODE_HOLDS(node,JSON_NODE_ARRAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_NODE_HOLDS_NULL(node : longint) : longint;
begin
  JSON_NODE_HOLDS_NULL:=JSON_NODE_HOLDS(node,JSON_NODE_NULL);
end;

{ was #define dname def_expr }
function JSON_TYPE_NODE : longint; { return type might be wrong }
  begin
    JSON_TYPE_NODE:=json_node_get_type;
  end;

{ was #define dname def_expr }
function JSON_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    JSON_TYPE_OBJECT:=json_object_get_type;
  end;

{ was #define dname def_expr }
function JSON_TYPE_ARRAY : longint; { return type might be wrong }
  begin
    JSON_TYPE_ARRAY:=json_array_get_type;
  end;


end.
