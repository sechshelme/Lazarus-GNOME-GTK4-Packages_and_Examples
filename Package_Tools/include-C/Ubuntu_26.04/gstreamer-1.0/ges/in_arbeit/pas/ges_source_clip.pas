unit ges_source_clip;

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
{$include <ges/ges-clip.h>}
{$include <ges/ges-enums.h>}

{GES_DECLARE_TYPE(SourceClip, source_clip, SOURCE_CLIP); }
{*
 * GESSourceClip:
 *
 * Base class for sources of a #GESLayer
  }
{< private > }
{ Padding for API extension  }
type
  PGESSourceClip = ^TGESSourceClip;
  TGESSourceClip = record
      parent : TGESClip;
      priv : PGESSourceClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESSourceClipClass:
  }
{< private > }
{ Padding for API extension  }
  PGESSourceClipClass = ^TGESSourceClipClass;
  TGESSourceClipClass = record
      parent_class : TGESClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:05:36 ===

function GES_TYPE_SOURCE_CLIP: TGType;
function GES_SOURCE_CLIP(obj: Pointer): PGESSourceClip;
function GES_IS_SOURCE_CLIP(obj: Pointer): Tgboolean;
function GES_SOURCE_CLIP_CLASS(klass: Pointer): PGESSourceClipClass;
function GES_IS_SOURCE_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_CLIP_GET_CLASS(obj: Pointer): PGESSourceClipClass;

implementation

function GES_TYPE_SOURCE_CLIP: TGType;
begin
  Result := ges_source_clip_get_type;
end;

function GES_SOURCE_CLIP(obj: Pointer): PGESSourceClip;
begin
  Result := PGESSourceClip(g_type_check_instance_cast(obj, GES_TYPE_SOURCE_CLIP));
end;

function GES_IS_SOURCE_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_SOURCE_CLIP);
end;

function GES_SOURCE_CLIP_CLASS(klass: Pointer): PGESSourceClipClass;
begin
  Result := PGESSourceClipClass(g_type_check_class_cast(klass, GES_TYPE_SOURCE_CLIP));
end;

function GES_IS_SOURCE_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_SOURCE_CLIP);
end;

function GES_SOURCE_CLIP_GET_CLASS(obj: Pointer): PGESSourceClipClass;
begin
  Result := PGESSourceClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESSourceClipPrivate = type Pointer

function ges_source_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
