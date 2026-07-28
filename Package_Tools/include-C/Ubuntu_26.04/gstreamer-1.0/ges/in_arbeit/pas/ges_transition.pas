unit ges_transition;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon@collabora.co.uk>
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
{$include <gst/controller/gstinterpolationcontrolsource.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-operation.h>}

{GES_DECLARE_TYPE(Transition, transition, TRANSITION); }
{*
 * GESTransition:
 *
 * Base class for media transitions.
  }
{< private > }
{ Padding for API extension  }
type
  PGESTransition = ^TGESTransition;
  TGESTransition = record
      parent : TGESOperation;
      priv : PGESTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTransitionClass:
  }
{< private > }
{< private > }
{ Padding for API extension  }
  PGESTransitionClass = ^TGESTransitionClass;
  TGESTransitionClass = record
      parent_class : TGESOperationClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:18:11 ===

function GES_TYPE_TRANSITION: TGType;
function GES_TRANSITION(obj: Pointer): PGESTransition;
function GES_IS_TRANSITION(obj: Pointer): Tgboolean;
function GES_TRANSITION_CLASS(klass: Pointer): PGESTransitionClass;
function GES_IS_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_TRANSITION_GET_CLASS(obj: Pointer): PGESTransitionClass;

implementation

function GES_TYPE_TRANSITION: TGType;
begin
  Result := ges_transition_get_type;
end;

function GES_TRANSITION(obj: Pointer): PGESTransition;
begin
  Result := PGESTransition(g_type_check_instance_cast(obj, GES_TYPE_TRANSITION));
end;

function GES_IS_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRANSITION);
end;

function GES_TRANSITION_CLASS(klass: Pointer): PGESTransitionClass;
begin
  Result := PGESTransitionClass(g_type_check_class_cast(klass, GES_TYPE_TRANSITION));
end;

function GES_IS_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRANSITION);
end;

function GES_TRANSITION_GET_CLASS(obj: Pointer): PGESTransitionClass;
begin
  Result := PGESTransitionClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTransitionPrivate = type Pointer

function ges_transition_get_type: TGType; cdecl; external libgxxxxxxx;



end.
