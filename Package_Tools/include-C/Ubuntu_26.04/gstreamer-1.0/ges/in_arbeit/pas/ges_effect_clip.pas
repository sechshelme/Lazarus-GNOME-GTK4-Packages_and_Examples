unit ges_effect_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2011 Thibault Saunier <thibault.saunier@collabora.co.uk>
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
{$include <ges/ges-types.h>}

{GES_DECLARE_TYPE(EffectClip, effect_clip, EFFECT_CLIP); }
{*
 * GESEffectClip:
  }
{< private > }
{ Padding for API extension  }
type
  PGESEffectClip = ^TGESEffectClip;
  TGESEffectClip = record
      parent : TGESBaseEffectClip;
      priv : PGESEffectClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESEffectClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESEffectClipClass = ^TGESEffectClipClass;
  TGESEffectClipClass = record
      parent_class : TGESBaseEffectClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_effect_clip_new(video_bin_description:Pgchar; audio_bin_description:Pgchar):PGESEffectClip;cdecl;external libges;

// === Konventiert am: 27-7-26 19:54:51 ===

function GES_TYPE_EFFECT_CLIP: TGType;
function GES_EFFECT_CLIP(obj: Pointer): PGESEffectClip;
function GES_IS_EFFECT_CLIP(obj: Pointer): Tgboolean;
function GES_EFFECT_CLIP_CLASS(klass: Pointer): PGESEffectClipClass;
function GES_IS_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESEffectClipClass;

implementation

function GES_TYPE_EFFECT_CLIP: TGType;
begin
  Result := ges_effect_clip_get_type;
end;

function GES_EFFECT_CLIP(obj: Pointer): PGESEffectClip;
begin
  Result := PGESEffectClip(g_type_check_instance_cast(obj, GES_TYPE_EFFECT_CLIP));
end;

function GES_IS_EFFECT_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT_CLIP);
end;

function GES_EFFECT_CLIP_CLASS(klass: Pointer): PGESEffectClipClass;
begin
  Result := PGESEffectClipClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT_CLIP));
end;

function GES_IS_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT_CLIP);
end;

function GES_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESEffectClipClass;
begin
  Result := PGESEffectClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESEffectClipPrivate = type Pointer

function ges_effect_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
