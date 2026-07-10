
unit gstcaps;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcaps.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcaps.h
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
PGstCaps  = ^GstCaps;
PGstCapsFeatures  = ^GstCapsFeatures;
PGstCapsFlags  = ^GstCapsFlags;
PGstCapsIntersectMode  = ^GstCapsIntersectMode;
PGstIdStr  = ^GstIdStr;
PGstStaticCaps  = ^GstStaticCaps;
PGstStructure  = ^GstStructure;
PGValue  = ^GValue;
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
{$ifndef __GST_CAPS_H__}
{$define __GST_CAPS_H__}
{$include <gst/gstconfig.h>}
{$include <gst/gstminiobject.h>}
{$include <gst/gststructure.h>}
{$include <gst/gstcapsfeatures.h>}
{$include <gst/glib-compat.h>}
  var
    _gst_caps_type : TGType;cvar;external;

const
  GST_TYPE_CAPS = _gst_caps_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_CAPS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_CAST(obj : longint) : PGstCaps;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS(obj : longint) : longint;

{ was #define dname def_expr }
function GST_TYPE_STATIC_CAPS : longint; { return type might be wrong }

{*
 * GstCapsFlags:
 * @GST_CAPS_FLAG_ANY: Caps has no specific content, but can contain
 *    anything.
 *
 * Extra flags for a caps.
  }
type
  PGstCapsFlags = ^TGstCapsFlags;
  TGstCapsFlags =  Longint;
  Const
    GST_CAPS_FLAG_ANY = GST_MINI_OBJECT_FLAG_LAST shl 0;
;
{*
 * GstCapsIntersectMode:
 * @GST_CAPS_INTERSECT_ZIG_ZAG  : Zig-zags over both caps.
 * @GST_CAPS_INTERSECT_FIRST    : Keeps the first caps order.
 *
 * Modes of caps intersection
 *
 * %GST_CAPS_INTERSECT_ZIG_ZAG tries to preserve overall order of both caps
 * by iterating on the caps' structures as the following matrix shows:
 *
 * ```
 *          caps1
 *       +-------------
 *       | 1  2  4  7
 * caps2 | 3  5  8 10
 *       | 6  9 11 12
 * ```
 *
 * Used when there is no explicit precedence of one caps over the other. e.g.
 * tee's sink pad getcaps function, it will probe its src pad peers' for their
 * caps and intersect them with this mode.
 *
 * %GST_CAPS_INTERSECT_FIRST is useful when an element wants to preserve
 * another element's caps priority order when intersecting with its own caps.
 * Example: If caps1 is `[A, B, C]` and caps2 is `[E, B, D, A]`, the result
 * would be `[A, B]`, maintaining the first caps priority on the intersection.
  }
type
  PGstCapsIntersectMode = ^TGstCapsIntersectMode;
  TGstCapsIntersectMode =  Longint;
  Const
    GST_CAPS_INTERSECT_ZIG_ZAG = 0;
    GST_CAPS_INTERSECT_FIRST = 1;
;
{*
 * GST_CAPS_ANY:
 *
 * Means that the element/pad can output 'anything'. Useful for elements
 * that output unknown media, such as filesrc. This macro returns a singleton and
 * should not be unreffed.
  }
  GST_CAPS_ANY = _gst_caps_any;  
{*
 * GST_CAPS_NONE:
 *
 * The opposite of %GST_CAPS_ANY: it means that the pad/element outputs an
 * undefined media type that can not be detected. This macro returns a singleton
 * and should not be unreffed.
  }
  GST_CAPS_NONE = _gst_caps_none;  
{*
 * GST_STATIC_CAPS_ANY:
 *
 * Creates a new #GstCaps static caps that matches anything.
 * This can be used in pad templates.
  }

{ was #define dname def_expr }
function GST_STATIC_CAPS_ANY : longint; { return type might be wrong }

{*
 * GST_STATIC_CAPS_NONE:
 *
 * Creates a new #GstCaps static caps that matches nothing.
 * This can be used in pad templates.
  }
{ was #define dname def_expr }
function GST_STATIC_CAPS_NONE : longint; { return type might be wrong }

{*
 * GST_CAPS_IS_SIMPLE:
 * @caps: the #GstCaps instance to check
 *
 * Checks if the number of structures in the given caps is exactly one.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_IS_SIMPLE(caps : longint) : longint;

{*  xxxx
#define GST_STATIC_CAPS(string) \
 \
   NULL, \
   string, \
  GST_PADDING_INIT \

  }
type
  var
    _gst_caps_any : PGstCaps;cvar;external;
    _gst_caps_none : PGstCaps;cvar;external;
{*
 * GST_CAPS_FLAGS:
 * @caps: a #GstCaps.
 *
 * Gets a flags word containing #GstCapsFlags flags set on this caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_CAPS_FLAGS(caps : longint) : longint;

{ refcount  }
{*
 * GST_CAPS_REFCOUNT:
 * @caps: a #GstCaps
 *
 * Gives access to the reference count field of the caps
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_REFCOUNT(caps : longint) : longint;

{*
 * GST_CAPS_REFCOUNT_VALUE:
 * @caps: a #GstCaps
 *
 * Gets the reference count value of the caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_REFCOUNT_VALUE(caps : longint) : longint;

{*
 * GST_CAPS_FLAG_IS_SET:
 * @caps: a #GstCaps.
 * @flag: the #GstCapsFlags to check.
 *
 * Gives the status of a specific flag on a caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_IS_SET(caps,flag : longint) : longint;

{*
 * GST_CAPS_FLAG_SET:
 * @caps: a #GstCaps.
 * @flag: the #GstCapsFlags to set.
 *
 * Sets a caps flag on a caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_SET(caps,flag : longint) : longint;

{*
 * GST_CAPS_FLAG_UNSET:
 * @caps: a #GstCaps.
 * @flag: the #GstCapsFlags to clear.
 *
 * Clears a caps flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_UNSET(caps,flag : longint) : longint;

function gst_caps_ref(caps:PGstCaps):PGstCaps;cdecl;external;
procedure gst_caps_unref(caps:PGstCaps);cdecl;external;
procedure gst_clear_caps(caps_ptr:PPGstCaps);cdecl;external;
(* Const before type ignored *)
function gst_caps_copy(caps:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_replace(old_caps:PPGstCaps; new_caps:PGstCaps):Tgboolean;cdecl;external;
function gst_caps_make_writable(caps:PGstCaps):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_caps_is_writable(caps:PGstCaps):Tgboolean;cdecl;external;
function gst_caps_take(old_caps:PPGstCaps; new_caps:PGstCaps):Tgboolean;cdecl;external;
function gst_caps_steal(old_caps:PPGstCaps):PGstCaps;cdecl;external;
{*
 * GstCaps:
 * @mini_object: the parent type
 *
 * Object describing media types.
  }
type
  PGstCaps = ^TGstCaps;
  TGstCaps = record
      mini_object : TGstMiniObject;
    end;

{*
 * GstStaticCaps:
 * @caps: the cached #GstCaps
 * @string: a string describing a caps
 *
 * Data structure to initialize #GstCaps from a string description usually
 * used in conjunction with GST_STATIC_CAPS() and gst_static_caps_get() to
 * instantiate a #GstCaps.
  }
{< public > }
(* Const before type ignored *)
{< private > }
  PGstStaticCaps = ^TGstStaticCaps;
  TGstStaticCaps = record
      caps : PGstCaps;
      _string : Pchar;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstCapsForeachFunc:
 * @features: the #GstCapsFeatures
 * @structure: the #GstStructure
 * @user_data: user data
 *
 * A function that will be called in gst_caps_foreach(). The function may
 * not modify @features or @structure.
 *
 * Returns: %TRUE if the foreach operation should continue, %FALSE if
 * the foreach operation should stop with %FALSE.
 *
 * Since: 1.6
  }

  TGstCapsForeachFunc = function (features:PGstCapsFeatures; structure:PGstStructure; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstCapsMapFunc:
 * @features: the #GstCapsFeatures
 * @structure: the #GstStructure
 * @user_data: user data
 *
 * A function that will be called in gst_caps_map_in_place(). The function
 * may modify @features and @structure.
 *
 * Returns: %TRUE if the map operation should continue, %FALSE if
 * the map operation should stop with %FALSE.
  }

  TGstCapsMapFunc = function (features:PGstCapsFeatures; structure:PGstStructure; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstCapsFilterMapFunc:
 * @features: the #GstCapsFeatures
 * @structure: the #GstStructure
 * @user_data: user data
 *
 * A function that will be called in gst_caps_filter_and_map_in_place().
 * The function may modify @features and @structure, and both will be
 * removed from the caps if %FALSE is returned.
 *
 * Returns: %TRUE if the features and structure should be preserved,
 * %FALSE if it should be removed.
  }

  TGstCapsFilterMapFunc = function (features:PGstCapsFeatures; structure:PGstStructure; user_data:Tgpointer):Tgboolean;cdecl;

function gst_caps_get_type:TGType;cdecl;external;
function gst_caps_new_empty:PGstCaps;cdecl;external;
function gst_caps_new_any:PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_caps_new_id_str_empty_simple(media_type:PGstIdStr):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_caps_new_empty_simple(media_type:Pchar):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_caps_new_static_str_empty_simple(media_type:Pchar):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_new_id_str_simple(media_type:PGstIdStr; fieldname:PGstIdStr; args:array of const):PGstCaps;cdecl;external;
function gst_caps_new_id_str_simple(media_type:PGstIdStr; fieldname:PGstIdStr):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_new_simple(media_type:Pchar; fieldname:Pchar; args:array of const):PGstCaps;cdecl;external;
function gst_caps_new_simple(media_type:Pchar; fieldname:Pchar):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_new_static_str_simple(media_type:Pchar; fieldname:Pchar; args:array of const):PGstCaps;cdecl;external;
function gst_caps_new_static_str_simple(media_type:Pchar; fieldname:Pchar):PGstCaps;cdecl;external;
function gst_caps_new_full(struct1:PGstStructure; args:array of const):PGstCaps;cdecl;external;
function gst_caps_new_full(struct1:PGstStructure):PGstCaps;cdecl;external;
function gst_caps_new_full_valist(structure:PGstStructure; var_args:Tva_list):PGstCaps;cdecl;external;
{*
 * gst_static_caps_get_type: (attributes doc.skip=true)
  }
function gst_static_caps_get_type:TGType;cdecl;external;
function gst_static_caps_get(static_caps:PGstStaticCaps):PGstCaps;cdecl;external;
procedure gst_static_caps_cleanup(static_caps:PGstStaticCaps);cdecl;external;
{ manipulation  }
procedure gst_caps_append(caps1:PGstCaps; caps2:PGstCaps);cdecl;external;
procedure gst_caps_append_structure(caps:PGstCaps; structure:PGstStructure);cdecl;external;
procedure gst_caps_append_structure_full(caps:PGstCaps; structure:PGstStructure; features:PGstCapsFeatures);cdecl;external;
procedure gst_caps_remove_structure(caps:PGstCaps; idx:Tguint);cdecl;external;
function gst_caps_merge(caps1:PGstCaps; caps2:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_merge_structure(caps:PGstCaps; structure:PGstStructure):PGstCaps;cdecl;external;
function gst_caps_merge_structure_full(caps:PGstCaps; structure:PGstStructure; features:PGstCapsFeatures):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_caps_get_size(caps:PGstCaps):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_caps_get_structure(caps:PGstCaps; index:Tguint):PGstStructure;cdecl;external;
function gst_caps_steal_structure(caps:PGstCaps; index:Tguint):PGstStructure;cdecl;external;
procedure gst_caps_set_features(caps:PGstCaps; index:Tguint; features:PGstCapsFeatures);cdecl;external;
procedure gst_caps_set_features_simple(caps:PGstCaps; features:PGstCapsFeatures);cdecl;external;
(* Const before type ignored *)
function gst_caps_get_features(caps:PGstCaps; index:Tguint):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_copy_nth(caps:PGstCaps; nth:Tguint):PGstCaps;cdecl;external;
function gst_caps_truncate(caps:PGstCaps):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_caps_id_str_set_value(caps:PGstCaps; field:PGstIdStr; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_caps_set_value(caps:PGstCaps; field:Pchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_caps_set_value_static_str(caps:PGstCaps; field:Pchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_id_str_set_simple(caps:PGstCaps; field:PGstIdStr; args:array of const);cdecl;external;
procedure gst_caps_id_str_set_simple(caps:PGstCaps; field:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_set_simple(caps:PGstCaps; field:Pchar; args:array of const);cdecl;external;
procedure gst_caps_set_simple(caps:PGstCaps; field:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_set_simple_static_str(caps:PGstCaps; field:Pchar; args:array of const);cdecl;external;
procedure gst_caps_set_simple_static_str(caps:PGstCaps; field:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_id_str_set_simple_valist(caps:PGstCaps; field:PGstIdStr; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_set_simple_valist(caps:PGstCaps; field:Pchar; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_set_simple_static_str_valist(caps:PGstCaps; field:Pchar; varargs:Tva_list);cdecl;external;
(* Const before type ignored *)
function gst_caps_foreach(caps:PGstCaps; func:TGstCapsForeachFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
function gst_caps_map_in_place(caps:PGstCaps; func:TGstCapsMapFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
procedure gst_caps_filter_and_map_in_place(caps:PGstCaps; func:TGstCapsFilterMapFunc; user_data:Tgpointer);cdecl;external;
{ tests  }
(* Const before type ignored *)
function gst_caps_is_any(caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_caps_is_empty(caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_caps_is_fixed(caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_always_compatible(caps1:PGstCaps; caps2:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_subset(subset:PGstCaps; superset:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_subset_structure(caps:PGstCaps; structure:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_subset_structure_full(caps:PGstCaps; structure:PGstStructure; features:PGstCapsFeatures):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_equal(caps1:PGstCaps; caps2:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_equal_fixed(caps1:PGstCaps; caps2:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_can_intersect(caps1:PGstCaps; caps2:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_is_strictly_equal(caps1:PGstCaps; caps2:PGstCaps):Tgboolean;cdecl;external;
{ operations  }
function gst_caps_intersect(caps1:PGstCaps; caps2:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_intersect_full(caps1:PGstCaps; caps2:PGstCaps; mode:TGstCapsIntersectMode):PGstCaps;cdecl;external;
function gst_caps_subtract(minuend:PGstCaps; subtrahend:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_normalize(caps:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_simplify(caps:PGstCaps):PGstCaps;cdecl;external;
function gst_caps_fixate(caps:PGstCaps):PGstCaps;cdecl;external;
{ utility  }
(* Const before type ignored *)
function gst_caps_to_string(caps:PGstCaps):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_caps_serialize(caps:PGstCaps; flags:TGstSerializeFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_caps_from_string(_string:Pgchar):PGstCaps;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstCaps, gst_caps_unref) }
{$endif}
{ __GST_CAPS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CAPS(obj : longint) : longint;
begin
  GST_IS_CAPS:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_CAPS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_CAST(obj : longint) : PGstCaps;
begin
  GST_CAPS_CAST:=PGstCaps(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS(obj : longint) : longint;
begin
  GST_CAPS:=GST_CAPS_CAST(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_STATIC_CAPS : longint; { return type might be wrong }
  begin
    GST_TYPE_STATIC_CAPS:=gst_static_caps_get_type;
  end;

{ was #define dname def_expr }
function GST_STATIC_CAPS_ANY : longint; { return type might be wrong }
  begin
    GST_STATIC_CAPS_ANY:=GST_STATIC_CAPS('ANY');
  end;

{ was #define dname def_expr }
function GST_STATIC_CAPS_NONE : longint; { return type might be wrong }
  begin
    GST_STATIC_CAPS_NONE:=GST_STATIC_CAPS('NONE');
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_IS_SIMPLE(caps : longint) : longint;
begin
  GST_CAPS_IS_SIMPLE:=(gst_caps_get_size(caps))=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAGS(caps : longint) : longint;
begin
  GST_CAPS_FLAGS:=GST_MINI_OBJECT_FLAGS(caps);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_REFCOUNT(caps : longint) : longint;
begin
  GST_CAPS_REFCOUNT:=GST_MINI_OBJECT_REFCOUNT(caps);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_REFCOUNT_VALUE(caps : longint) : longint;
begin
  GST_CAPS_REFCOUNT_VALUE:=GST_MINI_OBJECT_REFCOUNT_VALUE(caps);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_IS_SET(caps,flag : longint) : longint;
begin
  GST_CAPS_FLAG_IS_SET:=GST_MINI_OBJECT_FLAG_IS_SET(caps,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_SET(caps,flag : longint) : longint;
begin
  GST_CAPS_FLAG_SET:=GST_MINI_OBJECT_FLAG_SET(caps,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FLAG_UNSET(caps,flag : longint) : longint;
begin
  GST_CAPS_FLAG_UNSET:=GST_MINI_OBJECT_FLAG_UNSET(caps,flag);
end;


end.
