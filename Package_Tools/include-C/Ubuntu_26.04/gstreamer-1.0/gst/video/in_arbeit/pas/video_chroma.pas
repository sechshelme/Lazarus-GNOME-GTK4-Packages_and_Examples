unit video_chroma;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2013> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_CHROMA_H__}
{$define __GST_VIDEO_CHROMA_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{*
 * GstVideoChromaSite:
 * @GST_VIDEO_CHROMA_SITE_UNKNOWN: unknown cositing
 * @GST_VIDEO_CHROMA_SITE_NONE: no cositing
 * @GST_VIDEO_CHROMA_SITE_H_COSITED: chroma is horizontally cosited
 * @GST_VIDEO_CHROMA_SITE_V_COSITED: chroma is vertically cosited
 * @GST_VIDEO_CHROMA_SITE_ALT_LINE: chroma samples are sited on alternate lines
 * @GST_VIDEO_CHROMA_SITE_COSITED: chroma samples cosited with luma samples
 * @GST_VIDEO_CHROMA_SITE_JPEG: jpeg style cositing, also for mpeg1 and mjpeg
 * @GST_VIDEO_CHROMA_SITE_MPEG2: mpeg2 style cositing
 * @GST_VIDEO_CHROMA_SITE_DV: DV style cositing
 *
 * Various Chroma sitings.
  }
{ some common chroma cositing  }
type
  PGstVideoChromaSite = ^TGstVideoChromaSite;
  TGstVideoChromaSite =  Longint;
  Const
    GST_VIDEO_CHROMA_SITE_UNKNOWN = 0;
    GST_VIDEO_CHROMA_SITE_NONE = 1 shl 0;
    GST_VIDEO_CHROMA_SITE_H_COSITED = 1 shl 1;
    GST_VIDEO_CHROMA_SITE_V_COSITED = 1 shl 2;
    GST_VIDEO_CHROMA_SITE_ALT_LINE = 1 shl 3;
    GST_VIDEO_CHROMA_SITE_COSITED = GST_VIDEO_CHROMA_SITE_H_COSITED or GST_VIDEO_CHROMA_SITE_V_COSITED;
    GST_VIDEO_CHROMA_SITE_JPEG = GST_VIDEO_CHROMA_SITE_NONE;
    GST_VIDEO_CHROMA_SITE_MPEG2 = GST_VIDEO_CHROMA_SITE_H_COSITED;
    GST_VIDEO_CHROMA_SITE_DV = GST_VIDEO_CHROMA_SITE_COSITED or GST_VIDEO_CHROMA_SITE_ALT_LINE;
;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_video_chroma_site_from_string) }

function gst_video_chroma_from_string(s:Pgchar):TGstVideoChromaSite;cdecl;external libgstvideo;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_video_chroma_site_to_string) }
function gst_video_chroma_to_string(site:TGstVideoChromaSite):Pgchar;cdecl;external libgstvideo;
function gst_video_chroma_site_from_string(s:Pgchar):TGstVideoChromaSite;cdecl;external libgstvideo;
function gst_video_chroma_site_to_string(site:TGstVideoChromaSite):Pgchar;cdecl;external libgstvideo;
{*
 * GstVideoChromaMethod:
 * @GST_VIDEO_CHROMA_METHOD_NEAREST: Duplicates the chroma samples when
 *    upsampling and drops when subsampling
 * @GST_VIDEO_CHROMA_METHOD_LINEAR: Uses linear interpolation to reconstruct
 *    missing chroma and averaging to subsample
 *
 * Different subsampling and upsampling methods
  }
type
  PGstVideoChromaMethod = ^TGstVideoChromaMethod;
  TGstVideoChromaMethod =  Longint;
  Const
    GST_VIDEO_CHROMA_METHOD_NEAREST = 0;
    GST_VIDEO_CHROMA_METHOD_LINEAR = 1;
;
{*
 * GstVideoChromaFlags:
 * @GST_VIDEO_CHROMA_FLAG_NONE: no flags
 * @GST_VIDEO_CHROMA_FLAG_INTERLACED: the input is interlaced
 *
 * Extra flags that influence the result from gst_video_chroma_resample_new().
  }
type
  PGstVideoChromaFlags = ^TGstVideoChromaFlags;
  TGstVideoChromaFlags =  Longint;
  Const
    GST_VIDEO_CHROMA_FLAG_NONE = 0;
    GST_VIDEO_CHROMA_FLAG_INTERLACED = 1 shl 0;
;
type
{ circular dependency, need to include this after defining the enums  }
{$include <gst/video/video-format.h>}

function gst_video_chroma_resample_new(method:TGstVideoChromaMethod; site:TGstVideoChromaSite; flags:TGstVideoChromaFlags; format:TGstVideoFormat; h_factor:Tgint; 
           v_factor:Tgint):PGstVideoChromaResample;cdecl;external libgstvideo;
procedure gst_video_chroma_resample_free(resample:PGstVideoChromaResample);cdecl;external libgstvideo;
procedure gst_video_chroma_resample_get_info(resample:PGstVideoChromaResample; n_lines:Pguint; offset:Pgint);cdecl;external libgstvideo;
procedure gst_video_chroma_resample(resample:PGstVideoChromaResample; lines:Pgpointer; width:Tgint);cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_CHROMA_H__  }

// === Konventiert am: 15-7-26 13:29:39 ===


implementation



end.
