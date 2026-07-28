unit ges_video_track;

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

{GES_DECLARE_TYPE(VideoTrack, video_track, VIDEO_TRACK); }
{ Padding for API extension  }
type
  PGESVideoTrackClass = ^TGESVideoTrackClass;
  TGESVideoTrackClass = record
      parent_class : TGESTrackClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESVideoTrack = ^TGESVideoTrack;
  TGESVideoTrack = record
      parent_instance : TGESTrack;
      priv : PGESVideoTrackPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_video_track_new:PGESVideoTrack;cdecl;external libges;

// === Konventiert am: 28-7-26 13:21:41 ===

function GES_TYPE_VIDEO_TRACK: TGType;
function GES_VIDEO_TRACK(obj: Pointer): PGESVideoTrack;
function GES_IS_VIDEO_TRACK(obj: Pointer): Tgboolean;
function GES_VIDEO_TRACK_CLASS(klass: Pointer): PGESVideoTrackClass;
function GES_IS_VIDEO_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TRACK_GET_CLASS(obj: Pointer): PGESVideoTrackClass;

implementation

function GES_TYPE_VIDEO_TRACK: TGType;
begin
  Result := ges_video_track_get_type;
end;

function GES_VIDEO_TRACK(obj: Pointer): PGESVideoTrack;
begin
  Result := PGESVideoTrack(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TRACK));
end;

function GES_IS_VIDEO_TRACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TRACK);
end;

function GES_VIDEO_TRACK_CLASS(klass: Pointer): PGESVideoTrackClass;
begin
  Result := PGESVideoTrackClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TRACK));
end;

function GES_IS_VIDEO_TRACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TRACK);
end;

function GES_VIDEO_TRACK_GET_CLASS(obj: Pointer): PGESVideoTrackClass;
begin
  Result := PGESVideoTrackClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESVideoTrackPrivate = type Pointer

function ges_video_track_get_type: TGType; cdecl; external libgxxxxxxx;



end.
