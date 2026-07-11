
unit gststructure;
interface

{
  Automatically converted by H2Pas 1.0.0 from gststructure.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gststructure.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGDate  = ^GDate;
Pgdouble  = ^gdouble;
Pgint  = ^gint;
Pgint64  = ^gint64;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstDateTime  = ^GstDateTime;
PGstIdStr  = ^GstIdStr;
PGstSerializeFlags  = ^GstSerializeFlags;
PGstStructure  = ^GstStructure;
Pguint  = ^guint;
Pguint64  = ^guint64;
PGValue  = ^GValue;
PGValueArray  = ^GValueArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2003 David A. Schleef <ds@schleef.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_STRUCTURE_H__}
{$define __GST_STRUCTURE_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{$include <gst/gstclock.h>}
{$include <gst/gstdatetime.h>}
{$include <gst/glib-compat.h>}
{$include <gst/gstidstr.h>}
  var
    _gst_structure_type : TGType;cvar;external;
type
{*
 * GST_SERIALIZE_FLAG_STRICT:
 *
 * Serialization fails if a value cannot be serialized instead of using
 * placeholder "NULL" value (e.g. pointers, objects).
 *
 * Since: 1.24
  }
{*
 * GstSerializeFlags:
 * @GST_SERIALIZE_FLAG_NONE: No special flags specified.
 * @GST_SERIALIZE_FLAG_BACKWARD_COMPAT: Serialize using the old format for
 *                                      nested structures.
 * @GST_SERIALIZE_FLAG_STRICT: Serialization fails if a value cannot be
 *  serialized instead of using placeholder "NULL" value (e.g. pointers,
 *  objects). (Since 1.24)
 *
 * Since: 1.20
  }

  PGstSerializeFlags = ^TGstSerializeFlags;
  TGstSerializeFlags =  Longint;
  Const
    GST_SERIALIZE_FLAG_NONE = 0;
    GST_SERIALIZE_FLAG_BACKWARD_COMPAT = 1 shl 0;
    GST_SERIALIZE_FLAG_STRICT = 1 shl 1;
;
  GST_TYPE_STRUCTURE = _gst_structure_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_IS_STRUCTURE(object : longint) : Tobject;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STRUCTURE_CAST(object : longint) : PGstStructure;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STRUCTURE(object : longint) : longint;

{*
 * GstStructureForeachFunc:
 * @field_id: the #GQuark of the field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_foreach(). The function may
 * not modify @value.
 *
 * Returns: %TRUE if the foreach operation should continue, %FALSE if
 * the foreach operation should stop with %FALSE.
  }
(* Const before type ignored *)
type

  TGstStructureForeachFunc = function (field_id:TGQuark; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructureMapFunc:
 * @field_id: the #GQuark of the field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_map_in_place(). The function
 * may modify @value.
 *
 * Returns: %TRUE if the map operation should continue, %FALSE if
 * the map operation should stop with %FALSE.
  }

  TGstStructureMapFunc = function (field_id:TGQuark; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructureFilterMapFunc:
 * @field_id: the #GQuark of the field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_filter_and_map_in_place().
 * The function may modify @value, and the value will be removed from
 * the structure if %FALSE is returned.
 *
 * Returns: %TRUE if the field should be preserved, %FALSE if it
 * should be removed.
  }

  TGstStructureFilterMapFunc = function (field_id:TGQuark; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructureForeachIdStrFunc:
 * @fieldname: the #GstIdStr field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_foreach_id_str(). The
 * function may not modify @value.
 *
 * Returns: %TRUE if the foreach operation should continue, %FALSE if
 * the foreach operation should stop with %FALSE.
 *
 * Since: 1.26
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TGstStructureForeachIdStrFunc = function (fieldname:PGstIdStr; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructureMapIdStrFunc:
 * @fieldname: the #GstIdStr field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_map_in_place_id_str(). The
 * function may modify @value.
 *
 * Returns: %TRUE if the map operation should continue, %FALSE if
 * the map operation should stop with %FALSE.
 *
 * Since: 1.26
  }
(* Const before type ignored *)

  TGstStructureMapIdStrFunc = function (fieldname:PGstIdStr; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructureFilterMapIdStrFunc:
 * @fieldname: the #GstIdStr field name
 * @value: the #GValue of the field
 * @user_data: user data
 *
 * A function that will be called in gst_structure_filter_and_map_in_place_id_str().
 * The function may modify @value, and the value will be removed from the
 * structure if %FALSE is returned.
 *
 * Returns: %TRUE if the field should be preserved, %FALSE if it
 * should be removed.
 *
 * Since: 1.26
  }
(* Const before type ignored *)

  TGstStructureFilterMapIdStrFunc = function (fieldname:PGstIdStr; value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstStructure:
 * @type: the GType of a structure
 *
 * The GstStructure object. Most fields are private.
  }
{< private > }
  PGstStructure = ^TGstStructure;
  TGstStructure = record
      _type : TGType;cdecl;
      name : TGQuark;
    end;


function gst_structure_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_structure_new_empty(name:Pgchar):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_structure_new_static_str_empty(name:Pgchar):PGstStructure;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_new_id_str_empty) }
function gst_structure_new_id_empty(quark:TGQuark):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_structure_new_id_str_empty(name:PGstIdStr):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new(name:Pgchar; firstfield:Pgchar; args:array of const):PGstStructure;cdecl;external;
function gst_structure_new(name:Pgchar; firstfield:Pgchar):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new_static_str(name:Pgchar; firstfield:Pgchar; args:array of const):PGstStructure;cdecl;external;
function gst_structure_new_static_str(name:Pgchar; firstfield:Pgchar):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new_id_str_valist(name:PGstIdStr; firstfield:PGstIdStr; varargs:Tva_list):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new_valist(name:Pgchar; firstfield:Pgchar; varargs:Tva_list):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new_static_str_valist(name:Pgchar; firstfield:Pgchar; varargs:Tva_list):PGstStructure;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_new_id_str) }
function gst_structure_new_id(name_quark:TGQuark; field_quark:TGQuark; args:array of const):PGstStructure;cdecl;external;
function gst_structure_new_id(name_quark:TGQuark; field_quark:TGQuark):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_new_id_str(name:PGstIdStr; fieldname:PGstIdStr; args:array of const):PGstStructure;cdecl;external;
function gst_structure_new_id_str(name:PGstIdStr; fieldname:PGstIdStr):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_structure_new_from_string(_string:Pgchar):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_structure_copy(structure:PGstStructure):PGstStructure;cdecl;external;
function gst_structure_set_parent_refcount(structure:PGstStructure; refcount:Pgint):Tgboolean;cdecl;external;
procedure gst_structure_free(structure:PGstStructure);cdecl;external;
procedure gst_clear_structure(structure_ptr:PPGstStructure);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_structure(structure_ptr : longint) : longint;

function gst_structure_take(oldstr_ptr:PPGstStructure; newstr:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_name(structure:PGstStructure):Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_get_name_id_str) }
(* Const before type ignored *)
function gst_structure_get_name_id(structure:PGstStructure):TGQuark;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_name_id_str(structure:PGstStructure):PGstIdStr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_has_name(structure:PGstStructure; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_name_id_str(structure:PGstStructure; name:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_name(structure:PGstStructure; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_name_static_str(structure:PGstStructure; name:Pgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_set_value) }
(* Const before type ignored *)
procedure gst_structure_id_set_value(structure:PGstStructure; field:TGQuark; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_structure_id_str_set_value(structure:PGstStructure; fieldname:PGstIdStr; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_structure_set_value(structure:PGstStructure; fieldname:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_structure_set_value_static_str(structure:PGstStructure; fieldname:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_structure_set_array(structure:PGstStructure; fieldname:Pgchar; array:PGValueArray);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_structure_set_list(structure:PGstStructure; fieldname:Pgchar; array:PGValueArray);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_take_value) }
procedure gst_structure_id_take_value(structure:PGstStructure; field:TGQuark; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_take_value(structure:PGstStructure; fieldname:PGstIdStr; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_take_value(structure:PGstStructure; fieldname:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_take_value_static_str(structure:PGstStructure; fieldname:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set(structure:PGstStructure; fieldname:Pgchar; args:array of const);cdecl;external;
procedure gst_structure_set(structure:PGstStructure; fieldname:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_static_str(structure:PGstStructure; fieldname:Pgchar; args:array of const);cdecl;external;
procedure gst_structure_set_static_str(structure:PGstStructure; fieldname:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_valist(structure:PGstStructure; fieldname:Pgchar; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_set_static_str_valist(structure:PGstStructure; fieldname:Pgchar; varargs:Tva_list);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_set) }
procedure gst_structure_id_set(structure:PGstStructure; fieldname:TGQuark; args:array of const);cdecl;external;
procedure gst_structure_id_set(structure:PGstStructure; fieldname:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_set(structure:PGstStructure; fieldname:PGstIdStr; args:array of const);cdecl;external;
procedure gst_structure_id_str_set(structure:PGstStructure; fieldname:PGstIdStr);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_set_valist) }
procedure gst_structure_id_set_valist(structure:PGstStructure; fieldname:TGQuark; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_set_valist(structure:PGstStructure; fieldname:PGstIdStr; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_valist(structure:PGstStructure; first_fieldname:Pchar; args:Tva_list):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get(structure:PGstStructure; first_fieldname:Pchar; args:array of const):Tgboolean;cdecl;external;
function gst_structure_get(structure:PGstStructure; first_fieldname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_get_valist(structure:PGstStructure; first_fieldname:PGstIdStr; args:Tva_list):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_get(structure:PGstStructure; first_fieldname:PGstIdStr; args:array of const):Tgboolean;cdecl;external;
function gst_structure_id_str_get(structure:PGstStructure; first_fieldname:PGstIdStr):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_get_valist) }
(* Const before type ignored *)
function gst_structure_id_get_valist(structure:PGstStructure; first_field_id:TGQuark; args:Tva_list):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_get) }
(* Const before type ignored *)
function gst_structure_id_get(structure:PGstStructure; first_field_id:TGQuark; args:array of const):Tgboolean;cdecl;external;
function gst_structure_id_get(structure:PGstStructure; first_field_id:TGQuark):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_get_value) }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_get_value(structure:PGstStructure; field:TGQuark):PGValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_get_value(structure:PGstStructure; fieldname:PGstIdStr):PGValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_value(structure:PGstStructure; fieldname:Pgchar):PGValue;cdecl;external;
(* Const before type ignored *)
procedure gst_structure_remove_field(structure:PGstStructure; fieldname:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_remove_fields(structure:PGstStructure; fieldname:Pgchar; args:array of const);cdecl;external;
procedure gst_structure_remove_fields(structure:PGstStructure; fieldname:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_remove_fields_valist(structure:PGstStructure; fieldname:Pgchar; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_remove_field(structure:PGstStructure; fieldname:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_remove_fields(structure:PGstStructure; fieldname:PGstIdStr; args:array of const);cdecl;external;
procedure gst_structure_id_str_remove_fields(structure:PGstStructure; fieldname:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_structure_id_str_remove_fields_valist(structure:PGstStructure; fieldname:PGstIdStr; varargs:Tva_list);cdecl;external;
procedure gst_structure_remove_all_fields(structure:PGstStructure);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_field_type(structure:PGstStructure; fieldname:Pgchar):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_get_field_type(structure:PGstStructure; fieldname:PGstIdStr):TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_foreach_id_str) }
(* Const before type ignored *)
function gst_structure_foreach(structure:PGstStructure; func:TGstStructureForeachFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_map_in_place_id_str) }
function gst_structure_map_in_place(structure:PGstStructure; func:TGstStructureMapFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_filter_and_map_in_place_id_str) }
procedure gst_structure_filter_and_map_in_place(structure:PGstStructure; func:TGstStructureFilterMapFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gst_structure_foreach_id_str(structure:PGstStructure; func:TGstStructureForeachIdStrFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
function gst_structure_map_in_place_id_str(structure:PGstStructure; func:TGstStructureMapIdStrFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
procedure gst_structure_filter_and_map_in_place_id_str(structure:PGstStructure; func:TGstStructureFilterMapIdStrFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gst_structure_n_fields(structure:PGstStructure):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_nth_field_name(structure:PGstStructure; index:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_nth_field_name(structure:PGstStructure; index:Tguint):PGstIdStr;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_has_field) }
(* Const before type ignored *)
function gst_structure_id_has_field(structure:PGstStructure; field:TGQuark):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_id_str_has_field_typed) }
(* Const before type ignored *)
function gst_structure_id_has_field_typed(structure:PGstStructure; field:TGQuark; _type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_has_field(structure:PGstStructure; fieldname:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_has_field_typed(structure:PGstStructure; fieldname:Pgchar; _type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_has_field(structure:PGstStructure; fieldname:PGstIdStr):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_id_str_has_field_typed(structure:PGstStructure; fieldname:PGstIdStr; _type:TGType):Tgboolean;cdecl;external;
{ utility functions  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_boolean(structure:PGstStructure; fieldname:Pgchar; value:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_int(structure:PGstStructure; fieldname:Pgchar; value:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_uint(structure:PGstStructure; fieldname:Pgchar; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_int64(structure:PGstStructure; fieldname:Pgchar; value:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_uint64(structure:PGstStructure; fieldname:Pgchar; value:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_double(structure:PGstStructure; fieldname:Pgchar; value:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_date(structure:PGstStructure; fieldname:Pgchar; value:PPGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_date_time(structure:PGstStructure; fieldname:Pgchar; value:PPGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_clock_time(structure:PGstStructure; fieldname:Pgchar; value:PGstClockTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_string(structure:PGstStructure; fieldname:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_enum(structure:PGstStructure; fieldname:Pgchar; enumtype:TGType; value:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_fraction(structure:PGstStructure; fieldname:Pgchar; value_numerator:Pgint; value_denominator:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_flagset(structure:PGstStructure; fieldname:Pgchar; value_flags:Pguint; value_mask:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_get_array(structure:PGstStructure; fieldname:Pgchar; array:PPGValueArray):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_get_list(structure:PGstStructure; fieldname:Pgchar; array:PPGValueArray):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_flags(structure:PGstStructure; fieldname:Pgchar; flags_type:TGType; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_to_string(structure:PGstStructure):Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_structure_serialize_full) }
(* Const before type ignored *)
function gst_structure_serialize(structure:PGstStructure; flags:TGstSerializeFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_structure_serialize_full(structure:PGstStructure; flags:TGstSerializeFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_structure_from_string(_string:Pgchar; end:PPgchar):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_structure_fixate_field_nearest_int(structure:PGstStructure; field_name:Pchar; target:longint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_fixate_field_nearest_double(structure:PGstStructure; field_name:Pchar; target:Tdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_fixate_field_boolean(structure:PGstStructure; field_name:Pchar; target:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_fixate_field_string(structure:PGstStructure; field_name:Pchar; target:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_fixate_field_nearest_fraction(structure:PGstStructure; field_name:Pchar; target_numerator:Tgint; target_denominator:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_fixate_field(structure:PGstStructure; field_name:Pchar):Tgboolean;cdecl;external;
procedure gst_structure_fixate(structure:PGstStructure);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_is_equal(structure1:PGstStructure; structure2:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_is_subset(subset:PGstStructure; superset:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_can_intersect(struct1:PGstStructure; struct2:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_intersect(struct1:PGstStructure; struct2:PGstStructure):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_structure_get_caps(structure:PGstStructure; fieldname:Pgchar; caps:PPGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_structure_is_writable(structure:PGstStructure):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstStructure, gst_structure_free) }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_IS_STRUCTURE(object : longint) : Tobject;
begin
  GST_IS_STRUCTURE:=Tobject(@(@(((GST_STRUCTURE(object))^._type)=GST_TYPE_STRUCTURE)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STRUCTURE_CAST(object : longint) : PGstStructure;
begin
  GST_STRUCTURE_CAST:=PGstStructure(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STRUCTURE(object : longint) : longint;
begin
  GST_STRUCTURE:=GST_STRUCTURE_CAST(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_structure(structure_ptr : longint) : longint;
begin
  gst_clear_structure:=g_clear_pointer(structure_ptr,gst_structure_free);
end;


end.
