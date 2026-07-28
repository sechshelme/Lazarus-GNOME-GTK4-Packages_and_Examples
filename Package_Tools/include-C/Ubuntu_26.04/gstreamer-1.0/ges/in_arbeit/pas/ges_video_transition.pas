unit ges_video_transition;

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

{GES_DECLARE_TYPE(VideoTransition, video_transition, VIDEO_TRANSITION); }
{*
 * GESVideoTransition:
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoTransition = ^TGESVideoTransition;
  TGESVideoTransition = record
      parent : TGESTransition;
      priv : PGESVideoTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESVideoTransitionClass:
 * @parent_class: parent class
 *
  }
{< private > }
{ Padding for API extension  }
  PGESVideoTransitionClass = ^TGESVideoTransitionClass;
  TGESVideoTransitionClass = record
      parent_class : TGESTransitionClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{xxxxxxxGES_DEPRECATED }

function ges_video_transition_new:PGESVideoTransition;cdecl;external libges;
function ges_video_transition_set_transition_type(self:PGESVideoTransition; _type:TGESVideoStandardTransitionType):Tgboolean;cdecl;external libges;
function ges_video_transition_get_transition_type(trans:PGESVideoTransition):TGESVideoStandardTransitionType;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_children_properties) }
procedure ges_video_transition_set_border(self:PGESVideoTransition; value:Tguint);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_get_children_properties) }
function ges_video_transition_get_border(self:PGESVideoTransition):Tgint;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_children_properties) }
procedure ges_video_transition_set_inverted(self:PGESVideoTransition; inverted:Tgboolean);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_get_children_properties) }
function ges_video_transition_is_inverted(self:PGESVideoTransition):Tgboolean;cdecl;external libges;

// === Konventiert am: 28-7-26 13:21:45 ===

function GES_TYPE_VIDEO_TRANSITION: TGType;
function GES_VIDEO_TRANSITION(obj: Pointer): PGESVideoTransition;
function GES_IS_VIDEO_TRANSITION(obj: Pointer): Tgboolean;
function GES_VIDEO_TRANSITION_CLASS(klass: Pointer): PGESVideoTransitionClass;
function GES_IS_VIDEO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TRANSITION_GET_CLASS(obj: Pointer): PGESVideoTransitionClass;

implementation

function GES_TYPE_VIDEO_TRANSITION: TGType;
begin
  Result := ges_video_transition_get_type;
end;

function GES_VIDEO_TRANSITION(obj: Pointer): PGESVideoTransition;
begin
  Result := PGESVideoTransition(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TRANSITION));
end;

function GES_IS_VIDEO_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TRANSITION);
end;

function GES_VIDEO_TRANSITION_CLASS(klass: Pointer): PGESVideoTransitionClass;
begin
  Result := PGESVideoTransitionClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TRANSITION));
end;

function GES_IS_VIDEO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TRANSITION);
end;

function GES_VIDEO_TRANSITION_GET_CLASS(obj: Pointer): PGESVideoTransitionClass;
begin
  Result := PGESVideoTransitionClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESVideoTransitionPrivate = type Pointer

function ges_video_transition_get_type: TGType; cdecl; external libgxxxxxxx;



end.
