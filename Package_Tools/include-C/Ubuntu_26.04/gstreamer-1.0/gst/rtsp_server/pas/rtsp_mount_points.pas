unit rtsp_mount_points;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$include "rtsp-media-factory.h"}
{$ifndef __GST_RTSP_MOUNT_POINTS_H__}
{$define __GST_RTSP_MOUNT_POINTS_H__}

{ was #define dname def_expr }
function GST_TYPE_RTSP_MOUNT_POINTS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MOUNT_POINTS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MOUNT_POINTS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MOUNT_POINTS_CAST(obj : longint) : PGstRTSPMountPoints;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MOUNT_POINTS_CLASS_CAST(klass : longint) : PGstRTSPMountPointsClass;

type
{*
 * GstRTSPMountPoints:
 *
 * Creates a #GstRTSPMediaFactory object for a given url.
  }
{< private > }
  PGstRTSPMountPoints = ^TGstRTSPMountPoints;
  TGstRTSPMountPoints = record
      parent : TGObject;
      priv : PGstRTSPMountPointsPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPMountPointsClass:
 * @make_path: make a path from the given url.
 *
 * The class for the media mounts object.
  }
{< private > }
  PGstRTSPMountPointsClass = ^TGstRTSPMountPointsClass;
  TGstRTSPMountPointsClass = record
      parent_class : TGObjectClass;
      make_path : function (mounts:PGstRTSPMountPoints; url:PGstRTSPUrl):Pgchar;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_mount_points_get_type:TGType;cdecl;external libgstrtsp;
{ creating a mount points  }
function gst_rtsp_mount_points_new:PGstRTSPMountPoints;cdecl;external libgstrtsp;
function gst_rtsp_mount_points_make_path(mounts:PGstRTSPMountPoints; url:PGstRTSPUrl):Pgchar;cdecl;external libgstrtsp;
{ finding a media factory  }
function gst_rtsp_mount_points_match(mounts:PGstRTSPMountPoints; path:Pgchar; matched:Pgint):PGstRTSPMediaFactory;cdecl;external libgstrtsp;
{ managing media to a mount point  }
procedure gst_rtsp_mount_points_add_factory(mounts:PGstRTSPMountPoints; path:Pgchar; factory:PGstRTSPMediaFactory);cdecl;external libgstrtsp;
procedure gst_rtsp_mount_points_remove_factory(mounts:PGstRTSPMountPoints; path:Pgchar);cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPMountPoints, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_MOUNT_POINTS_H__  }

// === Konventiert am: 20-7-26 13:45:20 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_MOUNT_POINTS : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_MOUNT_POINTS:=gst_rtsp_mount_points_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MOUNT_POINTS(obj : longint) : longint;
begin
  GST_IS_RTSP_MOUNT_POINTS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_MOUNT_POINTS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MOUNT_POINTS_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_MOUNT_POINTS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_MOUNT_POINTS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_MOUNT_POINTS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_MOUNT_POINTS,GstRTSPMountPointsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS(obj : longint) : longint;
begin
  GST_RTSP_MOUNT_POINTS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_MOUNT_POINTS,GstRTSPMountPoints);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MOUNT_POINTS_CLASS(klass : longint) : longint;
begin
  GST_RTSP_MOUNT_POINTS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_MOUNT_POINTS,GstRTSPMountPointsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MOUNT_POINTS_CAST(obj : longint) : PGstRTSPMountPoints;
begin
  GST_RTSP_MOUNT_POINTS_CAST:=PGstRTSPMountPoints(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MOUNT_POINTS_CLASS_CAST(klass : longint) : PGstRTSPMountPointsClass;
begin
  GST_RTSP_MOUNT_POINTS_CLASS_CAST:=PGstRTSPMountPointsClass(klass);
end;


end.
