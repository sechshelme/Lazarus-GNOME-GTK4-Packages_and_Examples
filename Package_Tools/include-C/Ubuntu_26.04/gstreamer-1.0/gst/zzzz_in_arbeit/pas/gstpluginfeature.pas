unit gstpluginfeature;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstpluginfeature.h: Header for base GstPluginFeature
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
{$ifndef __GST_PLUGIN_FEATURE_H__}
{$define __GST_PLUGIN_FEATURE_H__}
{$include <glib-object.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstplugin.h>}

{ was #define dname def_expr }
function GST_TYPE_PLUGIN_FEATURE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_FEATURE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_FEATURE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLUGIN_FEATURE_CAST(obj : longint) : PGstPluginFeature;

{*
 * GstPluginFeature:
 *
 * Opaque #GstPluginFeature structure.
  }
type
{*
 * GstRank:
 * @GST_RANK_NONE: will be chosen last or not at all
 * @GST_RANK_MARGINAL: unlikely to be chosen
 * @GST_RANK_SECONDARY: likely to be chosen
 * @GST_RANK_PRIMARY: will be chosen first
 *
 * Element priority ranks. Defines the order in which the autoplugger (or
 * similar rank-picking mechanisms, such as e.g. gst_element_make_from_uri())
 * will choose this element over an alternative one with the same function.
 *
 * These constants serve as a rough guidance for defining the rank of a
 * #GstPluginFeature. Any value is valid, including values bigger than
 * @GST_RANK_PRIMARY.
  }

  PGstRank = ^TGstRank;
  TGstRank =  Longint;
  Const
    GST_RANK_NONE = 0;
    GST_RANK_MARGINAL = 64;
    GST_RANK_SECONDARY = 128;
    GST_RANK_PRIMARY = 256;
;
{*
 * gst_plugin_feature_get_name:
 * @feature: a #GstPluginFeature to get the name of @feature.
 *
 * Returns the name of @feature.
 * For a nameless plugin feature, this returns %NULL.
 *
 * Returns: (transfer none) (nullable): the name of @feature. MT safe.
 *
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_plugin_feature_get_name(feature : longint) : longint;

{*
 * gst_plugin_feature_set_name:
 * @feature: a #GstPluginFeature to set the name of.
 * @name: the new name
 *
 * Sets the name of the plugin feature, getting rid of the old name if there was one.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_plugin_feature_set_name(feature,name : longint) : longint;

{*
 * GstPluginFeatureFilter:
 * @feature: the pluginfeature to check
 * @user_data: the user_data that has been passed on e.g.
 *  gst_registry_feature_filter()
 *
 * A function that can be used with e.g. gst_registry_feature_filter()
 * to get a list of pluginfeature that match certain criteria.
 *
 * Returns: %TRUE for a positive match, %FALSE otherwise
  }
type

  TGstPluginFeatureFilter = function (feature:PGstPluginFeature; user_data:Tgpointer):Tgboolean;cdecl;
{ normal GObject stuff  }

function gst_plugin_feature_get_type:TGType;cdecl;external libgstreamer;
function gst_plugin_feature_load(feature:PGstPluginFeature):PGstPluginFeature;cdecl;external libgstreamer;
procedure gst_plugin_feature_set_rank(feature:PGstPluginFeature; rank:Tguint);cdecl;external libgstreamer;
function gst_plugin_feature_get_rank(feature:PGstPluginFeature):Tguint;cdecl;external libgstreamer;
function gst_plugin_feature_get_plugin(feature:PGstPluginFeature):PGstPlugin;cdecl;external libgstreamer;
function gst_plugin_feature_get_plugin_name(feature:PGstPluginFeature):Pgchar;cdecl;external libgstreamer;
procedure gst_plugin_feature_list_free(list:PGList);cdecl;external libgstreamer;
function gst_plugin_feature_list_copy(list:PGList):PGList;cdecl;external libgstreamer;
procedure gst_plugin_feature_list_debug(list:PGList);cdecl;external libgstreamer;
{*
 * GST_PLUGIN_FEATURE_LIST_DEBUG:
 * @list: (transfer none) (element-type Gst.PluginFeature): a #GList of
 *     plugin features
 *
 * Debug the plugin feature names in @list.
  }
function gst_plugin_feature_check_version(feature:PGstPluginFeature; min_major:Tguint; min_minor:Tguint; min_micro:Tguint):Tgboolean;cdecl;external libgstreamer;
function gst_plugin_feature_rank_compare_func(p1:Tgconstpointer; p2:Tgconstpointer):Tgint;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstPluginFeature, gst_object_unref) }
{$endif}
{ __GST_PLUGIN_FEATURE_H__  }

// === Konventiert am: 11-7-26 15:25:19 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_PLUGIN_FEATURE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLUGIN_FEATURE:=gst_plugin_feature_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE(obj : longint) : longint;
begin
  GST_PLUGIN_FEATURE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLUGIN_FEATURE,GstPluginFeature);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_FEATURE(obj : longint) : longint;
begin
  GST_IS_PLUGIN_FEATURE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLUGIN_FEATURE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE_CLASS(klass : longint) : longint;
begin
  GST_PLUGIN_FEATURE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLUGIN_FEATURE,GstPluginFeatureClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_FEATURE_CLASS(klass : longint) : longint;
begin
  GST_IS_PLUGIN_FEATURE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLUGIN_FEATURE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_FEATURE_GET_CLASS(obj : longint) : longint;
begin
  GST_PLUGIN_FEATURE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLUGIN_FEATURE,GstPluginFeatureClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLUGIN_FEATURE_CAST(obj : longint) : PGstPluginFeature;
begin
  GST_PLUGIN_FEATURE_CAST:=PGstPluginFeature(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_plugin_feature_get_name(feature : longint) : longint;
begin
  gst_plugin_feature_get_name:=GST_OBJECT_NAME(feature);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_plugin_feature_set_name(feature,name : longint) : longint;
begin
  gst_plugin_feature_set_name:=gst_object_set_name(GST_OBJECT_CAST(feature),name);
end;


end.
