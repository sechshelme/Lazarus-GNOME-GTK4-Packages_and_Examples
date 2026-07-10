
unit gstcapsfeatures;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcapsfeatures.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcapsfeatures.h
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
Pgint  = ^gint;
PGstCapsFeatures  = ^GstCapsFeatures;
PGstIdStr  = ^GstIdStr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Collabora Ltd.
 *   Author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
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
{$ifndef __GST_CAPS_FEATURES_H__}
{$define __GST_CAPS_FEATURES_H__}
{$include <gst/gstconfig.h>}
{$include <gst/glib-compat.h>}
{$include <gst/gstidstr.h>}
{$include <glib-object.h>}
{$include <glib.h>}
type
  var
    _gst_caps_features_type : TGType;cvar;external;

const
  GST_TYPE_CAPS_FEATURES = _gst_caps_features_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_CAPS_FEATURES(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_FEATURES_CAST(object : longint) : PGstCapsFeatures;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FEATURES(object : longint) : longint;

const
  GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY = 'memory:SystemMemory';  
  var
    _gst_caps_features_any : PGstCapsFeatures;cvar;external;

const
  GST_CAPS_FEATURES_ANY = _gst_caps_features_any;  
  var
    _gst_caps_features_memory_system_memory : PGstCapsFeatures;cvar;external;

const
  GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY = _gst_caps_features_memory_system_memory;  

function gst_caps_features_get_type:TGType;cdecl;external;
function gst_is_caps_features(obj:Tgconstpointer):Tgboolean;cdecl;external;
function gst_caps_features_new_empty:PGstCapsFeatures;cdecl;external;
function gst_caps_features_new_any:PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_single(feature:Pgchar):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_single_static_str(feature:Pgchar):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new(feature1:Pgchar; args:array of const):PGstCapsFeatures;cdecl;external;
function gst_caps_features_new(feature1:Pgchar):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_static_str(feature1:Pgchar; args:array of const):PGstCapsFeatures;cdecl;external;
function gst_caps_features_new_static_str(feature1:Pgchar):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_valist(feature1:Pgchar; varargs:Tva_list):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_static_str_valist(feature1:Pgchar; varargs:Tva_list):PGstCapsFeatures;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str) }
function gst_caps_features_new_id(feature1:TGQuark; args:array of const):PGstCapsFeatures;cdecl;external;
function gst_caps_features_new_id(feature1:TGQuark):PGstCapsFeatures;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str_valist) }
function gst_caps_features_new_id_valist(feature1:TGQuark; varargs:Tva_list):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_id_str(feature1:PGstIdStr; args:array of const):PGstCapsFeatures;cdecl;external;
function gst_caps_features_new_id_str(feature1:PGstIdStr):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_new_id_str_valist(feature1:PGstIdStr; varargs:Tva_list):PGstCapsFeatures;cdecl;external;
function gst_caps_features_set_parent_refcount(features:PGstCapsFeatures; refcount:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_copy(features:PGstCapsFeatures):PGstCapsFeatures;cdecl;external;
procedure gst_caps_features_free(features:PGstCapsFeatures);cdecl;external;
(* Const before type ignored *)
function gst_caps_features_to_string(features:PGstCapsFeatures):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_from_string(features:Pgchar):PGstCapsFeatures;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_get_size(features:PGstCapsFeatures):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_features_get_nth(features:PGstCapsFeatures; i:Tguint):Pgchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_get_nth_id_str) }
(* Const before type ignored *)
function gst_caps_features_get_nth_id(features:PGstCapsFeatures; i:Tguint):TGQuark;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_features_get_nth_id_str(features:PGstCapsFeatures; i:Tguint):PGstIdStr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_features_contains(features:PGstCapsFeatures; feature:Pgchar):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_contains_id_str) }
(* Const before type ignored *)
function gst_caps_features_contains_id(features:PGstCapsFeatures; feature:TGQuark):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_features_contains_id_str(features:PGstCapsFeatures; feature:PGstIdStr):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_caps_features_is_equal(features1:PGstCapsFeatures; features2:PGstCapsFeatures):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_caps_features_is_any(features:PGstCapsFeatures):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_caps_features_add(features:PGstCapsFeatures; feature:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_features_add_static_str(features:PGstCapsFeatures; feature:Pgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_add_id_str) }
procedure gst_caps_features_add_id(features:PGstCapsFeatures; feature:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_features_add_id_str(features:PGstCapsFeatures; feature:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_features_remove(features:PGstCapsFeatures; feature:Pgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_remove_id_str) }
procedure gst_caps_features_remove_id(features:PGstCapsFeatures; feature:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure gst_caps_features_remove_id_str(features:PGstCapsFeatures; feature:PGstIdStr);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstCapsFeatures, gst_caps_features_free) }
{$endif}
{ __GST_CAPS_FEATURES_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CAPS_FEATURES(object : longint) : longint;
begin
  GST_IS_CAPS_FEATURES:=gst_is_caps_features(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_FEATURES_CAST(object : longint) : PGstCapsFeatures;
begin
  GST_CAPS_FEATURES_CAST:=PGstCapsFeatures(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FEATURES(object : longint) : longint;
begin
  GST_CAPS_FEATURES:=GST_CAPS_FEATURES_CAST(object);
end;


end.
