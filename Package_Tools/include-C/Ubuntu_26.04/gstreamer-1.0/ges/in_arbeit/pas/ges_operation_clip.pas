unit ges_operation_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Edward Hervey <edward.hervey@collabora.co.uk>
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
{$include <gst/gst.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-clip.h>}

{GES_DECLARE_TYPE(OperationClip, operation_clip, OPERATION_CLIP); }
{*
 * GESOperationClip:
 *
 * The GESOperationClip subclass. Subclasses can access these fields.
  }
{< private > }
{ Padding for API extension  }
type
  PGESOperationClip = ^TGESOperationClip;
  TGESOperationClip = record
      parent : TGESClip;
      priv : PGESOperationClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESOperationClipClass:
  }
{< private > }
{< private > }
{ Padding for API extension  }
  PGESOperationClipClass = ^TGESOperationClipClass;
  TGESOperationClipClass = record
      parent_class : TGESClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:06:08 ===

function GES_TYPE_OPERATION_CLIP: TGType;
function GES_OPERATION_CLIP(obj: Pointer): PGESOperationClip;
function GES_IS_OPERATION_CLIP(obj: Pointer): Tgboolean;
function GES_OPERATION_CLIP_CLASS(klass: Pointer): PGESOperationClipClass;
function GES_IS_OPERATION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_OPERATION_CLIP_GET_CLASS(obj: Pointer): PGESOperationClipClass;

implementation

function GES_TYPE_OPERATION_CLIP: TGType;
begin
  Result := ges_operation_clip_get_type;
end;

function GES_OPERATION_CLIP(obj: Pointer): PGESOperationClip;
begin
  Result := PGESOperationClip(g_type_check_instance_cast(obj, GES_TYPE_OPERATION_CLIP));
end;

function GES_IS_OPERATION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OPERATION_CLIP);
end;

function GES_OPERATION_CLIP_CLASS(klass: Pointer): PGESOperationClipClass;
begin
  Result := PGESOperationClipClass(g_type_check_class_cast(klass, GES_TYPE_OPERATION_CLIP));
end;

function GES_IS_OPERATION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OPERATION_CLIP);
end;

function GES_OPERATION_CLIP_GET_CLASS(obj: Pointer): PGESOperationClipClass;
begin
  Result := PGESOperationClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESOperationClipPrivate = type Pointer

function ges_operation_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
