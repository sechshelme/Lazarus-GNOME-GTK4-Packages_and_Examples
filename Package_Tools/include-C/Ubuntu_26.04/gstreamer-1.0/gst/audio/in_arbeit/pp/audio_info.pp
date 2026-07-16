
unit audio_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from audio_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    audio_info.h
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
Pgint64  = ^gint64;
PGstAudioChannelPosition  = ^GstAudioChannelPosition;
PGstAudioFlags  = ^GstAudioFlags;
PGstAudioFormatInfo  = ^GstAudioFormatInfo;
PGstAudioInfo  = ^GstAudioInfo;
PGstCaps  = ^GstCaps;
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
{$ifndef __GST_AUDIO_INFO_H__}
{$define __GST_AUDIO_INFO_H__}
type
{*
 * GstAudioFlags:
 * @GST_AUDIO_FLAG_NONE: no valid flag
 * @GST_AUDIO_FLAG_UNPOSITIONED: the position array explicitly
 *     contains unpositioned channels.
 *
 * Extra audio flags
  }

  PGstAudioFlags = ^TGstAudioFlags;
  TGstAudioFlags =  Longint;
  Const
    GST_AUDIO_FLAG_NONE = 0;
    GST_AUDIO_FLAG_UNPOSITIONED = 1 shl 0;
;
{*
 * GstAudioInfo:
 * @finfo: the format info of the audio
 * @flags: additional audio flags
 * @layout: audio layout
 * @rate: the audio sample rate
 * @channels: the number of channels
 * @bpf: the number of bytes for one frame, this is the size of one
 *         sample * @channels
 * @position: the positions for each channel
 *
 * Information describing audio properties. This information can be filled
 * in from GstCaps with gst_audio_info_from_caps().
 *
 * Use the provided macros to access the info in this structure.
  }
(* Const before type ignored *)
{< private > }
type
  PGstAudioInfo = ^TGstAudioInfo;
  TGstAudioInfo = record
      finfo : PGstAudioFormatInfo;
      flags : TGstAudioFlags;
      layout : TGstAudioLayout;
      rate : Tgint;
      channels : Tgint;
      bpf : Tgint;
      position : array[0..63] of TGstAudioChannelPosition;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


{ was #define dname def_expr }
function GST_TYPE_AUDIO_INFO : longint; { return type might be wrong }

function gst_audio_info_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_VALID(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_FORMAT(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_NAME(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_WIDTH(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_DEPTH(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_BPS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_INTEGER(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_FLOAT(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_SIGNED(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_ENDIANNESS(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_LITTLE_ENDIAN(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_BIG_ENDIAN(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_FLAGS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_UNPOSITIONED(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_LAYOUT(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_RATE(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_CHANNELS(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_BPF(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_POSITION(info,c : longint) : longint;

function gst_audio_info_new:PGstAudioInfo;cdecl;external;
(* Const before type ignored *)
function gst_audio_info_new_from_caps(caps:PGstCaps):PGstAudioInfo;cdecl;external;
procedure gst_audio_info_init(info:PGstAudioInfo);cdecl;external;
(* Const before type ignored *)
function gst_audio_info_copy(info:PGstAudioInfo):PGstAudioInfo;cdecl;external;
procedure gst_audio_info_free(info:PGstAudioInfo);cdecl;external;
(* Const before type ignored *)
procedure gst_audio_info_set_format(info:PGstAudioInfo; format:TGstAudioFormat; rate:Tgint; channels:Tgint; position:PGstAudioChannelPosition);cdecl;external;
(* Const before type ignored *)
function gst_audio_info_from_caps(info:PGstAudioInfo; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_audio_info_to_caps(info:PGstAudioInfo):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_audio_info_convert(info:PGstAudioInfo; src_fmt:TGstFormat; src_val:Tgint64; dest_fmt:TGstFormat; dest_val:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_audio_info_is_equal(info:PGstAudioInfo; other:PGstAudioInfo):Tgboolean;cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioInfo, gst_audio_info_free) }
{$endif}
{ __GST_AUDIO_INFO_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_INFO:=gst_audio_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_VALID(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_VALID:=((((i^.finfo)<>(NULL and (@(i^.rate))))>(0 and (@(i^.channels))))>(0 and (@(i^.bpf))))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_FORMAT(i : longint) : longint;
begin
  GST_AUDIO_INFO_FORMAT:=GST_AUDIO_FORMAT_INFO_FORMAT(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_NAME(i : longint) : longint;
begin
  GST_AUDIO_INFO_NAME:=GST_AUDIO_FORMAT_INFO_NAME(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_WIDTH(i : longint) : longint;
begin
  GST_AUDIO_INFO_WIDTH:=GST_AUDIO_FORMAT_INFO_WIDTH(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_DEPTH(i : longint) : longint;
begin
  GST_AUDIO_INFO_DEPTH:=GST_AUDIO_FORMAT_INFO_DEPTH(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_BPS(info : longint) : longint;
begin
  GST_AUDIO_INFO_BPS:=(GST_AUDIO_INFO_DEPTH(info)) shr 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_INTEGER(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_INTEGER:=GST_AUDIO_FORMAT_INFO_IS_INTEGER(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_FLOAT(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_FLOAT:=GST_AUDIO_FORMAT_INFO_IS_FLOAT(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_SIGNED(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_SIGNED:=GST_AUDIO_FORMAT_INFO_IS_SIGNED(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_ENDIANNESS(i : longint) : longint;
begin
  GST_AUDIO_INFO_ENDIANNESS:=GST_AUDIO_FORMAT_INFO_ENDIANNESS(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_LITTLE_ENDIAN(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_LITTLE_ENDIAN:=GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_BIG_ENDIAN(i : longint) : longint;
begin
  GST_AUDIO_INFO_IS_BIG_ENDIAN:=GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(i^.finfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_FLAGS(info : longint) : longint;
begin
  GST_AUDIO_INFO_FLAGS:=info^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_IS_UNPOSITIONED(info : longint) : longint;
begin
  GST_AUDIO_INFO_IS_UNPOSITIONED:=((info^.flags) and GST_AUDIO_FLAG_UNPOSITIONED)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_LAYOUT(info : longint) : longint;
begin
  GST_AUDIO_INFO_LAYOUT:=info^.layout;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_RATE(info : longint) : longint;
begin
  GST_AUDIO_INFO_RATE:=info^.rate;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_CHANNELS(info : longint) : longint;
begin
  GST_AUDIO_INFO_CHANNELS:=info^.channels;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_BPF(info : longint) : longint;
begin
  GST_AUDIO_INFO_BPF:=info^.bpf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_INFO_POSITION(info,c : longint) : longint;
begin
  GST_AUDIO_INFO_POSITION:=info^.(position[c]);
end;


end.
