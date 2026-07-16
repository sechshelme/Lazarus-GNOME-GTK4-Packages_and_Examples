
unit audio_buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from audio_buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    audio_buffer.h
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
Pgpointer  = ^gpointer;
PGstAudioBuffer  = ^GstAudioBuffer;
PGstAudioInfo  = ^GstAudioInfo;
PGstBuffer  = ^GstBuffer;
PGstMapInfo  = ^GstMapInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018> Collabora Ltd.
 *   @author George Kiagiadakis <george.kiagiadakis@collabora.com>
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
{$ifndef __GST_AUDIO_BUFFER_H__}
{$define __GST_AUDIO_BUFFER_H__}
{*
 * GstAudioBuffer:
 * @info: a #GstAudioInfo describing the audio properties of this buffer
 * @n_samples: the size of the buffer in samples
 * @n_planes: the number of planes available
 * @planes: an array of @n_planes pointers pointing to the start of each
 *   plane in the mapped buffer
 * @buffer: the mapped buffer
 *
 * A structure containing the result of an audio buffer map operation,
 * which is executed with gst_audio_buffer_map(). For non-interleaved (planar)
 * buffers, the beginning of each channel in the buffer has its own pointer in
 * the @planes array. For interleaved buffers, the @planes array only contains
 * one item, which is the pointer to the beginning of the buffer, and @n_planes
 * equals 1.
 *
 * The different channels in @planes are always in the GStreamer channel order.
 *
 * Since: 1.16
  }
{< private > }
type
  PGstAudioBuffer = ^TGstAudioBuffer;
  TGstAudioBuffer = record
      info : TGstAudioInfo;
      n_samples : Tgsize;
      n_planes : Tgint;
      planes : Pgpointer;
      buffer : PGstBuffer;
      map_infos : PGstMapInfo;
      priv_planes_arr : array[0..7] of Tgpointer;
      priv_map_infos_arr : array[0..7] of TGstMapInfo;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
{*
 * GST_AUDIO_BUFFER_INIT:
 *
 * Initializer for #GstAudioBuffer
 *
 * Since: 1.28
  }
(* Const before type ignored *)

function gst_audio_buffer_map(buffer:PGstAudioBuffer; info:PGstAudioInfo; gstbuffer:PGstBuffer; flags:TGstMapFlags):Tgboolean;cdecl;external;
procedure gst_audio_buffer_unmap(buffer:PGstAudioBuffer);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_FORMAT(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_CHANNELS(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_LAYOUT(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_RATE(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_WIDTH(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_DEPTH(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_SAMPLE_STRIDE(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_BPS(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_BPF(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_N_SAMPLES(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_N_PLANES(b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_PLANE_DATA(b,p : longint) : longint;

{ the size of each plane in bytes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_PLANE_SIZE(b : longint) : longint;

{$endif}
{ __GST_AUDIO_BUFFER_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_FORMAT(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_FORMAT:=GST_AUDIO_INFO_FORMAT(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_CHANNELS(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_CHANNELS:=GST_AUDIO_INFO_CHANNELS(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_LAYOUT(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_LAYOUT:=GST_AUDIO_INFO_LAYOUT(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_RATE(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_RATE:=GST_AUDIO_INFO_RATE(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_WIDTH(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_WIDTH:=GST_AUDIO_INFO_WIDTH(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_DEPTH(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_DEPTH:=GST_AUDIO_INFO_DEPTH(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_SAMPLE_STRIDE(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_SAMPLE_STRIDE:=(GST_AUDIO_INFO_WIDTH(@(b^.info))) shr 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_BPS(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_BPS:=(GST_AUDIO_INFO_DEPTH(@(b^.info))) shr 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_BPF(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_BPF:=GST_AUDIO_INFO_BPF(@(b^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_N_SAMPLES(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_N_SAMPLES:=b^.n_samples;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_N_PLANES(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_N_PLANES:=b^.n_planes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_PLANE_DATA(b,p : longint) : longint;
begin
  GST_AUDIO_BUFFER_PLANE_DATA:=b^.(planes[p]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BUFFER_PLANE_SIZE(b : longint) : longint;
begin
  GST_AUDIO_BUFFER_PLANE_SIZE:=(((GST_AUDIO_BUFFER_N_SAMPLES(b))*(GST_AUDIO_BUFFER_SAMPLE_STRIDE(b)))*(GST_AUDIO_BUFFER_CHANNELS(b)))/(GST_AUDIO_BUFFER_N_PLANES(b));
end;


end.
