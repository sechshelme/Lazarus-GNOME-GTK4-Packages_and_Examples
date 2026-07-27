unit ges_audio_transition;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <ges/ges-transition.h>}

{GES_DECLARE_TYPE(AudioTransition, audio_transition, AUDIO_TRANSITION); }
{*
 * GESAudioTransition:
 *
  }
{< private > }
{ Padding for API extension  }
type
  PGESAudioTransition = ^TGESAudioTransition;
  TGESAudioTransition = record
      parent : TGESTransition;
      priv : PGESAudioTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ Padding for API extension  }
  PGESAudioTransitionClass = ^TGESAudioTransitionClass;
  TGESAudioTransitionClass = record
      parent_class : TGESTransitionClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{xxxxxx GES_DEPRECATED }

function ges_audio_transition_new:PGESAudioTransition;cdecl;external libges;

// === Konventiert am: 27-7-26 19:48:23 ===

function GES_TYPE_AUDIO_TRANSITION: TGType;
function GES_AUDIO_TRANSITION(obj: Pointer): PGESAudioTransition;
function GES_IS_AUDIO_TRANSITION(obj: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_CLASS(klass: Pointer): PGESAudioTransitionClass;
function GES_IS_AUDIO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_GET_CLASS(obj: Pointer): PGESAudioTransitionClass;

implementation

function GES_TYPE_AUDIO_TRANSITION: TGType;
begin
  Result := ges_audio_transition_get_type;
end;

function GES_AUDIO_TRANSITION(obj: Pointer): PGESAudioTransition;
begin
  Result := PGESAudioTransition(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TRANSITION));
end;

function GES_IS_AUDIO_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TRANSITION);
end;

function GES_AUDIO_TRANSITION_CLASS(klass: Pointer): PGESAudioTransitionClass;
begin
  Result := PGESAudioTransitionClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TRANSITION));
end;

function GES_IS_AUDIO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TRANSITION);
end;

function GES_AUDIO_TRANSITION_GET_CLASS(obj: Pointer): PGESAudioTransitionClass;
begin
  Result := PGESAudioTransitionClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESAudioTransitionPrivate = type Pointer

function ges_audio_transition_get_type: TGType; cdecl; external libgxxxxxxx;



end.
