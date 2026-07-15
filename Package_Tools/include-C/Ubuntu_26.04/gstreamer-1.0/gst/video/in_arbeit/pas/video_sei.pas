unit video_sei;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2021> Fluendo S.A. <contact@fluendo.com>
 *   Authors: Andoni Morales Alastruey <amorales@fluendo.com>
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
{$ifndef __GST_VIDEO_SEI_USER_DATA_UNREGISTERED_H__}
{$define __GST_VIDEO_SEI_USER_DATA_UNREGISTERED_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{ xxxxxxxxxxx
static const guint8 H264_MISP_MICROSECTIME[] = 
  0x4D, 0x49, 0x53, 0x50, 0x6D, 0x69, 0x63, 0x72,
  0x6F, 0x73, 0x65, 0x63, 0x74, 0x69, 0x6D, 0x65
;

static const guint8 H265_MISP_MICROSECONDS[] = 
  0xA8, 0x68, 0x7D, 0xD4, 0xD7, 0x59, 0x37, 0x58,
  0xA5, 0xCE, 0xF0, 0x33, 0x8B, 0x65, 0x45, 0xF1
;

static const guint8 H265_MISP_NANOSECONDS[] = 
  0xCF, 0x84, 0x82, 0x78, 0xEE, 0x23, 0x30, 0x6C,
  0x92, 0x65, 0xE8, 0xFE, 0xF2, 0x2F, 0xB8, 0xB8
;

  }
type
  PGstVideoSEIUserDataUnregisteredMeta = ^TGstVideoSEIUserDataUnregisteredMeta;
  TGstVideoSEIUserDataUnregisteredMeta = record
      meta : TGstMeta;
      uuid : array[0..15] of Tguint8;
      data : Pguint8;
      size : Tgsize;
    end;

function gst_video_sei_user_data_unregistered_meta_api_get_type:TGType;cdecl;external libgstvideo;
{*
 * GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE:
 *
 * Since: 1.22
  }
{ was #define dname def_expr }
function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE : longint; { return type might be wrong }

function gst_video_sei_user_data_unregistered_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{*
 * GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO:
 *
 * Since: 1.22
  }
{ was #define dname def_expr }
function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO : longint; { return type might be wrong }

{*
 * gst_buffer_get_video_sei_user_data_unregistered_meta:
 * @b: A #GstBuffer
 *
 * Gets the GstVideoSEIUserDataUnregisteredMeta that might be present on @b.
 *
 * Returns: (nullable): The first #GstVideoSEIUserDataUnregisteredMeta present on @b, or %NULL if
 * no #GstVideoSEIUserDataUnregisteredMeta are present
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_sei_user_data_unregistered_meta(b : longint) : PGstVideoSEIUserDataUnregisteredMeta;

function gst_buffer_add_video_sei_user_data_unregistered_meta(buffer:PGstBuffer; uuid:array[0..15] of Tguint8; data:Pguint8; size:Tgsize):PGstVideoSEIUserDataUnregisteredMeta;cdecl;external libgstvideo;
function gst_video_sei_user_data_unregistered_parse_precision_time_stamp(user_data:PGstVideoSEIUserDataUnregisteredMeta; status:Pguint8; precision_time_stamp:Pguint64):Tgboolean;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_SEI_USER_DATA_UNREGISTERED_H__  }

// === Konventiert am: 15-7-26 13:39:03 ===


implementation


{ was #define dname def_expr }
function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE:=gst_video_sei_user_data_unregistered_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO:=gst_video_sei_user_data_unregistered_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_sei_user_data_unregistered_meta(b : longint) : PGstVideoSEIUserDataUnregisteredMeta;
begin
  gst_buffer_get_video_sei_user_data_unregistered_meta:=PGstVideoSEIUserDataUnregisteredMeta(gst_buffer_get_meta(b,GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE));
end;


end.
