unit encoding_target;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer encoding profile registry
 * Copyright (C) 2010 Edward Hervey <edward.hervey@collabora.co.uk>
 *           (C) 2010 Nokia Corporation
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
{$ifndef __GST_PROFILE_REGISTRY_H__}
{$define __GST_PROFILE_REGISTRY_H__}
{$include <gst/pbutils/encoding-profile.h>}
{ FIXME/UNKNOWNS
 *
 * Should encoding categories be well-known strings/quarks ?
 *
  }
{*
 * GST_ENCODING_CATEGORY_DEVICE:
 *
 * #GstEncodingTarget category for device-specific targets.
 * The name of the target will usually be the constructor and model of the device,
 * and that target will contain #GstEncodingProfiles suitable for that device.
  }

const
  GST_ENCODING_CATEGORY_DEVICE = 'device';  
{*
 * GST_ENCODING_CATEGORY_ONLINE_SERVICE:
 *
 * #GstEncodingTarget category for online-services.
 * The name of the target will usually be the name of the online service
 * and that target will contain #GstEncodingProfiles suitable for that online
 * service.
  }
  GST_ENCODING_CATEGORY_ONLINE_SERVICE = 'online-service';  
{*
 * GST_ENCODING_CATEGORY_STORAGE_EDITING:
 *
 * #GstEncodingTarget category for storage, archiving and editing targets.
 * Those targets can be lossless and/or provide very fast random access content.
 * The name of the target will usually be the container type or editing target,
 * and that target will contain #GstEncodingProfiles suitable for editing or
 * storage.
  }
  GST_ENCODING_CATEGORY_STORAGE_EDITING = 'storage-editing';  
{*
 * GST_ENCODING_CATEGORY_CAPTURE:
 *
 * #GstEncodingTarget category for recording and capture.
 * Targets within this category are optimized for low latency encoding.
  }
  GST_ENCODING_CATEGORY_CAPTURE = 'capture';  
{*
 * GST_ENCODING_CATEGORY_FILE_EXTENSION:
 *
 * #GstEncodingTarget category for file extensions.
 * The name of the target will be the name of the file extensions possible
 * for a particular target. Those targets are defining like 'default' formats
 * usually used for a particular file extension.
  }
  GST_ENCODING_CATEGORY_FILE_EXTENSION = 'file-extension';  
{*
 * GstEncodingTarget:
 *
 * Collection of #GstEncodingProfile for a specific target or use-case.
 *
 * When being stored/loaded, targets come from a specific category, like
 * #GST_ENCODING_CATEGORY_DEVICE.
  }

{ was #define dname def_expr }
function GST_TYPE_ENCODING_TARGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_TARGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_TARGET(obj : longint) : longint;

type

  PGstEncodingTargetClass = ^TGstEncodingTargetClass;
  TGstEncodingTargetClass = TGObjectClass;

function gst_encoding_target_get_type:TGType;cdecl;external libgstpbutils;
{*
 * gst_encoding_target_unref:
 * @target: a #GstEncodingTarget
 *
 * Decreases the reference count of the @target, possibly freeing it.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_target_unref(target : longint) : longint;

{*
 * gst_encoding_target_ref:
 * @target: a #GstEncodingTarget
 *
 * Increases the reference count of the @target.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_target_ref(target : longint) : longint;

function gst_encoding_target_new(name:Pgchar; category:Pgchar; description:Pgchar; profiles:PGList):PGstEncodingTarget;cdecl;external libgstpbutils;
function gst_encoding_target_get_name(target:PGstEncodingTarget):Pgchar;cdecl;external libgstpbutils;
function gst_encoding_target_get_category(target:PGstEncodingTarget):Pgchar;cdecl;external libgstpbutils;
function gst_encoding_target_get_description(target:PGstEncodingTarget):Pgchar;cdecl;external libgstpbutils;
function gst_encoding_target_get_path(target:PGstEncodingTarget):Pgchar;cdecl;external libgstpbutils;
function gst_encoding_target_get_profiles(target:PGstEncodingTarget):PGList;cdecl;external libgstpbutils;
function gst_encoding_target_get_profile(target:PGstEncodingTarget; name:Pgchar):PGstEncodingProfile;cdecl;external libgstpbutils;
function gst_encoding_target_add_profile(target:PGstEncodingTarget; profile:PGstEncodingProfile):Tgboolean;cdecl;external libgstpbutils;
function gst_encoding_target_save(target:PGstEncodingTarget; error:PPGError):Tgboolean;cdecl;external libgstpbutils;
function gst_encoding_target_save_to_file(target:PGstEncodingTarget; filepath:Pgchar; error:PPGError):Tgboolean;cdecl;external libgstpbutils;
function gst_encoding_target_load(name:Pgchar; category:Pgchar; error:PPGError):PGstEncodingTarget;cdecl;external libgstpbutils;
function gst_encoding_target_load_from_file(filepath:Pgchar; error:PPGError):PGstEncodingTarget;cdecl;external libgstpbutils;
function gst_encoding_list_available_categories:PGList;cdecl;external libgstpbutils;
function gst_encoding_list_all_targets(categoryname:Pgchar):PGList;cdecl;external libgstpbutils;
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstEncodingTarget, gst_object_unref) }
{$endif}
{ __GST_PROFILE_REGISTRY_H__  }

// === Konventiert am: 23-7-26 19:46:15 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_ENCODING_TARGET : longint; { return type might be wrong }
  begin
    GST_TYPE_ENCODING_TARGET:=gst_encoding_target_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_TARGET(obj : longint) : longint;
begin
  GST_ENCODING_TARGET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ENCODING_TARGET,GstEncodingTarget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_TARGET(obj : longint) : longint;
begin
  GST_IS_ENCODING_TARGET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ENCODING_TARGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_target_unref(target : longint) : longint;
begin
  gst_encoding_target_unref:=g_object_unref(PGObject(target));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_target_ref(target : longint) : longint;
begin
  gst_encoding_target_ref:=g_object_ref(PGObject(target));
end;


end.
