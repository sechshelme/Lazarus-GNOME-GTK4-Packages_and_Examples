unit ges_base_effect_clip;

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

{GES_DECLARE_TYPE(BaseEffectClip, base_effect_clip, BASE_EFFECT_CLIP); }
{*
 * GESBaseEffectClip:
  }
{< private > }
{ Padding for API extension  }
type
  PGESBaseEffectClip = ^TGESBaseEffectClip;
  TGESBaseEffectClip = record
      parent : TGESOperationClip;
      priv : PGESBaseEffectClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESBaseEffectClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESBaseEffectClipClass = ^TGESBaseEffectClipClass;
  TGESBaseEffectClipClass = record
      parent_class : TGESOperationClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:48:04 ===

function GES_TYPE_BASE_EFFECT_CLIP: TGType;
function GES_BASE_EFFECT_CLIP(obj: Pointer): PGESBaseEffectClip;
function GES_IS_BASE_EFFECT_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_CLASS(klass: Pointer): PGESBaseEffectClipClass;
function GES_IS_BASE_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESBaseEffectClipClass;

implementation

function GES_TYPE_BASE_EFFECT_CLIP: TGType;
begin
  Result := ges_base_effect_clip_get_type;
end;

function GES_BASE_EFFECT_CLIP(obj: Pointer): PGESBaseEffectClip;
begin
  Result := PGESBaseEffectClip(g_type_check_instance_cast(obj, GES_TYPE_BASE_EFFECT_CLIP));
end;

function GES_IS_BASE_EFFECT_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_EFFECT_CLIP);
end;

function GES_BASE_EFFECT_CLIP_CLASS(klass: Pointer): PGESBaseEffectClipClass;
begin
  Result := PGESBaseEffectClipClass(g_type_check_class_cast(klass, GES_TYPE_BASE_EFFECT_CLIP));
end;

function GES_IS_BASE_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_EFFECT_CLIP);
end;

function GES_BASE_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESBaseEffectClipClass;
begin
  Result := PGESBaseEffectClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESBaseEffectClipPrivate = type Pointer

function ges_base_effect_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
