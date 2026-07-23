
unit codec_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from codec_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    codec_utils.h
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
Pgint16  = ^gint16;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
Pguint16  = ^guint16;
Pguint32  = ^guint32;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer base utils library codec-specific utility functions
 * Copyright (C) 2010 Arun Raghavan <arun.raghavan@collabora.co.uk>
 *               2010 Collabora Multimedia
 *               2010 Nokia Corporation
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
{$ifndef __GST_PB_UTILS_CODEC_UTILS_H__}
{$define __GST_PB_UTILS_CODEC_UTILS_H__}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-prelude.h>}
{ AAC  }

function gst_codec_utils_aac_get_sample_rate_from_index(sr_idx:Tguint):Tguint;cdecl;external;
function gst_codec_utils_aac_get_index_from_sample_rate(rate:Tguint):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_aac_get_profile(audio_config:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_aac_get_level(audio_config:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_aac_get_sample_rate(audio_config:Pguint8; len:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_aac_get_channels(audio_config:Pguint8; len:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_aac_caps_set_level_and_profile(caps:PGstCaps; audio_config:Pguint8; len:Tguint):Tgboolean;cdecl;external;
{ H.264  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h264_get_profile(sps:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h264_get_level(sps:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h264_get_level_idc(level:Pgchar):Tguint8;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h264_caps_set_level_and_profile(caps:PGstCaps; sps:Pguint8; len:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h264_get_profile_flags_level(codec_data:Pguint8; len:Tguint; profile:Pguint8; flags:Pguint8; level:Pguint8):Tgboolean;cdecl;external;
{ H.265  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h265_get_profile(profile_tier_level:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h265_get_tier(profile_tier_level:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h265_get_level(profile_tier_level:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h265_get_level_idc(level:Pgchar):Tguint8;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h265_caps_set_level_tier_and_profile(caps:PGstCaps; profile_tier_level:Pguint8; len:Tguint):Tgboolean;cdecl;external;
{ H.266  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h266_get_profile(ptl_record:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h266_get_tier(ptl_record:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_h266_get_level(ptl_record:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h266_get_level_idc(level:Pgchar):Tguint8;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_h266_caps_set_level_tier_and_profile(caps:PGstCaps; decoder_configuration:Pguint8; len:Tguint):Tgboolean;cdecl;external;
{ AV1  }
(* Const before type ignored *)
function gst_codec_utils_av1_get_seq_level_idx(level:Pgchar):Tguint8;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_av1_get_level(seq_level_idx:Tguint8):Pgchar;cdecl;external;
{ MPEG-4 part 2  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_mpeg4video_get_profile(vis_obj_seq:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_codec_utils_mpeg4video_get_level(vis_obj_seq:Pguint8; len:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_mpeg4video_caps_set_level_and_profile(caps:PGstCaps; vis_obj_seq:Pguint8; len:Tguint):Tgboolean;cdecl;external;
{ Opus  }
function gst_codec_utils_opus_parse_caps(caps:PGstCaps; rate:Pguint32; channels:Pguint8; channel_mapping_family:Pguint8; stream_count:Pguint8; 
           coupled_count:Pguint8; channel_mapping:array[0..255] of Tguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_opus_create_caps(rate:Tguint32; channels:Tguint8; channel_mapping_family:Tguint8; stream_count:Tguint8; coupled_count:Tguint8; 
           channel_mapping:Pguint8):PGstCaps;cdecl;external;
function gst_codec_utils_opus_create_caps_from_header(header:PGstBuffer; comments:PGstBuffer):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_opus_create_header(rate:Tguint32; channels:Tguint8; channel_mapping_family:Tguint8; stream_count:Tguint8; coupled_count:Tguint8; 
           channel_mapping:Pguint8; pre_skip:Tguint16; output_gain:Tgint16):PGstBuffer;cdecl;external;
function gst_codec_utils_opus_parse_header(header:PGstBuffer; rate:Pguint32; channels:Pguint8; channel_mapping_family:Pguint8; stream_count:Pguint8; 
           coupled_count:Pguint8; channel_mapping:array[0..255] of Tguint8; pre_skip:Pguint16; output_gain:Pgint16):Tgboolean;cdecl;external;
{ AV1  }
function gst_codec_utils_av1_create_caps_from_av1c(av1c:PGstBuffer):PGstCaps;cdecl;external;
function gst_codec_utils_av1_create_av1c_from_caps(caps:PGstCaps):PGstBuffer;cdecl;external;
{ General  }
function gst_codec_utils_caps_get_mime_codec(caps:PGstCaps):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_codec_utils_caps_from_mime_codec(codecs_field:Pgchar):PGstCaps;cdecl;external;
{$endif}
{ __GST_PB_UTILS_CODEC_UTILS_H__  }

implementation


end.
