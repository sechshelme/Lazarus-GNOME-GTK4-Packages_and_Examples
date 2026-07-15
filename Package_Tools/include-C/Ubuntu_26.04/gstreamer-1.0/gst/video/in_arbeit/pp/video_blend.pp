
unit video_blend;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_blend.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_blend.h
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
PGstBuffer  = ^GstBuffer;
PGstVideoFrame  = ^GstVideoFrame;
PGstVideoInfo  = ^GstVideoInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer video blending utility functions
 *
 * Copyright (C) <2011> Intel Corporation
 * Copyright (C) <2011> Collabora Ltd.
 * Copyright (C) <2011> Thibault Saunier <thibault.saunier@collabora.com>
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
{$ifndef  __GST_VIDEO_BLEND__}
{$define __GST_VIDEO_BLEND__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}

procedure gst_video_blend_scale_linear_RGBA(src:PGstVideoInfo; src_buffer:PGstBuffer; dest_height:Tgint; dest_width:Tgint; dest:PGstVideoInfo; 
            dest_buffer:PPGstBuffer);cdecl;external;
function gst_video_blend(dest:PGstVideoFrame; src:PGstVideoFrame; x:Tgint; y:Tgint; global_alpha:Tgfloat):Tgboolean;cdecl;external;
{$endif}

implementation


end.
