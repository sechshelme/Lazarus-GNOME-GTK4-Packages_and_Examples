unit ges_audio_track;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) <2013> Thibault Saunier <thibault.saunier@collabora.com>
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
{$include <glib-object.h>}
{$include "ges-track.h"}
{$include "ges-types.h"}

{GES_DECLARE_TYPE(AudioTrack, audio_track, AUDIO_TRACK); }
{ Padding for API extension  }
type
  PGESAudioTrackClass = ^TGESAudioTrackClass;
  TGESAudioTrackClass = record
      parent_class : TGESTrackClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESAudioTrack = ^TGESAudioTrack;
  TGESAudioTrack = record
      parent_instance : TGESTrack;
      priv : PGESAudioTrackPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_audio_track_new:PGESAudioTrack;cdecl;external libges;

// === Konventiert am: 27-7-26 19:48:27 ===

function GES_TYPE_AUDIO_TRACK: TGType;
function GES_AUDIO_TRACK(obj: Pointer): PGESAudioTrack;
function GES_IS_AUDIO_TRACK(obj: Pointer): Tgboolean;
function GES_AUDIO_TRACK_CLASS(klass: Pointer): PGESAudioTrackClass;
function GES_IS_AUDIO_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRACK_GET_CLASS(obj: Pointer): PGESAudioTrackClass;

implementation

function GES_TYPE_AUDIO_TRACK: TGType;
begin
  Result := ges_audio_track_get_type;
end;

function GES_AUDIO_TRACK(obj: Pointer): PGESAudioTrack;
begin
  Result := PGESAudioTrack(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TRACK));
end;

function GES_IS_AUDIO_TRACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TRACK);
end;

function GES_AUDIO_TRACK_CLASS(klass: Pointer): PGESAudioTrackClass;
begin
  Result := PGESAudioTrackClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TRACK));
end;

function GES_IS_AUDIO_TRACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TRACK);
end;

function GES_AUDIO_TRACK_GET_CLASS(obj: Pointer): PGESAudioTrackClass;
begin
  Result := PGESAudioTrackClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESAudioTrackPrivate = type Pointer

function ges_audio_track_get_type: TGType; cdecl; external libgxxxxxxx;



end.
