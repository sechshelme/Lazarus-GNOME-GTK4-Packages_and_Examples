
unit video;
interface

{
  Automatically converted by H2Pas 1.0.0 from video.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video
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
PGError  = ^GError;
Pgint  = ^gint;
PGstCaps  = ^GstCaps;
PGstSample  = ^GstSample;
PGstTagList  = ^GstTagList;
PGstVideoAlignment  = ^GstVideoAlignment;
PGstVideoOrientationMethod  = ^GstVideoOrientationMethod;
PGstVideoRectangle  = ^GstVideoRectangle;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_H__}
{$define __GST_VIDEO_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
type
{$include <gst/video/video-format.h>}
{$include <gst/video/video-color.h>}
{$include <gst/video/video-dither.h>}
{$include <gst/video/video-info.h>}
{$include <gst/video/video-frame.h>}
{$include <gst/video/video-enumtypes.h>}
{$include <gst/video/video-converter.h>}
{$include <gst/video/video-scaler.h>}
{$include <gst/video/video-multiview.h>}
{$include <gst/video/video-info-dma.h>}
{*
 * GstVideoAlignment:
 * @padding_left: extra pixels on the left side
 * @padding_right: extra pixels on the right side
 * @padding_top: extra pixels on the top
 * @padding_bottom: extra pixels on the bottom
 * @stride_align: array with extra alignment requirements for the strides
 *
 * Extra alignment parameters for the memory of video buffers. This
 * structure is usually used to configure the bufferpool if it supports the
 * #GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT.
  }
type
  PGstVideoAlignment = ^TGstVideoAlignment;
  TGstVideoAlignment = record
      padding_top : Tguint;
      padding_bottom : Tguint;
      padding_left : Tguint;
      padding_right : Tguint;
      stride_align : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tguint;
    end;

{*
 * GstVideoRectangle:
 * @x: X coordinate of rectangle's top-left point
 * @y: Y coordinate of rectangle's top-left point
 * @w: width of the rectangle
 * @h: height of the rectangle
 *
 * Helper structure representing a rectangular area.
  }
  PGstVideoRectangle = ^TGstVideoRectangle;
  TGstVideoRectangle = record
      x : Tgint;
      y : Tgint;
      w : Tgint;
      h : Tgint;
    end;

{*
 * GstVideoOrientationMethod:
 * @GST_VIDEO_ORIENTATION_IDENTITY: Identity (no rotation)
 * @GST_VIDEO_ORIENTATION_90R: Rotate clockwise 90 degrees
 * @GST_VIDEO_ORIENTATION_180: Rotate 180 degrees
 * @GST_VIDEO_ORIENTATION_90L: Rotate counter-clockwise 90 degrees
 * @GST_VIDEO_ORIENTATION_HORIZ: Flip horizontally
 * @GST_VIDEO_ORIENTATION_VERT: Flip vertically
 * @GST_VIDEO_ORIENTATION_UL_LR: Rotate counter-clockwise 90 degrees and flip vertically
 * @GST_VIDEO_ORIENTATION_UR_LL: Rotate clockwise 90 degrees and flip vertically
 * @GST_VIDEO_ORIENTATION_AUTO: Select flip method based on image-orientation tag
 * @GST_VIDEO_ORIENTATION_CUSTOM: Current status depends on plugin internal setup
 *
 * The different video orientation methods.
 *
 * Since: 1.10
  }

  PGstVideoOrientationMethod = ^TGstVideoOrientationMethod;
  TGstVideoOrientationMethod =  Longint;
  Const
    GST_VIDEO_ORIENTATION_IDENTITY = 0;
    GST_VIDEO_ORIENTATION_90R = 1;
    GST_VIDEO_ORIENTATION_180 = 2;
    GST_VIDEO_ORIENTATION_90L = 3;
    GST_VIDEO_ORIENTATION_HORIZ = 4;
    GST_VIDEO_ORIENTATION_VERT = 5;
    GST_VIDEO_ORIENTATION_UL_LR = 6;
    GST_VIDEO_ORIENTATION_UR_LL = 7;
    GST_VIDEO_ORIENTATION_AUTO = 8;
    GST_VIDEO_ORIENTATION_CUSTOM = 9;
;
{*
 * GST_TYPE_VIDEO_ORIENTATION_METHOD:
 *
 * Since: 1.20
  }
{ metadata macros  }
{*
 * GST_META_TAG_VIDEO_STR:
 *
 * This metadata is relevant for video streams.
 *
 * Since: 1.2
  }
  GST_META_TAG_VIDEO_STR = 'video';  
{*
 * GST_META_TAG_VIDEO_ORIENTATION_STR:
 *
 * This metadata stays relevant as long as video orientation is unchanged.
 *
 * Since: 1.2
  }
  GST_META_TAG_VIDEO_ORIENTATION_STR = 'orientation';  
{*
 * GST_META_TAG_VIDEO_SIZE_STR:
 *
 * This metadata stays relevant as long as video size is unchanged.
 *
 * Since: 1.2
  }
  GST_META_TAG_VIDEO_SIZE_STR = 'size';  
{*
 * GST_META_TAG_VIDEO_COLORSPACE_STR:
 *
 * This metadata stays relevant as long as video colorspace is unchanged.
 *
 * Since: 1.2
  }
  GST_META_TAG_VIDEO_COLORSPACE_STR = 'colorspace';  

procedure gst_video_alignment_reset(align:PGstVideoAlignment);cdecl;external;
{ some helper functions  }
function gst_video_calculate_display_ratio(dar_n:Pguint; dar_d:Pguint; video_width:Tguint; video_height:Tguint; video_par_n:Tguint; 
           video_par_d:Tguint; display_par_n:Tguint; display_par_d:Tguint):Tgboolean;cdecl;external;
function gst_video_guess_framerate(duration:TGstClockTime; dest_n:Pgint; dest_d:Pgint):Tgboolean;cdecl;external;
function gst_video_is_common_aspect_ratio(width:Tgint; height:Tgint; par_n:Tgint; par_d:Tgint):Tgboolean;cdecl;external;
{ convert/encode video sample from one format to another  }
type

  TGstVideoConvertSampleCallback = procedure (sample:PGstSample; error:PGError; user_data:Tgpointer);cdecl;
(* Const before type ignored *)

procedure gst_video_convert_sample_async(sample:PGstSample; to_caps:PGstCaps; timeout:TGstClockTime; callback:TGstVideoConvertSampleCallback; user_data:Tgpointer; 
            destroy_notify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
function gst_video_convert_sample(sample:PGstSample; to_caps:PGstCaps; timeout:TGstClockTime; error:PPGError):PGstSample;cdecl;external;
function gst_video_orientation_from_tag(taglist:PGstTagList; method:PGstVideoOrientationMethod):Tgboolean;cdecl;external;
{$include <gst/video/colorbalancechannel.h>}
{$include <gst/video/colorbalance.h>}
{$include <gst/video/gstvideoaffinetransformationmeta.h>}
{$include <gst/video/gstvideoaggregator.h>}
{$include <gst/video/gstvideocodecalphameta.h>}
{$include <gst/video/gstvideodecoder.h>}
{$include <gst/video/gstvideoencoder.h>}
{$include <gst/video/gstvideofilter.h>}
{$include <gst/video/gstvideometa.h>}
{$include <gst/video/gstvideopool.h>}
{$include <gst/video/gstvideosink.h>}
{$include <gst/video/gstvideotimecode.h>}
{$include <gst/video/gstvideoutils.h>}
{$include <gst/video/navigation.h>}
{$include <gst/video/video-anc.h>}
{$include <gst/video/video-blend.h>}
{$include <gst/video/videodirection.h>}
{$include <gst/video/video-event.h>}
{$include <gst/video/video-hdr.h>}
{$include <gst/video/videoorientation.h>}
{$include <gst/video/video-overlay-composition.h>}
{$include <gst/video/videooverlay.h>}
{$include <gst/video/video-sei.h>}
{$include <gst/video/gstvideodmabufpool.h>}
{$endif}
{ __GST_VIDEO_H__  }

implementation


end.
