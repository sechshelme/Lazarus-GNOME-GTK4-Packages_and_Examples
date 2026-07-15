
unit video_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_info
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
Pgint64  = ^gint64;
PGstCaps  = ^GstCaps;
PGstVideoAlignment  = ^GstVideoAlignment;
PGstVideoFieldOrder  = ^GstVideoFieldOrder;
PGstVideoFlags  = ^GstVideoFlags;
PGstVideoFormatInfo  = ^GstVideoFormatInfo;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoInterlaceMode  = ^GstVideoInterlaceMode;
PGstVideoMultiviewFlags  = ^GstVideoMultiviewFlags;
PGstVideoMultiviewFramePacking  = ^GstVideoMultiviewFramePacking;
PGstVideoMultiviewMode  = ^GstVideoMultiviewMode;
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
{$ifndef __GST_VIDEO_INFO_H__}
{$define __GST_VIDEO_INFO_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-format.h>}
{$include <gst/video/video-color.h>}
{$include <gst/video/video-enumtypes.h>}
type
{*
 * GST_CAPS_FEATURE_FORMAT_INTERLACED:
 *
 * Name of the caps feature indicating that the stream is interlaced.
 *
 * Currently it is only used for video with 'interlace-mode=alternate'
 * to ensure backwards compatibility for this new mode.
 * In this mode each buffer carries a single field of interlaced video.
 * @GST_VIDEO_BUFFER_FLAG_TOP_FIELD and @GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD
 * indicate whether the buffer carries a top or bottom field. The order of
 * buffers/fields in the stream and the timestamps on the buffers indicate the
 * temporal order of the fields.
 * Top and bottom fields are expected to alternate in this mode.
 * The frame rate in the caps still signals the frame rate, so the notional field
 * rate will be twice the frame rate from the caps
 * (see @GST_VIDEO_INFO_FIELD_RATE_N).
 *
 * Since: 1.16.
  }

const
  GST_CAPS_FEATURE_FORMAT_INTERLACED = 'format:Interlaced';  
{*
 * GstVideoInterlaceMode:
 * @GST_VIDEO_INTERLACE_MODE_PROGRESSIVE: all frames are progressive
 * @GST_VIDEO_INTERLACE_MODE_INTERLEAVED: 2 fields are interleaved in one video
 *     frame. Extra buffer flags describe the field order.
 * @GST_VIDEO_INTERLACE_MODE_MIXED: frames contains both interlaced and
 *     progressive video, the buffer flags describe the frame and fields.
 * @GST_VIDEO_INTERLACE_MODE_FIELDS: 2 fields are stored in one buffer, use the
 *     frame ID to get access to the required field. For multiview (the
 *     'views' property > 1) the fields of view N can be found at frame ID
 *     (N * 2) and (N * 2) + 1.
 *     Each field has only half the amount of lines as noted in the
 *     height property. This mode requires multiple GstVideoMeta metadata
 *     to describe the fields.
 * @GST_VIDEO_INTERLACE_MODE_ALTERNATE: 1 field is stored in one buffer,
 *     @GST_VIDEO_BUFFER_FLAG_TF or @GST_VIDEO_BUFFER_FLAG_BF indicates if
 *     the buffer is carrying the top or bottom field, respectively. The top and
 *     bottom buffers must alternate in the pipeline, with this mode
 *     (Since: 1.16).
 *
 * The possible values of the #GstVideoInterlaceMode describing the interlace
 * mode of the stream.
  }
type
  PGstVideoInterlaceMode = ^TGstVideoInterlaceMode;
  TGstVideoInterlaceMode =  Longint;
  Const
    GST_VIDEO_INTERLACE_MODE_PROGRESSIVE = 0;
    GST_VIDEO_INTERLACE_MODE_INTERLEAVED = 1;
    GST_VIDEO_INTERLACE_MODE_MIXED = 2;
    GST_VIDEO_INTERLACE_MODE_FIELDS = 3;
    GST_VIDEO_INTERLACE_MODE_ALTERNATE = 4;
;
(* Const before type ignored *)

function gst_video_interlace_mode_to_string(mode:TGstVideoInterlaceMode):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_video_interlace_mode_from_string(mode:Pgchar):TGstVideoInterlaceMode;cdecl;external;
{*
 * GstVideoMultiviewMode:
 * @GST_VIDEO_MULTIVIEW_MODE_NONE: A special value indicating
 * no multiview information. Used in GstVideoInfo and other places to
 * indicate that no specific multiview handling has been requested or
 * provided. This value is never carried on caps.
 * @GST_VIDEO_MULTIVIEW_MODE_MONO: All frames are monoscopic.
 * @GST_VIDEO_MULTIVIEW_MODE_LEFT: All frames represent a left-eye view.
 * @GST_VIDEO_MULTIVIEW_MODE_RIGHT: All frames represent a right-eye view.
 * @GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE: Left and right eye views are
 * provided in the left and right half of the frame respectively.
 * @GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE_QUINCUNX: Left and right eye
 * views are provided in the left and right half of the frame, but
 * have been sampled using quincunx method, with half-pixel offset
 * between the 2 views.
 * @GST_VIDEO_MULTIVIEW_MODE_COLUMN_INTERLEAVED: Alternating vertical
 * columns of pixels represent the left and right eye view respectively.
 * @GST_VIDEO_MULTIVIEW_MODE_ROW_INTERLEAVED: Alternating horizontal
 * rows of pixels represent the left and right eye view respectively.
 * @GST_VIDEO_MULTIVIEW_MODE_TOP_BOTTOM: The top half of the frame
 * contains the left eye, and the bottom half the right eye.
 * @GST_VIDEO_MULTIVIEW_MODE_CHECKERBOARD: Pixels are arranged with
 * alternating pixels representing left and right eye views in a
 * checkerboard fashion.
 * @GST_VIDEO_MULTIVIEW_MODE_FRAME_BY_FRAME: Left and right eye views
 * are provided in separate frames alternately.
 * @GST_VIDEO_MULTIVIEW_MODE_MULTIVIEW_FRAME_BY_FRAME: Multiple
 * independent views are provided in separate frames in sequence.
 * This method only applies to raw video buffers at the moment.
 * Specific view identification is via the `GstVideoMultiviewMeta`
 * and #GstVideoMeta(s) on raw video buffers.
 * @GST_VIDEO_MULTIVIEW_MODE_SEPARATED: Multiple views are
 * provided as separate #GstMemory framebuffers attached to each
 * #GstBuffer, described by the `GstVideoMultiviewMeta`
 * and #GstVideoMeta(s)
 *
 * All possible stereoscopic 3D and multiview representations.
 * In conjunction with #GstVideoMultiviewFlags, describes how
 * multiview content is being transported in the stream.
  }
{ Single view modes  }
{ Stereo view modes  }
{ Padding for new frame packing modes  }
{ Multivew mode(s)  }
{ future expansion for annotated modes  }
type
  PGstVideoMultiviewMode = ^TGstVideoMultiviewMode;
  TGstVideoMultiviewMode =  Longint;
  Const
    GST_VIDEO_MULTIVIEW_MODE_NONE = -(1);
    GST_VIDEO_MULTIVIEW_MODE_MONO = 0;
    GST_VIDEO_MULTIVIEW_MODE_LEFT = 1;
    GST_VIDEO_MULTIVIEW_MODE_RIGHT = 2;
    GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE = 3;
    GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE_QUINCUNX = 4;
    GST_VIDEO_MULTIVIEW_MODE_COLUMN_INTERLEAVED = 5;
    GST_VIDEO_MULTIVIEW_MODE_ROW_INTERLEAVED = 6;
    GST_VIDEO_MULTIVIEW_MODE_TOP_BOTTOM = 7;
    GST_VIDEO_MULTIVIEW_MODE_CHECKERBOARD = 8;
    GST_VIDEO_MULTIVIEW_MODE_FRAME_BY_FRAME = 32;
    GST_VIDEO_MULTIVIEW_MODE_MULTIVIEW_FRAME_BY_FRAME = 33;
    GST_VIDEO_MULTIVIEW_MODE_SEPARATED = 34;
;
{*
 * GstVideoMultiviewFramePacking:
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_NONE: A special value indicating
 * no frame packing info.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_MONO: All frames are monoscopic.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_LEFT: All frames represent a left-eye view.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_RIGHT: All frames represent a right-eye view.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE: Left and right eye views are
 * provided in the left and right half of the frame respectively.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE_QUINCUNX: Left and right eye
 * views are provided in the left and right half of the frame, but
 * have been sampled using quincunx method, with half-pixel offset
 * between the 2 views.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_COLUMN_INTERLEAVED: Alternating vertical
 * columns of pixels represent the left and right eye view respectively.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_ROW_INTERLEAVED: Alternating horizontal
 * rows of pixels represent the left and right eye view respectively.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_TOP_BOTTOM: The top half of the frame
 * contains the left eye, and the bottom half the right eye.
 * @GST_VIDEO_MULTIVIEW_FRAME_PACKING_CHECKERBOARD: Pixels are arranged with
 * alternating pixels representing left and right eye views in a
 * checkerboard fashion.
 *
 * #GstVideoMultiviewFramePacking represents the subset of #GstVideoMultiviewMode
 * values that can be applied to any video frame without needing extra metadata.
 * It can be used by elements that provide a property to override the
 * multiview interpretation of a video stream when the video doesn't contain
 * any markers.
 *
 * This enum is used (for example) on playbin, to re-interpret a played
 * video stream as a stereoscopic video. The individual enum values are
 * equivalent to and have the same value as the matching #GstVideoMultiviewMode.
 *
  }
type
  PGstVideoMultiviewFramePacking = ^TGstVideoMultiviewFramePacking;
  TGstVideoMultiviewFramePacking =  Longint;
  Const
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_NONE = GST_VIDEO_MULTIVIEW_MODE_NONE;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_MONO = GST_VIDEO_MULTIVIEW_MODE_MONO;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_LEFT = GST_VIDEO_MULTIVIEW_MODE_LEFT;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_RIGHT = GST_VIDEO_MULTIVIEW_MODE_RIGHT;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE = GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE_QUINCUNX = GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE_QUINCUNX;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_COLUMN_INTERLEAVED = GST_VIDEO_MULTIVIEW_MODE_COLUMN_INTERLEAVED;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_ROW_INTERLEAVED = GST_VIDEO_MULTIVIEW_MODE_ROW_INTERLEAVED;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_TOP_BOTTOM = GST_VIDEO_MULTIVIEW_MODE_TOP_BOTTOM;
    GST_VIDEO_MULTIVIEW_FRAME_PACKING_CHECKERBOARD = GST_VIDEO_MULTIVIEW_MODE_CHECKERBOARD;
;
  GST_VIDEO_MULTIVIEW_MAX_FRAME_PACKING = GST_VIDEO_MULTIVIEW_FRAME_PACKING_CHECKERBOARD;  
{*
 * GstVideoMultiviewFlags:
 * @GST_VIDEO_MULTIVIEW_FLAGS_NONE: No flags
 * @GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_VIEW_FIRST: For stereo streams, the
 *     normal arrangement of left and right views is reversed.
 * @GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLIPPED: The left view is vertically
 *     mirrored.
 * @GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLOPPED: The left view is horizontally
 *     mirrored.
 * @GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLIPPED: The right view is
 *     vertically mirrored.
 * @GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLOPPED: The right view is
 *     horizontally mirrored.
 * @GST_VIDEO_MULTIVIEW_FLAGS_HALF_ASPECT: For frame-packed
 *     multiview modes, indicates that the individual
 *     views have been encoded with half the true width or height
 *     and should be scaled back up for display. This flag
 *     is used for overriding input layout interpretation
 *     by adjusting pixel-aspect-ratio.
 *     For side-by-side, column interleaved or checkerboard packings, the
 *     pixel width will be doubled. For row interleaved and top-bottom
 *     encodings, pixel height will be doubled.
 * @GST_VIDEO_MULTIVIEW_FLAGS_MIXED_MONO: The video stream contains both
 *     mono and multiview portions, signalled on each buffer by the
 *     absence or presence of the @GST_VIDEO_BUFFER_FLAG_MULTIPLE_VIEW
 *     buffer flag.
 *
 * GstVideoMultiviewFlags are used to indicate extra properties of a
 * stereo/multiview stream beyond the frame layout and buffer mapping
 * that is conveyed in the #GstVideoMultiviewMode.
  }
type
  PGstVideoMultiviewFlags = ^TGstVideoMultiviewFlags;
  TGstVideoMultiviewFlags =  Longint;
  Const
    GST_VIDEO_MULTIVIEW_FLAGS_NONE = 0;
    GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_VIEW_FIRST = 1 shl 0;
    GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLIPPED = 1 shl 1;
    GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLOPPED = 1 shl 2;
    GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLIPPED = 1 shl 3;
    GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLOPPED = 1 shl 4;
    GST_VIDEO_MULTIVIEW_FLAGS_HALF_ASPECT = 1 shl 14;
    GST_VIDEO_MULTIVIEW_FLAGS_MIXED_MONO = 1 shl 15;
;
{*
 * GstVideoFlags:
 * @GST_VIDEO_FLAG_NONE: no flags
 * @GST_VIDEO_FLAG_VARIABLE_FPS: a variable fps is selected, fps_n and fps_d
 *     denote the maximum fps of the video
 * @GST_VIDEO_FLAG_PREMULTIPLIED_ALPHA: Each color has been scaled by the alpha
 *     value.
 *
 * Extra video flags
  }
type
  PGstVideoFlags = ^TGstVideoFlags;
  TGstVideoFlags =  Longint;
  Const
    GST_VIDEO_FLAG_NONE = 0;
    GST_VIDEO_FLAG_VARIABLE_FPS = 1 shl 0;
    GST_VIDEO_FLAG_PREMULTIPLIED_ALPHA = 1 shl 1;
;
{*
 * GstVideoFieldOrder:
 * @GST_VIDEO_FIELD_ORDER_UNKNOWN: unknown field order for interlaced content.
 *     The actual field order is signalled via buffer flags.
 * @GST_VIDEO_FIELD_ORDER_TOP_FIELD_FIRST: top field is first
 * @GST_VIDEO_FIELD_ORDER_BOTTOM_FIELD_FIRST: bottom field is first
 *
 * Field order of interlaced content. This is only valid for
 * interlace-mode=interleaved and not interlace-mode=mixed. In the case of
 * mixed or GST_VIDEO_FIELD_ORDER_UNKOWN, the field order is signalled via
 * buffer flags.
 *
 * Since: 1.12
  }
type
  PGstVideoFieldOrder = ^TGstVideoFieldOrder;
  TGstVideoFieldOrder =  Longint;
  Const
    GST_VIDEO_FIELD_ORDER_UNKNOWN = 0;
    GST_VIDEO_FIELD_ORDER_TOP_FIELD_FIRST = 1;
    GST_VIDEO_FIELD_ORDER_BOTTOM_FIELD_FIRST = 2;
;
(* Const before type ignored *)

function gst_video_field_order_to_string(order:TGstVideoFieldOrder):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_video_field_order_from_string(order:Pgchar):TGstVideoFieldOrder;cdecl;external;
{*
 * GstVideoInfo:
 * @finfo: the format info of the video
 * @interlace_mode: the interlace mode
 * @flags: additional video flags
 * @width: the width of the video
 * @height: the height of the video
 * @views: the number of views for multiview video
 * @size: the default size of one frame
 * @chroma_site: a #GstVideoChromaSite.
 * @colorimetry: the colorimetry info
 * @par_n: the pixel-aspect-ratio numerator
 * @par_d: the pixel-aspect-ratio denominator
 * @fps_n: the framerate numerator
 * @fps_d: the framerate denominator
 * @offset: offsets of the planes
 * @stride: strides of the planes
 * @multiview_mode: delivery mode for multiple views. (Since: 1.6)
 * @multiview_flags: flags for multiple views configuration (Since: 1.6)
 *
 * Information describing image properties. This information can be filled
 * in from GstCaps with gst_video_info_from_caps(). The information is also used
 * to store the specific video info when mapping a video frame with
 * gst_video_frame_map().
 *
 * Use the provided macros to access the info in this structure.
  }
(* Const before type ignored *)
{ Union preserves padded struct size for backwards compat
   * Consumer code should use the accessor macros for fields  }
{ < skip >  }
{< private > }
type
  PGstVideoInfo = ^TGstVideoInfo;
  TGstVideoInfo = record
      finfo : PGstVideoFormatInfo;
      interlace_mode : TGstVideoInterlaceMode;
      flags : TGstVideoFlags;
      width : Tgint;
      height : Tgint;
      size : Tgsize;
      views : Tgint;
      chroma_site : TGstVideoChromaSite;
      colorimetry : TGstVideoColorimetry;
      par_n : Tgint;
      par_d : Tgint;
      fps_n : Tgint;
      fps_d : Tgint;
      offset : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize;
      stride : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgint;
      ABI : record
          case longint of
            0 : ( abi : record
                multiview_mode : TGstVideoMultiviewMode;
                multiview_flags : TGstVideoMultiviewFlags;
                field_order : TGstVideoFieldOrder;
              end );
            1 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
          end;
    end;


{ was #define dname def_expr }
function GST_TYPE_VIDEO_INFO : longint; { return type might be wrong }

function gst_video_info_get_type:TGType;cdecl;external;
{ general info  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FORMAT(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_NAME(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_YUV(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_RGB(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_GRAY(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_HAS_ALPHA(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_INTERLACE_MODE(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_INTERLACED(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_ORDER(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FLAGS(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_WIDTH(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_HEIGHT(i : longint) : longint;

{*
 * GST_VIDEO_INFO_FIELD_HEIGHT:
 *
 * The height of a field. It's the height of the full frame unless split-field
 * (alternate) interlacing is in use.
 *
 * Since: 1.16.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_HEIGHT(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_SIZE(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_VIEWS(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PAR_N(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PAR_D(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FPS_N(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_RATE_N(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FPS_D(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COLORIMETRY(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_CHROMA_SITE(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_MULTIVIEW_MODE(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_MULTIVIEW_FLAGS(i : longint) : longint;

{ dealing with GstVideoInfo flags  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FLAG_IS_SET(i,flag : longint) : longint;

{xxxx#define GST_VIDEO_INFO_FLAG_SET(i,flag)    (GST_VIDEO_INFO_FLAGS(i) |= (flag)) }
{#define GST_VIDEO_INFO_FLAG_UNSET(i,flag)  (GST_VIDEO_INFO_FLAGS(i) &= ~(flag)) }
{ dealing with planes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_N_PLANES(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_OFFSET(i,p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_STRIDE(i,p : longint) : longint;

{*
 * GST_VIDEO_INFO_PLANE_HEIGHT:
 *
 * The padded height in pixels of a plane (padded size divided by the plane stride).
 * In case of GST_VIDEO_INTERLACE_MODE_ALTERNATE info, this macro returns the
 * plane heights used to hold a single field, not the full frame.
 *
 * The size passed as third argument is the size of the pixel data and should
 * not contain any extra metadata padding.
 *
 * It is not valid to use this macro with a TILED format.
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_HEIGHT(i,p,sizes : longint) : longint;

{ dealing with components  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_N_COMPONENTS(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_DEPTH(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_DATA(i,d,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_OFFSET(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_STRIDE(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_WIDTH(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_HEIGHT(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_PLANE(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_PSTRIDE(i,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_POFFSET(i,c : longint) : longint;

function gst_video_info_new:PGstVideoInfo;cdecl;external;
procedure gst_video_info_init(info:PGstVideoInfo);cdecl;external;
(* Const before type ignored *)
function gst_video_info_copy(info:PGstVideoInfo):PGstVideoInfo;cdecl;external;
procedure gst_video_info_free(info:PGstVideoInfo);cdecl;external;
(* Const before type ignored *)
function gst_video_info_new_from_caps(caps:PGstCaps):PGstVideoInfo;cdecl;external;
function gst_video_info_set_format(info:PGstVideoInfo; format:TGstVideoFormat; width:Tguint; height:Tguint):Tgboolean;cdecl;external;
function gst_video_info_set_interlaced_format(info:PGstVideoInfo; format:TGstVideoFormat; mode:TGstVideoInterlaceMode; width:Tguint; height:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_info_from_caps(info:PGstVideoInfo; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_info_to_caps(info:PGstVideoInfo):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_video_info_convert(info:PGstVideoInfo; src_format:TGstFormat; src_value:Tgint64; dest_format:TGstFormat; dest_value:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_info_is_equal(info:PGstVideoInfo; other:PGstVideoInfo):Tgboolean;cdecl;external;
{$include <gst/video/video.h>}

function gst_video_info_align(info:PGstVideoInfo; align:PGstVideoAlignment):Tgboolean;cdecl;external;
function gst_video_info_align_full(info:PGstVideoInfo; align:PGstVideoAlignment; plane_size:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize):Tgboolean;cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoInfo, gst_video_info_free) }
{$endif}
{ __GST_VIDEO_INFO_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_INFO:=gst_video_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FORMAT(i : longint) : longint;
begin
  GST_VIDEO_INFO_FORMAT:=GST_VIDEO_FORMAT_INFO_FORMAT(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_NAME(i : longint) : longint;
begin
  GST_VIDEO_INFO_NAME:=GST_VIDEO_FORMAT_INFO_NAME(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_YUV(i : longint) : longint;
begin
  GST_VIDEO_INFO_IS_YUV:=GST_VIDEO_FORMAT_INFO_IS_YUV(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_RGB(i : longint) : longint;
begin
  GST_VIDEO_INFO_IS_RGB:=GST_VIDEO_FORMAT_INFO_IS_RGB(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_GRAY(i : longint) : longint;
begin
  GST_VIDEO_INFO_IS_GRAY:=GST_VIDEO_FORMAT_INFO_IS_GRAY(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_HAS_ALPHA(i : longint) : longint;
begin
  GST_VIDEO_INFO_HAS_ALPHA:=GST_VIDEO_FORMAT_INFO_HAS_ALPHA(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_INTERLACE_MODE(i : longint) : longint;
begin
  GST_VIDEO_INFO_INTERLACE_MODE:=i^.interlace_mode;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_IS_INTERLACED(i : longint) : longint;
begin
  GST_VIDEO_INFO_IS_INTERLACED:=(i^.interlace_mode)<>GST_VIDEO_INTERLACE_MODE_PROGRESSIVE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_ORDER(i : longint) : longint;
begin
  GST_VIDEO_INFO_FIELD_ORDER:=i^.(ABI.(abi.field_order));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FLAGS(i : longint) : longint;
begin
  GST_VIDEO_INFO_FLAGS:=i^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_WIDTH(i : longint) : longint;
begin
  GST_VIDEO_INFO_WIDTH:=i^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_HEIGHT(i : longint) : longint;
begin
  GST_VIDEO_INFO_HEIGHT:=i^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_HEIGHT(i : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if GST_VIDEO_INTERLACE_MODE_ALTERNATE then
    if_local1:=(GST_ROUND_UP_2(i^.height))/2
  else
    if_local1:=i^.height;
  GST_VIDEO_INFO_FIELD_HEIGHT:=(i^.interlace_mode)=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_SIZE(i : longint) : longint;
begin
  GST_VIDEO_INFO_SIZE:=i^.size;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_VIEWS(i : longint) : longint;
begin
  GST_VIDEO_INFO_VIEWS:=i^.views;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PAR_N(i : longint) : longint;
begin
  GST_VIDEO_INFO_PAR_N:=i^.par_n;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PAR_D(i : longint) : longint;
begin
  GST_VIDEO_INFO_PAR_D:=i^.par_d;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FPS_N(i : longint) : longint;
begin
  GST_VIDEO_INFO_FPS_N:=i^.fps_n;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FIELD_RATE_N(i : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (GST_VIDEO_INFO_INTERLACE_MODE(i))=GST_VIDEO_INTERLACE_MODE_ALTERNATE then
    if_local1:=(i^.fps_n)*2
  else
    if_local1:=i^.fps_n;
  GST_VIDEO_INFO_FIELD_RATE_N:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FPS_D(i : longint) : longint;
begin
  GST_VIDEO_INFO_FPS_D:=i^.fps_d;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COLORIMETRY(i : longint) : longint;
begin
  GST_VIDEO_INFO_COLORIMETRY:=i^.colorimetry;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_CHROMA_SITE(i : longint) : longint;
begin
  GST_VIDEO_INFO_CHROMA_SITE:=i^.chroma_site;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_MULTIVIEW_MODE(i : longint) : longint;
begin
  GST_VIDEO_INFO_MULTIVIEW_MODE:=i^.(ABI.(abi.multiview_mode));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_MULTIVIEW_FLAGS(i : longint) : longint;
begin
  GST_VIDEO_INFO_MULTIVIEW_FLAGS:=i^.(ABI.(abi.multiview_flags));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_FLAG_IS_SET(i,flag : longint) : longint;
begin
  GST_VIDEO_INFO_FLAG_IS_SET:=((GST_VIDEO_INFO_FLAGS(i)) and flag)=flag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_N_PLANES(i : longint) : longint;
begin
  GST_VIDEO_INFO_N_PLANES:=GST_VIDEO_FORMAT_INFO_N_PLANES(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_OFFSET(i,p : longint) : longint;
begin
  GST_VIDEO_INFO_PLANE_OFFSET:=i^.(offset[p]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_STRIDE(i,p : longint) : longint;
begin
  GST_VIDEO_INFO_PLANE_STRIDE:=i^.(stride[p]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_PLANE_HEIGHT(i,p,sizes : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=0
  else
    if_local1:=(sizes[p])/(i^.(stride[p]));
  GST_VIDEO_INFO_PLANE_HEIGHT:=(i^.(stride[p]))=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_N_COMPONENTS(i : longint) : longint;
begin
  GST_VIDEO_INFO_N_COMPONENTS:=GST_VIDEO_FORMAT_INFO_N_COMPONENTS(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_DEPTH(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_DEPTH:=GST_VIDEO_FORMAT_INFO_DEPTH(i^.finfo,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_DATA(i,d,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_DATA:=GST_VIDEO_FORMAT_INFO_DATA(i^.finfo,d,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_OFFSET(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_OFFSET:=GST_VIDEO_FORMAT_INFO_OFFSET(i^.finfo,i^.offset,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_STRIDE(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_STRIDE:=GST_VIDEO_FORMAT_INFO_STRIDE(i^.finfo,i^.stride,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_WIDTH(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_WIDTH:=GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(i^.finfo,c,i^.width);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_HEIGHT(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_HEIGHT:=GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(i^.finfo,c,GST_VIDEO_INFO_FIELD_HEIGHT(i));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_PLANE(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_PLANE:=GST_VIDEO_FORMAT_INFO_PLANE(i^.finfo,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_PSTRIDE(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_PSTRIDE:=GST_VIDEO_FORMAT_INFO_PSTRIDE(i^.finfo,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_INFO_COMP_POFFSET(i,c : longint) : longint;
begin
  GST_VIDEO_INFO_COMP_POFFSET:=GST_VIDEO_FORMAT_INFO_POFFSET(i^.finfo,c);
end;


end.
