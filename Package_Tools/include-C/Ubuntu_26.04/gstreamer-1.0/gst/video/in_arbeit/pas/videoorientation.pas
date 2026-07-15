unit videoorientation;

interface

uses
  fp_glib2, fp_gst;

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


function gst_video_orientation_get_type:TGType;cdecl;external libgstvideo;
{ virtual class function wrappers  }
function gst_video_orientation_get_hflip(video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_get_vflip(video_orientation:PGstVideoOrientation; flip:Pgboolean):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_get_hcenter(video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_get_vcenter(video_orientation:PGstVideoOrientation; center:Pgint):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_set_hflip(video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_set_vflip(video_orientation:PGstVideoOrientation; flip:Tgboolean):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_set_hcenter(video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;external libgstvideo;
function gst_video_orientation_set_vcenter(video_orientation:PGstVideoOrientation; center:Tgint):Tgboolean;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_ORIENTATION_H__  }

// === Konventiert am: 15-7-26 13:39:27 ===

function GST_TYPE_VIDEO_ORIENTATION : TGType;
function GST_VIDEO_ORIENTATION(obj : Pointer) : PGstVideoOrientation;
function GST_IS_VIDEO_ORIENTATION(obj : Pointer) : Tgboolean;
function GST_VIDEO_ORIENTATION_GET_INTERFACE(obj : Pointer) : PGstVideoOrientationInterface;

implementation

function GST_TYPE_VIDEO_ORIENTATION : TGType;
  begin
    GST_TYPE_VIDEO_ORIENTATION:=gst_video_orientation_get_type;
  end;

function GST_VIDEO_ORIENTATION(obj : Pointer) : PGstVideoOrientation;
begin
  Result := PGstVideoOrientation(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_ORIENTATION));
end;

function GST_IS_VIDEO_ORIENTATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VIDEO_ORIENTATION);
end;

function GST_VIDEO_ORIENTATION_GET_INTERFACE(obj : Pointer) : PGstVideoOrientationInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_ORIENTATION);
end;



end.
