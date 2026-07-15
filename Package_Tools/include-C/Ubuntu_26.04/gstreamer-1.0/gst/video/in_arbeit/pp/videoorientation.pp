
unit videoorientation;
interface

{
  Automatically converted by H2Pas 1.0.0 from videoorientation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    videoorientation.h
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
Pgboolean  = ^gboolean;
Pgint  = ^gint;
PGstVideoOrientation  = ^GstVideoOrientation;
PGstVideoOrientationInterface  = ^GstVideoOrientationInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2006 Nokia <stefan.kost@nokia.com
 *
 * videoorientation.h: video flipping and centering interface
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
{$ifndef __GST_VIDEO_ORIENTATION_H__}
{$define __GST_VIDEO_ORIENTATION_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_ORIENTATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ORIENTATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ORIENTATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ORIENTATION_GET_INTERFACE(inst : longint) : longint;

{*
 * GstVideoOrientation:
 *
 * Opaque #GstVideoOrientation data structure.
  }
type
{*
 * GstVideoOrientationInterface:
 * @iface: parent interface type.
 * @get_hflip: virtual method to get horizontal flipping state
 * @get_vflip: virtual method to get vertical flipping state
 * @get_hcenter: virtual method to get horizontal centering state
 * @get_vcenter: virtual method to get vertical centering state
 * @set_hflip: virtual method to set horizontal flipping state
 * @set_vflip: virtual method to set vertical flipping state
 * @set_hcenter: virtual method to set horizontal centering state
 * @set_vcenter: virtual method to set vertical centering state
 *
 * #GstVideoOrientationInterface interface.
  }
{ FIXME 0.11: fix awkward API? add some kind of get_supported flags thing
   * and then just return booleans/int from all vfuncs requiring the caller
   * to check the flags first  }
{ virtual functions  }
  PGstVideoOrientationInterface = ^TGstVideoOrientationInterface;
  TGstVideoOrientationInterface = record
      iface : TGTypeInterface;
      get_hflip : function (video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;
      get_vflip : function (video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;
      get_hcenter : function (video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;
      get_vcenter : function (video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;
      set_hflip : function (video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;
      set_vflip : function (video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;
      set_hcenter : function (video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;
      set_vcenter : function (video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;
    end;


function gst_video_orientation_get_type:TGType;cdecl;external;
{ virtual class function wrappers  }
function gst_video_orientation_get_hflip(video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;external;
function gst_video_orientation_get_vflip(video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;external;
function gst_video_orientation_get_hcenter(video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;external;
function gst_video_orientation_get_vcenter(video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;external;
function gst_video_orientation_set_hflip(video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;external;
function gst_video_orientation_set_vflip(video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;external;
function gst_video_orientation_set_hcenter(video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;external;
function gst_video_orientation_set_vcenter(video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;external;
{$endif}
{ __GST_VIDEO_ORIENTATION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_ORIENTATION : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_ORIENTATION:=gst_video_orientation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ORIENTATION(obj : longint) : longint;
begin
  GST_VIDEO_ORIENTATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_ORIENTATION,GstVideoOrientation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ORIENTATION(obj : longint) : longint;
begin
  GST_IS_VIDEO_ORIENTATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_ORIENTATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ORIENTATION_GET_INTERFACE(inst : longint) : longint;
begin
  GST_VIDEO_ORIENTATION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_VIDEO_ORIENTATION,GstVideoOrientationInterface);
end;


end.
