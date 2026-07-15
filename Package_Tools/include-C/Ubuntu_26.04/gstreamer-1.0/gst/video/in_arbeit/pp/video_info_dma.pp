
unit video_info_dma;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_info_dma.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_info_dma.h
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
PGstCaps  = ^GstCaps;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoInfoDmaDrm  = ^GstVideoInfoDmaDrm;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2022 Intel Corporation
 *     Author: He Junyan <junyan.he@intel.com>
 *     Author: Liu Yinhang <yinhang.liu@intel.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/video/video-info.h>}
{*
 * GST_VIDEO_DMA_DRM_CAPS_MAKE:
 *
 * Generic caps string for video wit DMABuf(GST_CAPS_FEATURE_MEMORY_DMABUF)
 * feature, for use in pad templates. As drm-format is supposed to be defined
 * at run-time it's not predefined here.
 *
 * Since: 1.24
  }
type
{*
 * GstVideoInfoDmaDrm:
 * @vinfo: the associated #GstVideoInfo
 * @drm_fourcc: the fourcc defined by drm
 * @drm_modifier: the drm modifier
 *
 * Information describing a DMABuf image properties. It wraps #GstVideoInfo and
 * adds DRM information such as drm-fourcc and drm-modifier, required for
 * negotiation and mapping.
 *
 * Since: 1.24
  }
{< private > }
  PGstVideoInfoDmaDrm = ^TGstVideoInfoDmaDrm;
  TGstVideoInfoDmaDrm = record
      vinfo : TGstVideoInfo;
      drm_fourcc : Tguint32;
      drm_modifier : Tguint64;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tguint32;
    end;


{ was #define dname def_expr }
function GST_TYPE_VIDEO_INFO_DMA_DRM : longint; { return type might be wrong }

function gst_video_info_dma_drm_get_type:TGType;cdecl;external;
procedure gst_video_info_dma_drm_free(drm_info:PGstVideoInfoDmaDrm);cdecl;external;
procedure gst_video_info_dma_drm_init(drm_info:PGstVideoInfoDmaDrm);cdecl;external;
function gst_video_info_dma_drm_new:PGstVideoInfoDmaDrm;cdecl;external;
(* Const before type ignored *)
function gst_video_info_dma_drm_to_caps(drm_info:PGstVideoInfoDmaDrm):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_video_info_dma_drm_from_caps(drm_info:PGstVideoInfoDmaDrm; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_info_dma_drm_from_video_info(drm_info:PGstVideoInfoDmaDrm; info:PGstVideoInfo; modifier:Tguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_info_dma_drm_to_video_info(drm_info:PGstVideoInfoDmaDrm; info:PGstVideoInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_info_dma_drm_new_from_caps(caps:PGstCaps):PGstVideoInfoDmaDrm;cdecl;external;
(* Const before type ignored *)
function gst_video_is_dma_drm_caps(caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_dma_drm_fourcc_from_string(format_str:Pgchar; modifier:Pguint64):Tguint32;cdecl;external;
function gst_video_dma_drm_fourcc_to_string(fourcc:Tguint32; modifier:Tguint64):Pgchar;cdecl;external;
function gst_video_dma_drm_fourcc_from_format(format:TGstVideoFormat):Tguint32;cdecl;external;
function gst_video_dma_drm_format_from_gst_format(format:TGstVideoFormat; modifier:Pguint64):Tguint32;cdecl;external;
function gst_video_dma_drm_fourcc_to_format(fourcc:Tguint32):TGstVideoFormat;cdecl;external;
function gst_video_dma_drm_format_to_gst_format(fourcc:Tguint32; modifier:Tguint64):TGstVideoFormat;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_INFO_DMA_DRM : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_INFO_DMA_DRM:=gst_video_info_dma_drm_get_type;
  end;


end.
