
unit video_dither;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_dither.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_dither.h
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
PGstVideoDither  = ^GstVideoDither;
PGstVideoDitherFlags  = ^GstVideoDitherFlags;
PGstVideoDitherMethod  = ^GstVideoDitherMethod;
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
{$ifndef __GST_VIDEO_DITHER_H__}
{$define __GST_VIDEO_DITHER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{*
 * GstVideoDitherMethod:
 * @GST_VIDEO_DITHER_NONE: no dithering
 * @GST_VIDEO_DITHER_VERTERR: propagate rounding errors downwards
 * @GST_VIDEO_DITHER_FLOYD_STEINBERG: Dither with floyd-steinberg error diffusion
 * @GST_VIDEO_DITHER_SIERRA_LITE: Dither with Sierra Lite error diffusion
 * @GST_VIDEO_DITHER_BAYER: ordered dither using a bayer pattern
 *
 * Different dithering methods to use.
  }
type
  PGstVideoDitherMethod = ^TGstVideoDitherMethod;
  TGstVideoDitherMethod =  Longint;
  Const
    GST_VIDEO_DITHER_NONE = 0;
    GST_VIDEO_DITHER_VERTERR = 1;
    GST_VIDEO_DITHER_FLOYD_STEINBERG = 2;
    GST_VIDEO_DITHER_SIERRA_LITE = 3;
    GST_VIDEO_DITHER_BAYER = 4;
;
{*
 * GstVideoDitherFlags:
 * @GST_VIDEO_DITHER_FLAG_NONE: no flags
 * @GST_VIDEO_DITHER_FLAG_INTERLACED: the input is interlaced
 * @GST_VIDEO_DITHER_FLAG_QUANTIZE: quantize values in addition to adding dither.
 *
 * Extra flags that influence the result from gst_video_chroma_resample_new().
  }
type
  PGstVideoDitherFlags = ^TGstVideoDitherFlags;
  TGstVideoDitherFlags =  Longint;
  Const
    GST_VIDEO_DITHER_FLAG_NONE = 0;
    GST_VIDEO_DITHER_FLAG_INTERLACED = 1 shl 0;
    GST_VIDEO_DITHER_FLAG_QUANTIZE = 1 shl 1;
;
type
{ circular dependency, need to include this after defining the enums  }
{$include <gst/video/video-format.h>}

function gst_video_dither_new(method:TGstVideoDitherMethod; flags:TGstVideoDitherFlags; format:TGstVideoFormat; quantizer:array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint; width:Tguint):PGstVideoDither;cdecl;external;
procedure gst_video_dither_free(dither:PGstVideoDither);cdecl;external;
procedure gst_video_dither_line(dither:PGstVideoDither; line:Tgpointer; x:Tguint; y:Tguint; width:Tguint);cdecl;external;
{$endif}
{ __GST_VIDEO_DITHER_H__  }

implementation


end.
