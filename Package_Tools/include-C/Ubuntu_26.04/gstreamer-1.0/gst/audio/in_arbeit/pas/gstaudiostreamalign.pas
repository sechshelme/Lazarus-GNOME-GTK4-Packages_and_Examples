unit gstaudiostreamalign;

interface

uses
  fp_glib2, fp_gst;

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

{*
 * GstAudioStreamAlign:
 *
 * The opaque #GstAudioStreamAlign data structure.
 *
 * Since: 1.14
  }
type

function gst_audio_stream_align_get_type:TGType;cdecl;external libgstaudio;
function gst_audio_stream_align_new(rate:Tgint; alignment_threshold:TGstClockTime; discont_wait:TGstClockTime):PGstAudioStreamAlign;cdecl;external libgstaudio;
function gst_audio_stream_align_copy(align:PGstAudioStreamAlign):PGstAudioStreamAlign;cdecl;external libgstaudio;
procedure gst_audio_stream_align_free(align:PGstAudioStreamAlign);cdecl;external libgstaudio;
procedure gst_audio_stream_align_set_rate(align:PGstAudioStreamAlign; rate:Tgint);cdecl;external libgstaudio;
function gst_audio_stream_align_get_rate(align:PGstAudioStreamAlign):Tgint;cdecl;external libgstaudio;
procedure gst_audio_stream_align_set_alignment_threshold(align:PGstAudioStreamAlign; alignment_threshold:TGstClockTime);cdecl;external libgstaudio;
function gst_audio_stream_align_get_alignment_threshold(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external libgstaudio;
procedure gst_audio_stream_align_set_discont_wait(align:PGstAudioStreamAlign; discont_wait:TGstClockTime);cdecl;external libgstaudio;
function gst_audio_stream_align_get_discont_wait(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external libgstaudio;
procedure gst_audio_stream_align_mark_discont(align:PGstAudioStreamAlign);cdecl;external libgstaudio;
function gst_audio_stream_align_get_timestamp_at_discont(align:PGstAudioStreamAlign):TGstClockTime;cdecl;external libgstaudio;
function gst_audio_stream_align_get_samples_since_discont(align:PGstAudioStreamAlign):Tguint64;cdecl;external libgstaudio;
function gst_audio_stream_align_process(align:PGstAudioStreamAlign; discont:Tgboolean; timestamp:TGstClockTime; n_samples:Tguint; out_timestamp:PGstClockTime; 
           out_duration:PGstClockTime; out_sample_position:Pguint64):Tgboolean;cdecl;external libgstaudio;
{$endif}
{ __GST_AUDIO_STREAM_ALIGN_H__  }

// === Konventiert am: 16-7-26 15:25:31 ===

function GST_TYPE_AUDIO_INFO_STREAM_ALIGN : TGType;

implementation

function GST_TYPE_AUDIO_INFO_STREAM_ALIGN : TGType;
  begin
    GST_TYPE_AUDIO_INFO_STREAM_ALIGN:=gst_audio_stream_align_get_type;
  end;



end.
