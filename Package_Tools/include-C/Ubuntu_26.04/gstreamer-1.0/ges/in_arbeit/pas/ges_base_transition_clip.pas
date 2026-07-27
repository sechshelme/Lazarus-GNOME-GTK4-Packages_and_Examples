unit ges_base_transition_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
{$include "ges-operation-clip.h"}
{$include <glib-object.h>}
{$include <ges/ges-types.h>}

{GES_DECLARE_TYPE(BaseTransitionClip, base_transition_clip, BASE_TRANSITION_CLIP); }
{*
 * GESBaseTransitionClip:
  }
{< private > }
{< private > }
{ Padding for API extension  }
type
  PGESBaseTransitionClip = ^TGESBaseTransitionClip;
  TGESBaseTransitionClip = record
      parent : TGESOperationClip;
      priv : PGESBaseTransitionClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESBaseTransitionClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESBaseTransitionClipClass = ^TGESBaseTransitionClipClass;
  TGESBaseTransitionClipClass = record
      parent_class : TGESOperationClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:47:58 ===

function GES_TYPE_BASE_TRANSITION_CLIP: TGType;
function GES_BASE_TRANSITION_CLIP(obj: Pointer): PGESBaseTransitionClip;
function GES_IS_BASE_TRANSITION_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): PGESBaseTransitionClipClass;
function GES_IS_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESBaseTransitionClipClass;

implementation

function GES_TYPE_BASE_TRANSITION_CLIP: TGType;
begin
  Result := ges_base_transition_clip_get_type;
end;

function GES_BASE_TRANSITION_CLIP(obj: Pointer): PGESBaseTransitionClip;
begin
  Result := PGESBaseTransitionClip(g_type_check_instance_cast(obj, GES_TYPE_BASE_TRANSITION_CLIP));
end;

function GES_IS_BASE_TRANSITION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_TRANSITION_CLIP);
end;

function GES_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): PGESBaseTransitionClipClass;
begin
  Result := PGESBaseTransitionClipClass(g_type_check_class_cast(klass, GES_TYPE_BASE_TRANSITION_CLIP));
end;

function GES_IS_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_TRANSITION_CLIP);
end;

function GES_BASE_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESBaseTransitionClipClass;
begin
  Result := PGESBaseTransitionClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESBaseTransitionClipPrivate = type Pointer

function ges_base_transition_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
