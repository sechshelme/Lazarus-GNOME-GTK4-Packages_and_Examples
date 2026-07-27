unit ges_base_effect;

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
{$include <ges/ges-operation.h>}

{GES_DECLARE_TYPE(BaseEffect, base_effect, BASE_EFFECT); }
{*
 * GESBaseEffect:
  }
{< private >  }
{ Padding for API extension  }
type
  PGESBaseEffect = ^TGESBaseEffect;
  TGESBaseEffect = record
      parent : TGESOperation;
      priv : PGESBaseEffectPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESBaseEffectClass:
 * @parent_class: parent class
  }
{< private >  }
{ Padding for API extension  }
  PGESBaseEffectClass = ^TGESBaseEffectClass;
  TGESBaseEffectClass = record
      parent_class : TGESOperationClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESBaseEffectTimeTranslationFunc:
 * @effect: The #GESBaseEffect that is doing the time translation
 * @time: The #GstClockTime to translation
 * @time_property_values: (element-type gchar* GValue*): A table of child
 * property name/value pairs
 * @user_data: Data passed to ges_base_effect_set_time_translation_funcs()
 *
 * A function for querying how an effect would translate a time if it had
 * the given child property values set. The keys for @time_properties will
 * be the same string that was passed to
 * ges_base_effect_register_time_property(), the values will be #GValue*
 * values of the corresponding child properties. You should always use the
 * values given in @time_properties before using the currently set values.
 *
 * Returns: The translated time.
 * Since: 1.18
  }

  TGESBaseEffectTimeTranslationFunc = function (effect:PGESBaseEffect; time:TGstClockTime; time_property_values:PGHashTable; user_data:Tgpointer):TGstClockTime;cdecl;

function ges_base_effect_register_time_property(effect:PGESBaseEffect; child_property_name:Pgchar):Tgboolean;cdecl;external libges;
function ges_base_effect_set_time_translation_funcs(effect:PGESBaseEffect; source_to_sink_func:TGESBaseEffectTimeTranslationFunc; sink_to_source_func:TGESBaseEffectTimeTranslationFunc; user_data:Tgpointer; destroy:TGDestroyNotify):Tgboolean;cdecl;external libges;
function ges_base_effect_is_time_effect(effect:PGESBaseEffect):Tgboolean;cdecl;external libges;

// === Konventiert am: 27-7-26 19:48:09 ===

function GES_TYPE_BASE_EFFECT: TGType;
function GES_BASE_EFFECT(obj: Pointer): PGESBaseEffect;
function GES_IS_BASE_EFFECT(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLASS(klass: Pointer): PGESBaseEffectClass;
function GES_IS_BASE_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_GET_CLASS(obj: Pointer): PGESBaseEffectClass;

implementation

function GES_TYPE_BASE_EFFECT: TGType;
begin
  Result := ges_base_effect_get_type;
end;

function GES_BASE_EFFECT(obj: Pointer): PGESBaseEffect;
begin
  Result := PGESBaseEffect(g_type_check_instance_cast(obj, GES_TYPE_BASE_EFFECT));
end;

function GES_IS_BASE_EFFECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_EFFECT);
end;

function GES_BASE_EFFECT_CLASS(klass: Pointer): PGESBaseEffectClass;
begin
  Result := PGESBaseEffectClass(g_type_check_class_cast(klass, GES_TYPE_BASE_EFFECT));
end;

function GES_IS_BASE_EFFECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_EFFECT);
end;

function GES_BASE_EFFECT_GET_CLASS(obj: Pointer): PGESBaseEffectClass;
begin
  Result := PGESBaseEffectClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESBaseEffectPrivate = type Pointer

function ges_base_effect_get_type: TGType; cdecl; external libgxxxxxxx;



end.
