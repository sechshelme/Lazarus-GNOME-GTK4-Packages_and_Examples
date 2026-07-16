unit streamvolume;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer StreamVolume
 * Copyright (C) 2009 Sebastian Dröge <sebastian.droege@collabora.co.uk>
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
{$ifndef __GST_STREAM_VOLUME_H__}
{$define __GST_STREAM_VOLUME_H__}
{$include <gst/gst.h>}
{$include <gst/audio/audio-prelude.h>}

{G_DECLARE_INTERFACE (GstStreamVolume, gst_stream_volume, GST, STREAM_VOLUME,    GObject) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_VOLUME_GET_INTERFACE(obj : longint) : longint;

type
  PGstStreamVolumeInterface = ^TGstStreamVolumeInterface;
  TGstStreamVolumeInterface = record
      iface : TGTypeInterface;
    end;

{*
 * GstStreamVolumeFormat:
 * @GST_STREAM_VOLUME_FORMAT_LINEAR: Linear scale factor, 1.0 = 100%
 * @GST_STREAM_VOLUME_FORMAT_CUBIC: Cubic volume scale
 * @GST_STREAM_VOLUME_FORMAT_DB: Logarithmic volume scale (dB, amplitude not power)
 *
 * Different representations of a stream volume. gst_stream_volume_convert_volume()
 * allows to convert between the different representations.
 *
 * Formulas to convert from a linear to a cubic or dB volume are
 * cbrt(val) and 20 * log10 (val).
  }

  PGstStreamVolumeFormat = ^TGstStreamVolumeFormat;
  TGstStreamVolumeFormat =  Longint;
  Const
    GST_STREAM_VOLUME_FORMAT_LINEAR = 0;
    GST_STREAM_VOLUME_FORMAT_CUBIC = 1;
    GST_STREAM_VOLUME_FORMAT_DB = 2;
;

procedure gst_stream_volume_set_volume(volume:PGstStreamVolume; format:TGstStreamVolumeFormat; val:Tgdouble);cdecl;external libgstaudio;
function gst_stream_volume_get_volume(volume:PGstStreamVolume; format:TGstStreamVolumeFormat):Tgdouble;cdecl;external libgstaudio;
procedure gst_stream_volume_set_mute(volume:PGstStreamVolume; mute:Tgboolean);cdecl;external libgstaudio;
function gst_stream_volume_get_mute(volume:PGstStreamVolume):Tgboolean;cdecl;external libgstaudio;
function gst_stream_volume_convert_volume(from:TGstStreamVolumeFormat; to:TGstStreamVolumeFormat; val:Tgdouble):Tgdouble;cdecl;external libgstaudio;
{$endif}
{ __GST_STREAM_VOLUME_H__  }

// === Konventiert am: 16-7-26 15:26:06 ===

function GST_TYPE_STREAM_VOLUME: TGType;
function GST_STREAM_VOLUME(obj: Pointer): PGstStreamVolume;
function GST_IS_STREAM_VOLUME(obj: Pointer): Tgboolean;
function GST_STREAM_VOLUME_GET_IFACE(obj: Pointer): PGstStreamVolumeInterface;

implementation

function GST_TYPE_STREAM_VOLUME: TGType;
begin
  Result := gst_stream_volume_get_type;
end;

function GST_STREAM_VOLUME(obj: Pointer): PGstStreamVolume;
begin
  Result := PGstStreamVolume(g_type_check_instance_cast(obj, GST_TYPE_STREAM_VOLUME));
end;

function GST_IS_STREAM_VOLUME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_STREAM_VOLUME);
end;

function GST_STREAM_VOLUME_GET_IFACE(obj: Pointer): PGstStreamVolumeInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_STREAM_VOLUME);
end;

type 
  PGstStreamVolume = type Pointer;

  PGstStreamVolumeInterface = type Pointer

function gst_stream_volume_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_VOLUME_GET_INTERFACE(obj : longint) : longint;
begin
  GST_STREAM_VOLUME_GET_INTERFACE:=GST_STREAM_VOLUME_GET_IFACE(obj);
end;


end.
