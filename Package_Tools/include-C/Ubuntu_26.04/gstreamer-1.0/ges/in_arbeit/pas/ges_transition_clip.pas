unit ges_transition_clip;

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
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-base-transition-clip.h>}

{GES_DECLARE_TYPE(TransitionClip, transition_clip, TRANSITION_CLIP); }
{*
 * GESTransitionClip:
 * @vtype: a #GESVideoStandardTransitionType indicating the type of video transition
 * to apply.
 *
 * ### Children Properties
 *
 *   libs/GESTransitionClip-children-props.md 
  }
{< private > }
{< public > }
{< private > }
{ Padding for API extension  }
type
  PGESTransitionClip = ^TGESTransitionClip;
  TGESTransitionClip = record
      parent : TGESBaseTransitionClip;
      vtype : TGESVideoStandardTransitionType;
      priv : PGESTransitionClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTransitionClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESTransitionClipClass = ^TGESTransitionClipClass;
  TGESTransitionClipClass = record
      parent_class : TGESBaseTransitionClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_transition_clip_new(vtype:TGESVideoStandardTransitionType):PGESTransitionClip;cdecl;external libges;
function ges_transition_clip_new_for_nick(nick:Pchar):PGESTransitionClip;cdecl;external libges;

// === Konventiert am: 28-7-26 13:18:06 ===

function GES_TYPE_TRANSITION_CLIP: TGType;
function GES_TRANSITION_CLIP(obj: Pointer): PGESTransitionClip;
function GES_IS_TRANSITION_CLIP(obj: Pointer): Tgboolean;
function GES_TRANSITION_CLIP_CLASS(klass: Pointer): PGESTransitionClipClass;
function GES_IS_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESTransitionClipClass;

implementation

function GES_TYPE_TRANSITION_CLIP: TGType;
begin
  Result := ges_transition_clip_get_type;
end;

function GES_TRANSITION_CLIP(obj: Pointer): PGESTransitionClip;
begin
  Result := PGESTransitionClip(g_type_check_instance_cast(obj, GES_TYPE_TRANSITION_CLIP));
end;

function GES_IS_TRANSITION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRANSITION_CLIP);
end;

function GES_TRANSITION_CLIP_CLASS(klass: Pointer): PGESTransitionClipClass;
begin
  Result := PGESTransitionClipClass(g_type_check_class_cast(klass, GES_TYPE_TRANSITION_CLIP));
end;

function GES_IS_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRANSITION_CLIP);
end;

function GES_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESTransitionClipClass;
begin
  Result := PGESTransitionClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTransitionClipPrivate = type Pointer

function ges_transition_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
