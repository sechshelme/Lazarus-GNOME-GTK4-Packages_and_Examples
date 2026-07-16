
unit audio_format;
interface

{
  Automatically converted by H2Pas 1.0.0 from audio_format.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    audio_format.h
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
PGstAudioFormat  = ^GstAudioFormat;
PGstAudioFormatFlags  = ^GstAudioFormatFlags;
PGstAudioFormatInfo  = ^GstAudioFormatInfo;
PGstAudioLayout  = ^GstAudioLayout;
PGstAudioPackFlags  = ^GstAudioPackFlags;
PGstCaps  = ^GstCaps;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
 * Library       <2001> Thomas Vander Stichele <thomas@apestaart.org>
 *               <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_FORMAT_H__}
{$define __GST_AUDIO_FORMAT_H__}
{ 8 bit  }
{ 16 bit  }
{ 24 bit in low 3 bytes of 32 bits }
{ 32 bit  }
{ 24 bit in 3 bytes }
{ 20 bit in 3 bytes }
{ 18 bit in 3 bytes }
{ float  }
{ 20 bit in 32 bits  }
{*
   * GST_AUDIO_FORMAT_S20_32LE:
   *
   * 20 bits in 32 bits, signed, little endian.
   *
   * Since: 1.28
    }
{*
   * GST_AUDIO_FORMAT_S20_32BE:
   *
   * 20 bits in 32 bits, signed, big endian.
   *
   * Since: 1.28
    }
{*
   * GST_AUDIO_FORMAT_U20_32LE:
   *
   * 20 bits in 32 bits, unsigned, little endian.
   *
   * Since: 1.28
    }
{*
   * GST_AUDIO_FORMAT_U20_32BE:
   *
   * 20 bits in 32 bits, unsigned, big endian.
   *
   * Since: 1.28
    }
{ Update GST_AUDIO_FORMAT_LAST below when adding more formats here  }
{ native endianness equivalents  }
{*
   * GST_AUDIO_FORMAT_S20_32:
   *
   * 20 bits in 32 bits, signed, native endian.
   *
   * Since: 1.28
    }
{*
   * GST_AUDIO_FORMAT_U20_32:
   *
   * 20 bits in 32 bits, unsigned, native endian.
   *
   * Since: 1.28
    }
type
  PGstAudioFormat = ^TGstAudioFormat;
  TGstAudioFormat =  Longint;
  Const
    GST_AUDIO_FORMAT_UNKNOWN = 0;
    GST_AUDIO_FORMAT_ENCODED = 1;
    GST_AUDIO_FORMAT_S8 = 2;
    GST_AUDIO_FORMAT_U8 = 3;
    GST_AUDIO_FORMAT_S16LE = 4;
    GST_AUDIO_FORMAT_S16BE = 5;
    GST_AUDIO_FORMAT_U16LE = 6;
    GST_AUDIO_FORMAT_U16BE = 7;
    GST_AUDIO_FORMAT_S24_32LE = 8;
    GST_AUDIO_FORMAT_S24_32BE = 9;
    GST_AUDIO_FORMAT_U24_32LE = 10;
    GST_AUDIO_FORMAT_U24_32BE = 11;
    GST_AUDIO_FORMAT_S32LE = 12;
    GST_AUDIO_FORMAT_S32BE = 13;
    GST_AUDIO_FORMAT_U32LE = 14;
    GST_AUDIO_FORMAT_U32BE = 15;
    GST_AUDIO_FORMAT_S24LE = 16;
    GST_AUDIO_FORMAT_S24BE = 17;
    GST_AUDIO_FORMAT_U24LE = 18;
    GST_AUDIO_FORMAT_U24BE = 19;
    GST_AUDIO_FORMAT_S20LE = 20;
    GST_AUDIO_FORMAT_S20BE = 21;
    GST_AUDIO_FORMAT_U20LE = 22;
    GST_AUDIO_FORMAT_U20BE = 23;
    GST_AUDIO_FORMAT_S18LE = 24;
    GST_AUDIO_FORMAT_S18BE = 25;
    GST_AUDIO_FORMAT_U18LE = 26;
    GST_AUDIO_FORMAT_U18BE = 27;
    GST_AUDIO_FORMAT_F32LE = 28;
    GST_AUDIO_FORMAT_F32BE = 29;
    GST_AUDIO_FORMAT_F64LE = 30;
    GST_AUDIO_FORMAT_F64BE = 31;
    GST_AUDIO_FORMAT_S20_32LE = 32;
    GST_AUDIO_FORMAT_S20_32BE = 33;
    GST_AUDIO_FORMAT_U20_32LE = 34;
    GST_AUDIO_FORMAT_U20_32BE = 35;
    GST_AUDIO_FORMAT_S16 = _GST_AUDIO_FORMAT_NE(S16);
    GST_AUDIO_FORMAT_U16 = _GST_AUDIO_FORMAT_NE(U16);
    GST_AUDIO_FORMAT_S24_32 = _GST_AUDIO_FORMAT_NE(S24_32);
    GST_AUDIO_FORMAT_U24_32 = _GST_AUDIO_FORMAT_NE(U24_32);
    GST_AUDIO_FORMAT_S32 = _GST_AUDIO_FORMAT_NE(S32);
    GST_AUDIO_FORMAT_U32 = _GST_AUDIO_FORMAT_NE(U32);
    GST_AUDIO_FORMAT_S24 = _GST_AUDIO_FORMAT_NE(S24);
    GST_AUDIO_FORMAT_U24 = _GST_AUDIO_FORMAT_NE(U24);
    GST_AUDIO_FORMAT_S20 = _GST_AUDIO_FORMAT_NE(S20);
    GST_AUDIO_FORMAT_U20 = _GST_AUDIO_FORMAT_NE(U20);
    GST_AUDIO_FORMAT_S20_32 = _GST_AUDIO_FORMAT_NE(S20_32);
    GST_AUDIO_FORMAT_U20_32 = _GST_AUDIO_FORMAT_NE(U20_32);
    GST_AUDIO_FORMAT_S18 = _GST_AUDIO_FORMAT_NE(S18);
    GST_AUDIO_FORMAT_U18 = _GST_AUDIO_FORMAT_NE(U18);
    GST_AUDIO_FORMAT_F32 = _GST_AUDIO_FORMAT_NE(F32);
    GST_AUDIO_FORMAT_F64 = _GST_AUDIO_FORMAT_NE(F64);
;
{*
 * GST_AUDIO_FORMAT_LAST:
 *
 * Number of audio formats in #GstAudioFormat.
 *
 * Since: 1.26
  }
  GST_AUDIO_FORMAT_LAST = GST_AUDIO_FORMAT_U20_32BE+1;  
type
{*
 * GstAudioFormatFlags:
 * @GST_AUDIO_FORMAT_FLAG_INTEGER: integer samples
 * @GST_AUDIO_FORMAT_FLAG_FLOAT: float samples
 * @GST_AUDIO_FORMAT_FLAG_SIGNED: signed samples
 * @GST_AUDIO_FORMAT_FLAG_COMPLEX: complex layout
 * @GST_AUDIO_FORMAT_FLAG_UNPACK: the format can be used in
 * #GstAudioFormatUnpack and #GstAudioFormatPack functions
 *
 * The different audio flags that a format info can have.
  }

  PGstAudioFormatFlags = ^TGstAudioFormatFlags;
  TGstAudioFormatFlags =  Longint;
  Const
    GST_AUDIO_FORMAT_FLAG_INTEGER = 1 shl 0;
    GST_AUDIO_FORMAT_FLAG_FLOAT = 1 shl 1;
    GST_AUDIO_FORMAT_FLAG_SIGNED = 1 shl 2;
    GST_AUDIO_FORMAT_FLAG_COMPLEX = 1 shl 4;
    GST_AUDIO_FORMAT_FLAG_UNPACK = 1 shl 5;
;
{*
 * GstAudioPackFlags:
 * @GST_AUDIO_PACK_FLAG_NONE: No flag
 * @GST_AUDIO_PACK_FLAG_TRUNCATE_RANGE: When the source has a smaller depth
 *   than the target format, set the least significant bits of the target
 *   to 0. This is likely slightly faster but less accurate. When this flag
 *   is not specified, the most significant bits of the source are duplicated
 *   in the least significant bits of the destination.
 *
 * The different flags that can be used when packing and unpacking.
  }
type
  PGstAudioPackFlags = ^TGstAudioPackFlags;
  TGstAudioPackFlags =  Longint;
  Const
    GST_AUDIO_PACK_FLAG_NONE = 0;
    GST_AUDIO_PACK_FLAG_TRUNCATE_RANGE = 1 shl 0;
;
{*
 * GstAudioFormatUnpack:
 * @info: a #GstAudioFormatInfo
 * @flags: #GstAudioPackFlags
 * @dest: (array) (element-type guint8): a destination array
 * @data: (array) (element-type guint8): pointer to the audio data
 * @length: the amount of samples to unpack.
 *
 * Unpacks @length samples from the given data of format @info.
 * The samples will be unpacked into @dest which each channel
 * interleaved. @dest should at least be big enough to hold @length *
 * channels * size(unpack_format) bytes.
  }
(* Const before type ignored *)
type

  TGstAudioFormatUnpack = procedure (info:PGstAudioFormatInfo; flags:TGstAudioPackFlags; dest:Tgpointer; data:Tgconstpointer; length:Tgint);cdecl;
{*
 * GstAudioFormatPack:
 * @info: a #GstAudioFormatInfo
 * @flags: #GstAudioPackFlags
 * @src: (array) (element-type guint8): a source array
 * @data: (array) (element-type guint8): pointer to the destination
 *   data
 * @length: the amount of samples to pack.
 *
 * Packs @length samples from @src to the data array in format @info.
 * The samples from source have each channel interleaved
 * and will be packed into @data.
  }
(* Const before type ignored *)

  TGstAudioFormatPack = procedure (info:PGstAudioFormatInfo; flags:TGstAudioPackFlags; src:Tgconstpointer; data:Tgpointer; length:Tgint);cdecl;
{*
 * GstAudioFormatInfo:
 * @format: #GstAudioFormat
 * @name: string representation of the format
 * @description: user readable description of the format
 * @flags: #GstAudioFormatFlags
 * @endianness: the endianness
 * @width: amount of bits used for one sample
 * @depth: amount of valid bits in @width
 * @silence: @width/8 bytes with 1 silent sample
 * @unpack_format: the format of the unpacked samples
 * @unpack_func: function to unpack samples
 * @pack_func: function to pack samples
 *
 * Information for an audio format.
  }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGstAudioFormatInfo = ^TGstAudioFormatInfo;
  TGstAudioFormatInfo = record
      format : TGstAudioFormat;cdecl;
      name : Pgchar;
      description : Pgchar;
      flags : TGstAudioFormatFlags;
      endianness : Tgint;
      width : Tgint;
      depth : Tgint;
      silence : array[0..7] of Tguint8;
      unpack_format : TGstAudioFormat;
      unpack_func : TGstAudioFormatUnpack;
      pack_func : TGstAudioFormatPack;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_format_info_get_type:TGType;cdecl;external;
{*
 * GST_AUDIO_FORMAT_INFO_IS_VALID_RAW:
 *
 * Tests that the given #GstAudioFormatInfo represents a valid un-encoded
 * format.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_VALID_RAW(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_FORMAT(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_NAME(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_FLAGS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_INTEGER(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_FLOAT(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_SIGNED(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_ENDIANNESS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_WIDTH(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_DEPTH(info : longint) : longint;

function gst_audio_format_build_integer(sign:Tgboolean; endianness:Tgint; width:Tgint; depth:Tgint):TGstAudioFormat;cdecl;external;
(* Const before type ignored *)
function gst_audio_format_from_string(format:Pgchar):TGstAudioFormat;cdecl;external;
(* Const before type ignored *)
function gst_audio_format_to_string(format:TGstAudioFormat):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_audio_format_get_info(format:TGstAudioFormat):PGstAudioFormatInfo;cdecl;external;
(* Const before type ignored *)
procedure gst_audio_format_info_fill_silence(info:PGstAudioFormatInfo; dest:Tgpointer; length:Tgsize);cdecl;external;
{xxxxxxxxx extern G_DEPRECATED_FOR(gst_audio_format_info_fill_silence) }
(* Const before type ignored *)
procedure gst_audio_format_fill_silence(info:PGstAudioFormatInfo; dest:Tgpointer; length:Tgsize);cdecl;external;
{*
 * GST_AUDIO_RATE_RANGE:
 *
 * Maximum range of allowed sample rates, for use in template caps strings.
  }
const
  GST_AUDIO_RATE_RANGE = '(int) [ 1, max ]';  
{*
 * GST_AUDIO_CHANNELS_RANGE:
 *
 * Maximum range of allowed channels, for use in template caps strings.
  }
  GST_AUDIO_CHANNELS_RANGE = '(int) [ 1, max ]';  
{*
 * GST_AUDIO_NE:
 * @s: format string without endianness marker
 *
 * Turns audio format string @s into the format string for native endianness.
  }
{*
 * GST_AUDIO_OE:
 * @s: format string without endianness marker
 *
 * Turns audio format string @s into the format string for other endianness.
  }
{*
 * GST_AUDIO_FORMATS_ALL:
 *
 * List of all audio formats, for use in template caps strings.
 *
 * Formats are sorted by decreasing "quality", using these criteria by priority:
 *   - depth
 *   - width
 *   - Float > Signed > Unsigned
 *   - native endianness preferred
  }
(* Const before type ignored *)

function gst_audio_formats_raw(len:Pguint):PGstAudioFormat;cdecl;external;
{*
 * GST_AUDIO_CAPS_MAKE:
 * @format: string format that describes the sample layout, as string
 *     (e.g. "S16LE", "S8", etc.)
 *
 * Generic caps string for audio, for use in pad templates.
  }
{*
 * GST_AUDIO_DEF_RATE:
 *
 * Standard sampling rate used in consumer audio.
  }
const
  GST_AUDIO_DEF_RATE = 44100;  
{*
 * GST_AUDIO_DEF_CHANNELS:
 *
 * Standard number of channels used in consumer audio.
  }
  GST_AUDIO_DEF_CHANNELS = 2;  
{*
 * GST_AUDIO_DEF_FORMAT:
 *
 * Standard format used in consumer audio.
  }
  GST_AUDIO_DEF_FORMAT = 'S16LE';  
{*
 * GstAudioLayout:
 * @GST_AUDIO_LAYOUT_INTERLEAVED: interleaved audio
 * @GST_AUDIO_LAYOUT_NON_INTERLEAVED: non-interleaved audio
 *
 * Layout of the audio samples for the different channels.
  }
type
  PGstAudioLayout = ^TGstAudioLayout;
  TGstAudioLayout =  Longint;
  Const
    GST_AUDIO_LAYOUT_INTERLEAVED = 0;
    GST_AUDIO_LAYOUT_NON_INTERLEAVED = 1;
;
(* Const before type ignored *)

function gst_audio_make_raw_caps(formats:PGstAudioFormat; len:Tguint; layout:TGstAudioLayout):PGstCaps;cdecl;external;
{$endif}
{ __GST_AUDIO_FORMAT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_VALID_RAW(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_VALID_RAW:=(((info<>(NULL and (@(info^.format))))>(GST_AUDIO_FORMAT_ENCODED and (@(info^.width))))>(0 and (@(info^.depth))))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_FORMAT(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_FORMAT:=info^.format;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_NAME(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_NAME:=info^.name;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_FLAGS(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_FLAGS:=info^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_INTEGER(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_INTEGER:= not ( not ((info^.flags) and GST_AUDIO_FORMAT_FLAG_INTEGER));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_FLOAT(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_FLOAT:= not ( not ((info^.flags) and GST_AUDIO_FORMAT_FLAG_FLOAT));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_SIGNED(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_SIGNED:= not ( not ((info^.flags) and GST_AUDIO_FORMAT_FLAG_SIGNED));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_ENDIANNESS(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_ENDIANNESS:=info^.endianness;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN:=(info^.endianness)=G_LITTLE_ENDIAN;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN:=(info^.endianness)=G_BIG_ENDIAN;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_WIDTH(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_WIDTH:=info^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FORMAT_INFO_DEPTH(info : longint) : longint;
begin
  GST_AUDIO_FORMAT_INFO_DEPTH:=info^.depth;
end;


end.
