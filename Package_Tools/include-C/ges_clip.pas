unit ges_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

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
{$include <gst/gst.h>}
{$include <ges/ges-timeline-element.h>}
{$include <ges/ges-container.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track.h>}

{GES_DECLARE_TYPE(Clip, clip, CLIP); }
{*
 * GES_CLIP_CLASS_CAN_ADD_EFFECTS:
 * @klass: A #GESClipClass
 *
 * Whether the class allows for the user to add additional non-core
 * #GESBaseEffect-s to clips from this class.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass : longint) : longint;

{*
 * GESFillTrackElementFunc:
 * @clip: The #GESClip controlling the track elements
 * @track_element: The #GESTrackElement
 * @nleobj: The nleobject that needs to be filled
 *
 * A function that will be called when the nleobject of a corresponding
 * track element needs to be filled.
 *
 * The implementer of this function shall add the proper #GstElement to @nleobj
 * using gst_bin_add().
 *
 * Deprecated: 1.18: This method type is no longer used.
 *
 * Returns: %TRUE if the implementer successfully filled the @nleobj.
  }
type

  TGESFillTrackElementFunc = function (clip:PGESClip; track_element:PGESTrackElement; nleobj:PGstElement):Tgboolean;cdecl;

// === Konventiert am: 18-12-24 17:39:53 ===

function GES_TYPE_CLIP: TGType;
function GES_CLIP(obj: Pointer): PGESClip;
function GES_IS_CLIP(obj: Pointer): Tgboolean;
function GES_CLIP_CLASS(klass: Pointer): PGESClipClass;
function GES_IS_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_CLIP_GET_CLASS(obj: Pointer): PGESClipClass;

implementation

function GES_TYPE_CLIP: TGType;
begin
  Result := ges_clip_get_type;
end;

function GES_CLIP(obj: Pointer): PGESClip;
begin
  Result := PGESClip(g_type_check_instance_cast(obj, GES_TYPE_CLIP));
end;

function GES_IS_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_CLIP);
end;

function GES_CLIP_CLASS(klass: Pointer): PGESClipClass;
begin
  Result := PGESClipClass(g_type_check_class_cast(klass, GES_TYPE_CLIP));
end;

function GES_IS_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_CLIP);
end;

function GES_CLIP_GET_CLASS(obj: Pointer): PGESClipClass;
begin
  Result := PGESClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGESClipPrivate = record
  end;
  PGESClipPrivate = ^TGESClipPrivate;

function ges_clip_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass : longint) : longint;
begin
  GES_CLIP_CLASS_CAN_ADD_EFFECTS:=(GES_CLIP_CLASS(klass))^.(ABI.(abi.can_add_effects));
end;


end.
