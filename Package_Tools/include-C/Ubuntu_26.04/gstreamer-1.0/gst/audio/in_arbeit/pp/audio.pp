
unit audio;
interface

{
  Automatically converted by H2Pas 1.0.0 from audio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    audio.h
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
PGstBuffer  = ^GstBuffer;
PGstSegment  = ^GstSegment;
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
{$define __GST_AUDIO_AUDIO_H__}
{$include <gst/gst.h>}
{$include <gst/audio/audio-prelude.h>}
{$include <gst/audio/audio-enumtypes.h>}
{$include <gst/audio/audio-format.h>}
{$include <gst/audio/audio-channels.h>}
{$include <gst/audio/audio-channel-mixer.h>}
{$include <gst/audio/audio-info.h>}
{$include <gst/audio/audio-buffer.h>}
{$include <gst/audio/audio-quantize.h>}
{$include <gst/audio/audio-converter.h>}
{$include <gst/audio/audio-resampler.h>}
{$include <gst/audio/gstaudiostreamalign.h>}
{$include <gst/audio/gstaudioaggregator.h>}
{$include <gst/audio/gstdsd.h>}
{ conversion macros  }
{*
 * GST_FRAMES_TO_CLOCK_TIME:
 * @frames: sample frames
 * @rate: sampling rate
 *
 * Calculate clocktime from sample @frames and @rate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_FRAMES_TO_CLOCK_TIME(frames,rate : longint) : TGstClockTime;

{*
 * GST_CLOCK_TIME_TO_FRAMES:
 * @clocktime: clock time
 * @rate: sampling rate
 *
 * Calculate frames from @clocktime and sample @rate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_TO_FRAMES(clocktime,rate : longint) : longint;

{ metadata macros  }
{*
 * GST_META_TAG_AUDIO_STR:
 *
 * This metadata is relevant for audio streams.
 *
 * Since: 1.2
  }
const
  GST_META_TAG_AUDIO_STR = 'audio';  
{*
 * GST_META_TAG_AUDIO_CHANNELS_STR:
 *
 * This metadata stays relevant as long as channels are unchanged.
 *
 * Since: 1.2
  }
  GST_META_TAG_AUDIO_CHANNELS_STR = 'channels';  
{*
 * GST_META_TAG_AUDIO_RATE_STR:
 *
 * This metadata stays relevant as long as sample rate is unchanged.
 *
 * Since: 1.8
  }
  GST_META_TAG_AUDIO_RATE_STR = 'rate';  
{
 * this library defines and implements some helper functions for audio
 * handling
  }
(* Const before type ignored *)

function gst_audio_buffer_clip(buffer:PGstBuffer; segment:PGstSegment; rate:Tgint; bpf:Tgint):PGstBuffer;cdecl;external;
function gst_audio_buffer_truncate(buffer:PGstBuffer; bpf:Tgint; trim:Tgsize; samples:Tgsize):PGstBuffer;cdecl;external;
{$include <gst/audio/gstaudioringbuffer.h>}
{$include <gst/audio/gstaudioclock.h>}
{$include <gst/audio/gstaudiofilter.h>}
{$include <gst/audio/gstaudiocdsrc.h>}
{$include <gst/audio/gstaudiodecoder.h>}
{$include <gst/audio/gstaudioencoder.h>}
{$include <gst/audio/gstaudiobasesink.h>}
{$include <gst/audio/gstaudiobasesrc.h>}
{$include <gst/audio/gstaudiometa.h>}
{$include <gst/audio/gstaudiosink.h>}
{$include <gst/audio/gstaudiosrc.h>}
{$include <gst/audio/streamvolume.h>}
{$include <gst/audio/gstaudioiec61937.h>}
{$endif}
{ __GST_AUDIO_AUDIO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_FRAMES_TO_CLOCK_TIME(frames,rate : longint) : TGstClockTime;
begin
  GST_FRAMES_TO_CLOCK_TIME:=TGstClockTime(gst_util_uint64_scale_round(frames,GST_SECOND,rate));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_TO_FRAMES(clocktime,rate : longint) : longint;
begin
  GST_CLOCK_TIME_TO_FRAMES:=gst_util_uint64_scale_round(clocktime,rate,GST_SECOND);
end;


end.
