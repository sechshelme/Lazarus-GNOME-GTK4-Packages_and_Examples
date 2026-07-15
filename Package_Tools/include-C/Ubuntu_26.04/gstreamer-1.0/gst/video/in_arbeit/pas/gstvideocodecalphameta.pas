unit gstvideocodecalphameta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2021 Collabora Ltd.
 *   Author: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
{$ifndef __GST_VIDEO_CODEC_ALPHA_META_H__}
{$define __GST_VIDEO_CODEC_ALPHA_META_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{*
 * GST_VIDEO_CODEC_ALPHA_META_API_TYPE:
 *
 * Since: 1.20
  }

{ was #define dname def_expr }
function GST_VIDEO_CODEC_ALPHA_META_API_TYPE : longint; { return type might be wrong }

{*
 * GST_VIDEO_CODEC_ALPHA_META_INFO:
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_VIDEO_CODEC_ALPHA_META_INFO : longint; { return type might be wrong }

type
{*
 * GstVideoCodecAlphaMeta:
 * @meta: parent #GstMeta
 * @buffer: the encoded alpha frame
 *
 * Encapsulate an extra frame containing the encoded alpha channel for the
 * currently negotiated CODEC. The streams must be of the same dimention as
 * the original one.
 *
 * Since: 1.20
  }
  PGstVideoCodecAlphaMeta = ^TGstVideoCodecAlphaMeta;
  TGstVideoCodecAlphaMeta = record
      meta : TGstMeta;
      buffer : PGstBuffer;
    end;


function gst_video_codec_alpha_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_codec_alpha_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{*
 * gst_buffer_get_video_codec_alpha_meta:
 * @b: A #GstBuffer pointer, must be writable.
 *
 * Helper macro to get #GstVideoCodecAlphaMeta from an existing #GstBuffer.
 *
 * Returns: (nullable): the #GstVideoCodecAlphaMeta pointer, or %NULL if none.
 *
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_codec_alpha_meta(b : longint) : PGstVideoCodecAlphaMeta;

function gst_buffer_add_video_codec_alpha_meta(buffer:PGstBuffer; alpha_buffer:PGstBuffer):PGstVideoCodecAlphaMeta;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_CODEC_ALPHA_META_H__  }

// === Konventiert am: 15-7-26 13:21:49 ===


implementation


{ was #define dname def_expr }
function GST_VIDEO_CODEC_ALPHA_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_CODEC_ALPHA_META_API_TYPE:=gst_video_codec_alpha_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_CODEC_ALPHA_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_CODEC_ALPHA_META_INFO:=gst_video_codec_alpha_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_codec_alpha_meta(b : longint) : PGstVideoCodecAlphaMeta;
begin
  gst_buffer_get_video_codec_alpha_meta:=PGstVideoCodecAlphaMeta(gst_buffer_get_meta(b,GST_VIDEO_CODEC_ALPHA_META_API_TYPE));
end;


end.
