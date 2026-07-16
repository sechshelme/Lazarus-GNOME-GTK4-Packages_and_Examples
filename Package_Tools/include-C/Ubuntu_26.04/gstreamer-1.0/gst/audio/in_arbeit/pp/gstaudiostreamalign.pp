
unit gstaudiostreamalign;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiostreamalign.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiostreamalign.h
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
PGstAudioStreamAlign  = ^GstAudioStreamAlign;
PGstClockTime  = ^GstClockTime;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
 *
 * gstaudiostreamalign.h:
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
{$ifndef __GST_AUDIO_STREAM_ALIGN_H__}
{$define __GST_AUDIO_STREAM_ALIGN_H__}
{$include <gst/gst.h>}
{$include <gst/audio/audio-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_INFO_STREAM_ALIGN : longint; { return type might be wrong }

{*
 * GstAudioStreamAlign:
 *
 * The opaque #GstAudioStreamAlign data structure.
 *
 * Since: 1.14
  }
type

function gst_audio_stream_align_get_type:TGType;cdecl;external;
function gst_audio_stream_align_new(rate:Tgint; alignment_threshold:TGstClockTime; discont_wait:TGstClockTime):PGstAudioStreamAlign;cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_copy(align:PGstAudioStreamAlign):PGstAudioStreamAlign;cdecl;external;
procedure gst_audio_stream_align_free(align:PGstAudioStreamAlign);cdecl;external;
procedure gst_audio_stream_align_set_rate(align:PGstAudioStreamAlign; rate:Tgint);cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_get_rate(align:PGstAudioStreamAlign):Tgint;cdecl;external;
procedure gst_audio_stream_align_set_alignment_threshold(align:PGstAudioStreamAlign; alignment_threshold:TGstClockTime);cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_get_alignment_threshold(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external;
procedure gst_audio_stream_align_set_discont_wait(align:PGstAudioStreamAlign; discont_wait:TGstClockTime);cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_get_discont_wait(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external;
procedure gst_audio_stream_align_mark_discont(align:PGstAudioStreamAlign);cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_get_timestamp_at_discont(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external;
(* Const before type ignored *)
function gst_audio_stream_align_get_samples_since_discont(align:PGstAudioStreamAlign):Tguint64;cdecl;external;
function gst_audio_stream_align_process(align:PGstAudioStreamAlign; discont:Tgboolean; timestamp:TGstClockTime; n_samples:Tguint; out_timestamp:PGstClockTime; 
           out_duration:PGstClockTime; out_sample_position:Pguint64):Tgboolean;cdecl;external;
{$endif}
{ __GST_AUDIO_STREAM_ALIGN_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_INFO_STREAM_ALIGN : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_INFO_STREAM_ALIGN:=gst_audio_stream_align_get_type;
  end;


end.
