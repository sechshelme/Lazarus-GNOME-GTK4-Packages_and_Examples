
unit video_scaler;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_scaler.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_scaler.h
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
Pgdouble  = ^gdouble;
Pgpointer  = ^gpointer;
PGstStructure  = ^GstStructure;
PGstVideoScaler  = ^GstVideoScaler;
PGstVideoScalerFlags  = ^GstVideoScalerFlags;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2014> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_SCALER_H__}
{$define __GST_VIDEO_SCALER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-format.h>}
{$include <gst/video/video-color.h>}
{$include <gst/video/video-resampler.h>}
{*
 * GST_VIDEO_SCALER_OPT_DITHER_METHOD:
 *
 * #GstVideoDitherMethod, The dither method to use for propagating
 * quatization errors.
  }

const
  GST_VIDEO_SCALER_OPT_DITHER_METHOD = 'GstVideoScaler.dither-method';  
{*
 * GstVideoScalerFlags:
 * @GST_VIDEO_SCALER_FLAG_NONE: no flags
 * @GST_VIDEO_SCALER_FLAG_INTERLACED: Set up a scaler for interlaced content
 *
 * Different scale flags.
  }
type
  PGstVideoScalerFlags = ^TGstVideoScalerFlags;
  TGstVideoScalerFlags =  Longint;
  Const
    GST_VIDEO_SCALER_FLAG_NONE = 0;
    GST_VIDEO_SCALER_FLAG_INTERLACED = 1 shl 0;
;
type

function gst_video_scaler_new(method:TGstVideoResamplerMethod; flags:TGstVideoScalerFlags; n_taps:Tguint; in_size:Tguint; out_size:Tguint; 
           options:PGstStructure):PGstVideoScaler;cdecl;external;
procedure gst_video_scaler_free(scale:PGstVideoScaler);cdecl;external;
function gst_video_scaler_get_max_taps(scale:PGstVideoScaler):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_video_scaler_get_coeff(scale:PGstVideoScaler; out_offset:Tguint; in_offset:Pguint; n_taps:Pguint):Pgdouble;cdecl;external;
procedure gst_video_scaler_horizontal(scale:PGstVideoScaler; format:TGstVideoFormat; src:Tgpointer; dest:Tgpointer; dest_offset:Tguint; 
            width:Tguint);cdecl;external;
procedure gst_video_scaler_vertical(scale:PGstVideoScaler; format:TGstVideoFormat; src_lines:Pgpointer; dest:Tgpointer; dest_offset:Tguint; 
            width:Tguint);cdecl;external;
function gst_video_scaler_combine_packed_YUV(y_scale:PGstVideoScaler; uv_scale:PGstVideoScaler; in_format:TGstVideoFormat; out_format:TGstVideoFormat):PGstVideoScaler;cdecl;external;
procedure gst_video_scaler_2d(hscale:PGstVideoScaler; vscale:PGstVideoScaler; format:TGstVideoFormat; src:Tgpointer; src_stride:Tgint; 
            dest:Tgpointer; dest_stride:Tgint; x:Tguint; y:Tguint; width:Tguint; 
            height:Tguint);cdecl;external;
{$endif}
{ __GST_VIDEO_SCALER_H__  }

implementation


end.
