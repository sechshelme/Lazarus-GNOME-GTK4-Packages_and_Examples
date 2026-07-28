unit ges_overlay_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
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
{$include <ges/ges-operation-clip.h>}

{GES_DECLARE_TYPE(OverlayClip, overlay_clip, OVERLAY_CLIP); }
{*
 * GESOverlayClip:
  }
{< private > }
{ Padding for API extension  }
type
  PGESOverlayClip = ^TGESOverlayClip;
  TGESOverlayClip = record
      parent : TGESOperationClip;
      priv : PGESOverlayClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESOverlayClipClass:
 * @parent_class: parent class
  }
{< private > }
{ Padding for API extension  }
  PGESOverlayClipClass = ^TGESOverlayClipClass;
  TGESOverlayClipClass = record
      parent_class : TGESOperationClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:06:03 ===

function GES_TYPE_OVERLAY_CLIP: TGType;
function GES_OVERLAY_CLIP(obj: Pointer): PGESOverlayClip;
function GES_IS_OVERLAY_CLIP(obj: Pointer): Tgboolean;
function GES_OVERLAY_CLIP_CLASS(klass: Pointer): PGESOverlayClipClass;
function GES_IS_OVERLAY_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_OVERLAY_CLIP_GET_CLASS(obj: Pointer): PGESOverlayClipClass;

implementation

function GES_TYPE_OVERLAY_CLIP: TGType;
begin
  Result := ges_overlay_clip_get_type;
end;

function GES_OVERLAY_CLIP(obj: Pointer): PGESOverlayClip;
begin
  Result := PGESOverlayClip(g_type_check_instance_cast(obj, GES_TYPE_OVERLAY_CLIP));
end;

function GES_IS_OVERLAY_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OVERLAY_CLIP);
end;

function GES_OVERLAY_CLIP_CLASS(klass: Pointer): PGESOverlayClipClass;
begin
  Result := PGESOverlayClipClass(g_type_check_class_cast(klass, GES_TYPE_OVERLAY_CLIP));
end;

function GES_IS_OVERLAY_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OVERLAY_CLIP);
end;

function GES_OVERLAY_CLIP_GET_CLASS(obj: Pointer): PGESOverlayClipClass;
begin
  Result := PGESOverlayClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESOverlayClipPrivate = type Pointer

function ges_overlay_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
