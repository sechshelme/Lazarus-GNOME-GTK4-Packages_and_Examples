unit gstcapsfeatures;

interface

uses
  fp_glib2, fp_gst;

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
    _gst_caps_features_type : TGType;cvar;external libgstreamer;

const
  GST_TYPE_CAPS_FEATURES = _gst_caps_features_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_CAPS_FEATURES(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_FEATURES_CAST(obj : longint) : PGstCapsFeatures;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FEATURES(obj : longint) : longint;

const
  GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY = 'memory:SystemMemory';  
  var
    _gst_caps_features_any : PGstCapsFeatures;cvar;external libgstreamer;

const
  GST_CAPS_FEATURES_ANY = _gst_caps_features_any;  
  var
    _gst_caps_features_memory_system_memory : PGstCapsFeatures;cvar;external libgstreamer;

const
  GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY = _gst_caps_features_memory_system_memory;  

function gst_caps_features_get_type:TGType;cdecl;external libgstreamer;
function gst_is_caps_features(obj:Tgconstpointer):Tgboolean;cdecl;external libgstreamer;
function gst_caps_features_new_empty:PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_any:PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_single(feature:Pgchar):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_single_static_str(feature:Pgchar):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new(feature1:Pgchar; args:array of const):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new(feature1:Pgchar):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_static_str(feature1:Pgchar; args:array of const):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_static_str(feature1:Pgchar):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_valist(feature1:Pgchar; varargs:Tva_list):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_static_str_valist(feature1:Pgchar; varargs:Tva_list):PGstCapsFeatures;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str) }
function gst_caps_features_new_id(feature1:TGQuark; args:array of const):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_id(feature1:TGQuark):PGstCapsFeatures;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str_valist) }
function gst_caps_features_new_id_valist(feature1:TGQuark; varargs:Tva_list):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_id_str(feature1:PGstIdStr; args:array of const):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_id_str(feature1:PGstIdStr):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_new_id_str_valist(feature1:PGstIdStr; varargs:Tva_list):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_set_parent_refcount(features:PGstCapsFeatures; refcount:Pgint):Tgboolean;cdecl;external libgstreamer;
function gst_caps_features_copy(features:PGstCapsFeatures):PGstCapsFeatures;cdecl;external libgstreamer;
procedure gst_caps_features_free(features:PGstCapsFeatures);cdecl;external libgstreamer;
function gst_caps_features_to_string(features:PGstCapsFeatures):Pgchar;cdecl;external libgstreamer;
function gst_caps_features_from_string(features:Pgchar):PGstCapsFeatures;cdecl;external libgstreamer;
function gst_caps_features_get_size(features:PGstCapsFeatures):Tguint;cdecl;external libgstreamer;
function gst_caps_features_get_nth(features:PGstCapsFeatures; i:Tguint):Pgchar;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_get_nth_id_str) }
function gst_caps_features_get_nth_id(features:PGstCapsFeatures; i:Tguint):TGQuark;cdecl;external libgstreamer;
function gst_caps_features_get_nth_id_str(features:PGstCapsFeatures; i:Tguint):PGstIdStr;cdecl;external libgstreamer;
function gst_caps_features_contains(features:PGstCapsFeatures; feature:Pgchar):Tgboolean;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_contains_id_str) }
function gst_caps_features_contains_id(features:PGstCapsFeatures; feature:TGQuark):Tgboolean;cdecl;external libgstreamer;
function gst_caps_features_contains_id_str(features:PGstCapsFeatures; feature:PGstIdStr):Tgboolean;cdecl;external libgstreamer;
function gst_caps_features_is_equal(features1:PGstCapsFeatures; features2:PGstCapsFeatures):Tgboolean;cdecl;external libgstreamer;
function gst_caps_features_is_any(features:PGstCapsFeatures):Tgboolean;cdecl;external libgstreamer;
procedure gst_caps_features_add(features:PGstCapsFeatures; feature:Pgchar);cdecl;external libgstreamer;
procedure gst_caps_features_add_static_str(features:PGstCapsFeatures; feature:Pgchar);cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_add_id_str) }
procedure gst_caps_features_add_id(features:PGstCapsFeatures; feature:TGQuark);cdecl;external libgstreamer;
procedure gst_caps_features_add_id_str(features:PGstCapsFeatures; feature:PGstIdStr);cdecl;external libgstreamer;
procedure gst_caps_features_remove(features:PGstCapsFeatures; feature:Pgchar);cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_caps_features_remove_id_str) }
procedure gst_caps_features_remove_id(features:PGstCapsFeatures; feature:TGQuark);cdecl;external libgstreamer;
procedure gst_caps_features_remove_id_str(features:PGstCapsFeatures; feature:PGstIdStr);cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstCapsFeatures, gst_caps_features_free) }
{$endif}
{ __GST_CAPS_FEATURES_H__  }

// === Konventiert am: 10-7-26 19:57:04 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CAPS_FEATURES(obj : longint) : longint;
begin
  GST_IS_CAPS_FEATURES:=gst_is_caps_features(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CAPS_FEATURES_CAST(obj : longint) : PGstCapsFeatures;
begin
  GST_CAPS_FEATURES_CAST:=PGstCapsFeatures(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CAPS_FEATURES(obj : longint) : longint;
begin
  GST_CAPS_FEATURES:=GST_CAPS_FEATURES_CAST(object);
end;


end.
