
unit gstaudiometa;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiometa.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiometa.h
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
Pgfloat  = ^gfloat;
Pgsize  = ^gsize;
PGstAudioChannelPosition  = ^GstAudioChannelPosition;
PGstAudioClippingMeta  = ^GstAudioClippingMeta;
PGstAudioDownmixMeta  = ^GstAudioDownmixMeta;
PGstAudioInfo  = ^GstAudioInfo;
PGstAudioLevelMeta  = ^GstAudioLevelMeta;
PGstAudioMeta  = ^GstAudioMeta;
PGstBuffer  = ^GstBuffer;
PGstMetaInfo  = ^GstMetaInfo;
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
{$ifndef __GST_AUDIO_META_H__}
{$define __GST_AUDIO_META_H__}
{$include <gst/audio/audio.h>}

{ was #define dname def_expr }
function GST_AUDIO_DOWNMIX_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_AUDIO_DOWNMIX_META_INFO : longint; { return type might be wrong }

type
{*
 * GstAudioDownmixMeta:
 * @meta: parent #GstMeta
 * @from_position: (array length=from_channels): the channel positions of the source
 * @to_position: (array length=to_channels): the channel positions of the destination
 * @from_channels: the number of channels of the source
 * @to_channels: the number of channels of the destination
 * @matrix: (array) (element-type float*): the matrix coefficients.
 *
 * Extra buffer metadata describing audio downmixing matrix. This metadata is
 * attached to audio buffers and contains a matrix to downmix the buffer number
 * of channels to @channels.
 *
 * @matrix is an two-dimensional array of @to_channels times @from_channels
 * coefficients, i.e. the i-th output channels is constructed by multiplicating
 * the input channels with the coefficients in @matrix[i] and taking the sum
 * of the results.
  }
  PGstAudioDownmixMeta = ^TGstAudioDownmixMeta;
  TGstAudioDownmixMeta = record
      meta : TGstMeta;
      from_position : PGstAudioChannelPosition;
      to_position : PGstAudioChannelPosition;
      from_channels : Tgint;
      to_channels : Tgint;
      matrix : ^Pgfloat;
    end;


function gst_audio_downmix_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_downmix_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_downmix_meta(b : longint) : PGstAudioDownmixMeta;

(* Const before type ignored *)
function gst_buffer_get_audio_downmix_meta_for_channels(buffer:PGstBuffer; to_position:PGstAudioChannelPosition; to_channels:Tgint):PGstAudioDownmixMeta;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_buffer_add_audio_downmix_meta(buffer:PGstBuffer; from_position:PGstAudioChannelPosition; from_channels:Tgint; to_position:PGstAudioChannelPosition; to_channels:Tgint; 
           matrix:PPgfloat):PGstAudioDownmixMeta;cdecl;external;
{ was #define dname def_expr }
function GST_AUDIO_CLIPPING_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_AUDIO_CLIPPING_META_INFO : longint; { return type might be wrong }

type
{*
 * GstAudioClippingMeta:
 * @meta: parent #GstMeta
 * @format: GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
 * @start: Amount of audio to clip from start of buffer
 * @end: Amount of  to clip from end of buffer
 *
 * Extra buffer metadata describing how much audio has to be clipped from
 * the start or end of a buffer. This is used for compressed formats, where
 * the first frame usually has some additional samples due to encoder and
 * decoder delays, and the last frame usually has some additional samples to
 * be able to fill the complete last frame.
 *
 * This is used to ensure that decoded data in the end has the same amount of
 * samples, and multiply decoded streams can be gaplessly concatenated.
 *
 * Note: If clipping of the start is done by adjusting the segment, this meta
 * has to be dropped from buffers as otherwise clipping could happen twice.
 *
 * Since: 1.8
  }
  PGstAudioClippingMeta = ^TGstAudioClippingMeta;
  TGstAudioClippingMeta = record
      meta : TGstMeta;
      format : TGstFormat;
      start : Tguint64;
      end : Tguint64;
    end;


function gst_audio_clipping_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_clipping_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_clipping_meta(b : longint) : PGstAudioClippingMeta;

function gst_buffer_add_audio_clipping_meta(buffer:PGstBuffer; format:TGstFormat; start:Tguint64; end:Tguint64):PGstAudioClippingMeta;cdecl;external;
{ was #define dname def_expr }
function GST_AUDIO_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_AUDIO_META_INFO : longint; { return type might be wrong }

type
{*
 * GstAudioMeta:
 * @meta: parent #GstMeta
 * @info: the audio properties of the buffer
 * @samples: the number of valid samples in the buffer
 * @offsets: (array) (nullable): the offsets (in bytes) where each channel plane starts in the
 *   buffer or %NULL if the buffer has interleaved layout; if not %NULL, this
 *   is guaranteed to be an array of @info.channels elements
 *
 * Buffer metadata describing how data is laid out inside the buffer. This
 * is useful for non-interleaved (planar) buffers, where it is necessary to
 * have a place to store where each plane starts and how long each plane is.
 *
 * It is a requirement for non-interleaved buffers to have this metadata
 * attached and to be mapped with gst_audio_buffer_map() in order to ensure
 * correct handling of clipping and channel reordering.
 *
 * The different channels in @offsets are always in the GStreamer channel order.
 * Zero-copy channel reordering can be implemented by swapping the values in
 * @offsets.
 *
 * It is not allowed for channels to overlap in memory,
 * i.e. for each i in [0, channels), the range
 * [@offsets[i], @offsets[i] + @samples * sample_stride) must not overlap
 * with any other such range.
 *
 * It is, however, allowed to have parts of the buffer memory unused,
 * by using @offsets and @samples in such a way that leave gaps on it.
 * This is used to implement zero-copy clipping in non-interleaved buffers.
 *
 * Obviously, due to the above, it is not safe to infer the
 * number of valid samples from the size of the buffer. You should always
 * use the @samples variable of this metadata.
 *
 * Note that for interleaved audio it is not a requirement to have this
 * metadata attached and at the moment of writing, there is actually no use
 * case to do so. It is, however, allowed to attach it, for some potential
 * future use case.
 *
 * Since 1.24 it can be serialized using gst_meta_serialize() and
 * gst_meta_deserialize().
 *
 * Since: 1.16
  }
{< private > }
  PGstAudioMeta = ^TGstAudioMeta;
  TGstAudioMeta = record
      meta : TGstMeta;
      info : TGstAudioInfo;
      samples : Tgsize;
      offsets : Pgsize;
      priv_offsets_arr : array[0..7] of Tgsize;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_meta(b : longint) : PGstAudioMeta;

(* Const before type ignored *)
function gst_buffer_add_audio_meta(buffer:PGstBuffer; info:PGstAudioInfo; samples:Tgsize; offsets:Pgsize):PGstAudioMeta;cdecl;external;
{*
 * GST_AUDIO_LEVEL_META_API_TYPE:
 *
 * The #GType associated with #GstAudioLevelMeta.
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_AUDIO_LEVEL_META_API_TYPE : longint; { return type might be wrong }

{*
 * GST_AUDIO_LEVEL_META_INFO:
 *
 * The #GstMetaInfo associated with #GstAudioLevelMeta.
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_AUDIO_LEVEL_META_INFO : longint; { return type might be wrong }

type
{*
 * GstAudioLevelMeta:
 * @meta: parent #GstMeta
 * @level: the -dBov from 0-127 (127 is silence).
 * @voice_activity: whether the buffer contains voice activity
 *
 * Meta containing Audio Level Indication: https://tools.ietf.org/html/rfc6464
 *
 * Since: 1.20
  }
  PGstAudioLevelMeta = ^TGstAudioLevelMeta;
  TGstAudioLevelMeta = record
      meta : TGstMeta;
      level : Tguint8;
      voice_activity : Tgboolean;
    end;


function gst_audio_level_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_level_meta_get_info:PGstMetaInfo;cdecl;external;
function gst_buffer_add_audio_level_meta(buffer:PGstBuffer; level:Tguint8; voice_activity:Tgboolean):PGstAudioLevelMeta;cdecl;external;
function gst_buffer_get_audio_level_meta(buffer:PGstBuffer):PGstAudioLevelMeta;cdecl;external;
{$endif}
{ __GST_AUDIO_META_H__  }

implementation

{ was #define dname def_expr }
function GST_AUDIO_DOWNMIX_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_AUDIO_DOWNMIX_META_API_TYPE:=gst_audio_downmix_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_AUDIO_DOWNMIX_META_INFO : longint; { return type might be wrong }
  begin
    GST_AUDIO_DOWNMIX_META_INFO:=gst_audio_downmix_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_downmix_meta(b : longint) : PGstAudioDownmixMeta;
begin
  gst_buffer_get_audio_downmix_meta:=PGstAudioDownmixMeta(gst_buffer_get_meta(b,GST_AUDIO_DOWNMIX_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_AUDIO_CLIPPING_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_AUDIO_CLIPPING_META_API_TYPE:=gst_audio_clipping_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_AUDIO_CLIPPING_META_INFO : longint; { return type might be wrong }
  begin
    GST_AUDIO_CLIPPING_META_INFO:=gst_audio_clipping_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_clipping_meta(b : longint) : PGstAudioClippingMeta;
begin
  gst_buffer_get_audio_clipping_meta:=PGstAudioClippingMeta(gst_buffer_get_meta(b,GST_AUDIO_CLIPPING_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_AUDIO_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_AUDIO_META_API_TYPE:=gst_audio_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_AUDIO_META_INFO : longint; { return type might be wrong }
  begin
    GST_AUDIO_META_INFO:=gst_audio_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_audio_meta(b : longint) : PGstAudioMeta;
begin
  gst_buffer_get_audio_meta:=PGstAudioMeta(gst_buffer_get_meta(b,GST_AUDIO_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_AUDIO_LEVEL_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_AUDIO_LEVEL_META_API_TYPE:=gst_audio_level_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_AUDIO_LEVEL_META_INFO : longint; { return type might be wrong }
  begin
    GST_AUDIO_LEVEL_META_INFO:=gst_audio_level_meta_get_info;
  end;


end.
