
unit gstdsd;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdsd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdsd
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
Pgsize  = ^gsize;
PGstAudioChannelPosition  = ^GstAudioChannelPosition;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstDsdInfo  = ^GstDsdInfo;
PGstDsdPlaneOffsetMeta  = ^GstDsdPlaneOffsetMeta;
PGstMetaInfo  = ^GstMetaInfo;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2023 Carlos Rafael Giani <crg7475@mailbox.org>
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
{$include <gst/gst.h>}
{$include <gst/audio/audio.h>}
{$include <gst/audio/gstdsdformat.h>}
{*
 * GST_DSD_MEDIA_TYPE:
 *
 * The GStreamer media type for DSD.
 *
 * Since: 1.24
  }

const
  GST_DSD_MEDIA_TYPE = 'audio/x-dsd';  
{*
 * GST_DSD_CAPS_MAKE:
 * @format: string format that describes the DSD bits grouping,
 *     as string (e.g. "DSDU32BE", "DSDU8", etc.)
 *
 * Generic caps string for DSD audio, for use in pad templates.
 *
 * Since: 1.24
  }
{*
 * GST_DSD_MAKE_DSD_RATE_44x:
 *
 * Calculates a valid DSD-44x rate (in bytes) from commonly used rate
 * multiplier specifications like DSD64, DSD128 etc.
 *
 * For example, to get the rate for DSD64-44x, use 64 as the multiplier
 * argument.
 *
 * Since: 1.24
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_DSD_MAKE_DSD_RATE_44x(multiplier : longint) : longint;

{*
 * GST_DSD_MAKE_DSD_RATE_48x:
 *
 * Calculates a valid DSD-48x rate (in bytes) from commonly used rate
 * multiplier specifications like DSD64, DSD128 etc.
 *
 * For example, to get the rate for DSD64-48x, use 64 as the multiplier
 * argument.
 *
 * Since: 1.24
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_MAKE_DSD_RATE_48x(multiplier : longint) : longint;

{*
 * GST_DSD_SILENCE_PATTERN_BYTE:
 *
 * Silence pattern for DSD data.
 *
 * In DSD, a nullbyte does not correspond to silence. To fill memory regions
 * with "DSD silence", these regions must be filled with byte 0x69 instead
 * (this is the DSD silence pattern). This constant provides that pattern
 * in a more readable fashion.
 *
 * Since: 1.24
  }
const
  GST_DSD_SILENCE_PATTERN_BYTE = $69;  
type
{*
 * GstDsdInfo:
 * @format: DSD grouping format
 * @rate: DSD rate
 * @channels: number of channels (must be at least 1)
 * @layout: audio layout
 * @reversed_bytes: true if the DSD bits in the data bytes are reversed,
 *   that is, the least significant bit comes first
 * @positions: positions for each channel
 *
 * Information describing DSD audio properties.
 *
 * In DSD, the "sample format" is the bit. Unlike PCM, there are no further
 * "sample formats" in DSD. However, in software, DSD bits are grouped into
 * bytes (since dealing with individual bits is impractical), and these bytes
 * in turn are grouped into words. This becomes relevant when interleaving
 * channels and transmitting DSD data through audio APIs. The different
 * types of grouping DSD bytes are referred to as the "DSD grouping forma"
 * or just "DSD format". #GstDsdFormat has a list of valid ways of grouping
 * DSD bytes into words.
 *
 * DSD rates are equivalent to PCM sample rates, except that they specify
 * how many DSD bytes are consumed per second. This refers to the bytes per
 * second _per channel_; the rate does not change when the number of channel
 * changes. (Strictly speaking, it would be more correct to measure the
 * *bits* per second, since the bit is the DSD "sample format", but it is
 * more practical to use bytes.) In DSD, bit rates are always an integer
 * multiple of the CD audio rate (44100) or the DAT rate (48000). DSD64-44x
 * is 44100 * 64 = 2822400 bits per second, or 352800 bytes per second
 * (the latter would be used in this info structure). DSD64-48x is
 * 48000 * 64 = 3072000 bits per second, or 384000 bytes per second.
 * #GST_DSD_MAKE_DSD_RATE_44x can be used for specifying DSD-44x rates,
 * *and #GST_DSD_MAKE_DSD_RATE_48x can be used for specifying DSD-48x ones.
 * Also, since DSD-48x is less well known, when the multiplier is given
 * without the 44x/48x specifier, 44x is typically implied.
 *
 * It is important to know that in DSD, different format widths correspond
 * to different playtimes. That is, a word with 32 DSD bits covers two times
 * as much playtime as a word with 16 DSD bits. This is in contrast to PCM,
 * where one word (= one PCM sample) always covers a time period of 1/samplerate,
 * no matter how many bits a PCM sample is made of. For this reason, DSD
 * and PCM widths and strides cannot be used the same way.
 *
 * Multiple channels are arranged in DSD data either interleaved or non-
 * interleaved. This is similar to PCM. Interleaved layouts rotate between
 * channels and words. First, word 0 of channel 0 is present. Then word
 * 0 of channel 1 follows. Then word 0 of channel 2 etc. until all
 * channels are through, then comes word 1 of channel 0 etc.
 *
 * Non-interleaved data is planar. First, all words of channel 0 are
 * present, then all words of channel 1 etc. Unlike interleaved data,
 * non-interleaved data can be sparse, that is, there can be space in
 * between the planes. the @positions array specifies the plane offsets.
 *
 * In uncommon cases, the DSD bits in the data bytes can be stored in reverse
 * order. For example, normally, in DSDU8, the first byte contains DSD bits
 * 0 to 7, and the most significant bit of that byte is DSD bit 0. If this
 * order is reversed, then bit 7 is the first one instead. In that ase,
 * @reversed_bytes is set to TRUE.
 *
 * Use the provided macros to access the info in this structure.
 *
 * Since: 1.24
  }
{< private > }
  PGstDsdInfo = ^TGstDsdInfo;
  TGstDsdInfo = record
      format : TGstDsdFormat;
      rate : Tgint;
      channels : Tgint;
      layout : TGstAudioLayout;
      reversed_bytes : Tgboolean;
      positions : array[0..63] of TGstAudioChannelPosition;
      flags : TGstAudioFlags;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


{ was #define dname def_expr }
function GST_TYPE_DSD_INFO : longint; { return type might be wrong }

function gst_dsd_info_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_IS_VALID(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_FORMAT(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_RATE(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_CHANNELS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_LAYOUT(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_REVERSED_BYTES(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_POSITION(info,c : longint) : longint;

{*
 * GST_DSD_INFO_STRIDE:
 *
 * Calculates the stride for a given #GstDsdInfo.
 *
 * Note that this is only useful if the info's audio layout
 * is GST_AUDIO_LAYOUT_INTERLEAVED.
 *
 * Since: 1.24
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_STRIDE(info : longint) : longint;

{** GstDsdPlaneOffsetMeta ** }
{ was #define dname def_expr }
function GST_DSD_PLANE_OFFSET_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_DSD_PLANE_OFFSET_META_INFO : longint; { return type might be wrong }

{*
 * GST_META_TAG_DSD_PLANE_OFFSETS_STR:
 *
 * This metadata stays relevant as long as the DSD plane offsets are unchanged.
 *
 * Since: 1.24
  }
const
  GST_META_TAG_DSD_PLANE_OFFSETS_STR = 'dsdplaneoffsets';  
type
{*
 * GstDsdPlaneOffsetMeta:
 * @meta: parent #GstMeta
 * @num_channels: number of channels in the DSD data
 * @num_bytes_per_channel: the number of valid bytes per channel in the buffer
 * @offsets: the offsets (in bytes) where each channel plane starts in the buffer
 *
 * Buffer metadata describing planar DSD contents in the buffer. This is not needed
 * for interleaved DSD data, and is required for non-interleaved (= planar) data.
 *
 * The different channels in @offsets are always in the GStreamer channel order.
 * Zero-copy channel reordering can be implemented by swapping the values in
 * @offsets.
 *
 * It is not allowed for channels to overlap in memory,
 * i.e. for each i in [0, channels), the range
 * [@offsets[i], @offsets[i] + @num_bytes_per_channel) must not overlap
 * with any other such range.
 *
 * It is, however, allowed to have parts of the buffer memory unused, by using
 * @offsets and @num_bytes_per_channel in such a way that leave gaps on it.
 * This is used to implement zero-copy clipping in non-interleaved buffers.
 *
 * Obviously, due to the above, it is not safe to infer the
 * number of valid bytes from the size of the buffer. You should always
 * use the @num_bytes_per_channel variable of this metadata.
 *
 * Since: 1.24
  }
{< private > }
  PGstDsdPlaneOffsetMeta = ^TGstDsdPlaneOffsetMeta;
  TGstDsdPlaneOffsetMeta = record
      meta : TGstMeta;
      num_channels : Tgint;
      num_bytes_per_channel : Tgsize;
      offsets : Pgsize;
      priv_offsets_arr : array[0..7] of Tgsize;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_dsd_plane_offset_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_dsd_plane_offset_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_dsd_plane_offset_meta(b : longint) : PGstDsdPlaneOffsetMeta;

function gst_buffer_add_dsd_plane_offset_meta(buffer:PGstBuffer; num_channels:Tgint; num_bytes_per_channel:Tgsize; offsets:Pgsize):PGstDsdPlaneOffsetMeta;cdecl;external;
function gst_dsd_info_new:PGstDsdInfo;cdecl;external;
(* Const before type ignored *)
function gst_dsd_info_new_from_caps(caps:PGstCaps):PGstDsdInfo;cdecl;external;
procedure gst_dsd_info_init(info:PGstDsdInfo);cdecl;external;
(* Const before type ignored *)
procedure gst_dsd_info_set_format(info:PGstDsdInfo; format:TGstDsdFormat; rate:Tgint; channels:Tgint; positions:PGstAudioChannelPosition);cdecl;external;
(* Const before type ignored *)
function gst_dsd_info_copy(info:PGstDsdInfo):PGstDsdInfo;cdecl;external;
procedure gst_dsd_info_free(info:PGstDsdInfo);cdecl;external;
(* Const before type ignored *)
function gst_dsd_info_from_caps(info:PGstDsdInfo; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_dsd_info_to_caps(info:PGstDsdInfo):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_dsd_info_is_equal(info:PGstDsdInfo; other:PGstDsdInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_dsd_convert(input_data:Pguint8; output_data:Pguint8; input_format:TGstDsdFormat; output_format:TGstDsdFormat; input_layout:TGstAudioLayout; 
            output_layout:TGstAudioLayout; input_plane_offsets:Pgsize; output_plane_offsets:Pgsize; num_dsd_bytes:Tgsize; num_channels:Tgint; 
            reverse_byte_bits:Tgboolean);cdecl;external;
{*xxxxxxxxx
static inline gboolean 
gst_dsd_format_is_le (GstDsdFormat format)

  switch (format) 
    case GST_DSD_FORMAT_U16LE:
    case GST_DSD_FORMAT_U32LE:
      return TRUE;
    default:
      return FALSE;
  

  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_MAKE_DSD_RATE_44x(multiplier : longint) : longint;
begin
  GST_DSD_MAKE_DSD_RATE_44x:=((Tgint(Tgint64(multiplier)))*44100)/8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_MAKE_DSD_RATE_48x(multiplier : longint) : longint;
begin
  GST_DSD_MAKE_DSD_RATE_48x:=((Tgint(Tgint64(multiplier)))*48000)/8;
end;

{ was #define dname def_expr }
function GST_TYPE_DSD_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DSD_INFO:=gst_dsd_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_IS_VALID(i : longint) : longint;
begin
  GST_DSD_INFO_IS_VALID:=(((i^.format)<(GST_NUM_DSD_FORMATS and (@(i^.rate))))>(0 and (@(i^.channels))))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_FORMAT(info : longint) : longint;
begin
  GST_DSD_INFO_FORMAT:=info^.format;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_RATE(info : longint) : longint;
begin
  GST_DSD_INFO_RATE:=info^.rate;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_CHANNELS(info : longint) : longint;
begin
  GST_DSD_INFO_CHANNELS:=info^.channels;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_LAYOUT(info : longint) : longint;
begin
  GST_DSD_INFO_LAYOUT:=info^.layout;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_REVERSED_BYTES(info : longint) : longint;
begin
  GST_DSD_INFO_REVERSED_BYTES:=info^.reversed_bytes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_POSITION(info,c : longint) : longint;
begin
  GST_DSD_INFO_POSITION:=info^.(position[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DSD_INFO_STRIDE(info : longint) : longint;
begin
  GST_DSD_INFO_STRIDE:=(gst_dsd_format_get_width(info^.format))*(info^.channels);
end;

{ was #define dname def_expr }
function GST_DSD_PLANE_OFFSET_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_DSD_PLANE_OFFSET_META_API_TYPE:=gst_dsd_plane_offset_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_DSD_PLANE_OFFSET_META_INFO : longint; { return type might be wrong }
  begin
    GST_DSD_PLANE_OFFSET_META_INFO:=gst_dsd_plane_offset_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_dsd_plane_offset_meta(b : longint) : PGstDsdPlaneOffsetMeta;
begin
  gst_buffer_get_dsd_plane_offset_meta:=PGstDsdPlaneOffsetMeta(gst_buffer_get_meta(b,GST_DSD_PLANE_OFFSET_META_API_TYPE));
end;


end.
