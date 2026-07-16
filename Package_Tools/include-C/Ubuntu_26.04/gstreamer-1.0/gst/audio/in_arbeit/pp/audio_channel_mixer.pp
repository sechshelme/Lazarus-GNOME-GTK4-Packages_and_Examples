
unit audio_channel_mixer;
interface

{
  Automatically converted by H2Pas 1.0.0 from audio_channel_mixer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    audio_channel_mixer.h
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
Pgpointer  = ^gpointer;
PGstAudioChannelMixer  = ^GstAudioChannelMixer;
PGstAudioChannelMixerFlags  = ^GstAudioChannelMixerFlags;
PGstAudioChannelPosition  = ^GstAudioChannelPosition;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2004 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *           (C) 2015 Wim Taymans <wim.taymans@gmail.com>
 *
 * audio-channel-mixer.h: setup of channel conversion matrices
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
{$ifndef __GST_AUDIO_CHANNEL_MIXER_H__}
{$define __GST_AUDIO_CHANNEL_MIXER_H__}
{$include <gst/gst.h>}
{$include <gst/audio/audio.h>}
type
{*
 * GstAudioChannelMixerFlags:
 * @GST_AUDIO_CHANNEL_MIXER_FLAGS_NONE: no flag
 * @GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_IN: input channels are not interleaved
 * @GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_OUT: output channels are not interleaved
 * @GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_IN: input channels are explicitly unpositioned
 * @GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_OUT: output channels are explicitly unpositioned
 *
 * Flags passed to gst_audio_channel_mixer_new()
  }

  PGstAudioChannelMixerFlags = ^TGstAudioChannelMixerFlags;
  TGstAudioChannelMixerFlags =  Longint;
  Const
    GST_AUDIO_CHANNEL_MIXER_FLAGS_NONE = 0;
    GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_IN = 1 shl 0;
    GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_OUT = 1 shl 1;
    GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_IN = 1 shl 2;
    GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_OUT = 1 shl 3;
;

function gst_audio_channel_mixer_new(flags:TGstAudioChannelMixerFlags; format:TGstAudioFormat; in_channels:Tgint; in_position:PGstAudioChannelPosition; out_channels:Tgint; 
           out_position:PGstAudioChannelPosition):PGstAudioChannelMixer;cdecl;external;
function gst_audio_channel_mixer_new_with_matrix(flags:TGstAudioChannelMixerFlags; format:TGstAudioFormat; in_channels:Tgint; out_channels:Tgint; matrix:PPgfloat):PGstAudioChannelMixer;cdecl;external;
procedure gst_audio_channel_mixer_free(mix:PGstAudioChannelMixer);cdecl;external;
{
 * Checks for passthrough (= identity matrix).
  }
function gst_audio_channel_mixer_is_passthrough(mix:PGstAudioChannelMixer):Tgboolean;cdecl;external;
{
 * Do actual mixing.
  }
(* Const before type ignored *)
procedure gst_audio_channel_mixer_samples(mix:PGstAudioChannelMixer; in:Pgpointer; out:Pgpointer; samples:Tgint);cdecl;external;
{$endif}
{ __GST_AUDIO_CHANNEL_MIXER_H__  }

implementation


end.
