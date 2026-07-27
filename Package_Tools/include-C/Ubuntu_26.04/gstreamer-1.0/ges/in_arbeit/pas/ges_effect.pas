unit ges_effect;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Thibault Saunier <thibault.saunier@collabora.co.uk>
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
{$include <ges/ges-base-effect.h>}

{GES_DECLARE_TYPE(Effect, effect, EFFECT); }
{*
 * GESEffect:
 *
  }
{< private >  }
{ Padding for API extension  }
type
  PGESEffect = ^TGESEffect;
  TGESEffect = record
      parent : TGESBaseEffect;
      priv : PGESEffectPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESEffectClass:
 * @parent_class: parent class
  }
{< private >  }
{ Padding for API extension  }
  PGESEffectClass = ^TGESEffectClass;
  TGESEffectClass = record
      parent_class : TGESBaseEffectClass;
      rate_properties : PGList;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_effect_new(bin_description:Pgchar):PGESEffect;cdecl;external libges;
function ges_effect_class_register_rate_property(klass:PGESEffectClass; element_name:Pgchar; property_name:Pgchar):Tgboolean;cdecl;external libges;

// === Konventiert am: 27-7-26 19:54:59 ===

function GES_TYPE_EFFECT: TGType;
function GES_EFFECT(obj: Pointer): PGESEffect;
function GES_IS_EFFECT(obj: Pointer): Tgboolean;
function GES_EFFECT_CLASS(klass: Pointer): PGESEffectClass;
function GES_IS_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_GET_CLASS(obj: Pointer): PGESEffectClass;

implementation

function GES_TYPE_EFFECT: TGType;
begin
  Result := ges_effect_get_type;
end;

function GES_EFFECT(obj: Pointer): PGESEffect;
begin
  Result := PGESEffect(g_type_check_instance_cast(obj, GES_TYPE_EFFECT));
end;

function GES_IS_EFFECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT);
end;

function GES_EFFECT_CLASS(klass: Pointer): PGESEffectClass;
begin
  Result := PGESEffectClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT));
end;

function GES_IS_EFFECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT);
end;

function GES_EFFECT_GET_CLASS(obj: Pointer): PGESEffectClass;
begin
  Result := PGESEffectClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESEffectPrivate = type Pointer

function ges_effect_get_type: TGType; cdecl; external libgxxxxxxx;



end.
