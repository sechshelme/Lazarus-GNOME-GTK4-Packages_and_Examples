
unit ges_base_effect;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_base_effect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_base_effect.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGESBaseEffect  = ^GESBaseEffect;
PGESBaseEffectClass  = ^GESBaseEffectClass;
PGESBaseEffectPrivate  = ^GESBaseEffectPrivate;
PGHashTable  = ^GHashTable;
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

{ was #define dname def_expr }
function GES_TYPE_BASE_EFFECT : longint; { return type might be wrong }

{GES_DECLARE_TYPE (BaseEffect, base_effect, BASE_EFFECT); }
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
(* Const before type ignored *)

function ges_base_effect_register_time_property(effect:PGESBaseEffect; child_property_name:Pgchar):Tgboolean;cdecl;external;
function ges_base_effect_set_time_translation_funcs(effect:PGESBaseEffect; source_to_sink_func:TGESBaseEffectTimeTranslationFunc; sink_to_source_func:TGESBaseEffectTimeTranslationFunc; user_data:Tgpointer; destroy:TGDestroyNotify):Tgboolean;cdecl;external;
function ges_base_effect_is_time_effect(effect:PGESBaseEffect):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_BASE_EFFECT : longint; { return type might be wrong }
  begin
    GES_TYPE_BASE_EFFECT:=ges_base_effect_get_type;
  end;


end.
