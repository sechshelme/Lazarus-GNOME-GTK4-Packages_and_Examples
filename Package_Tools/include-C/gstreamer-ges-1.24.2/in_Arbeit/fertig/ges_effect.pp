
unit ges_effect;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_effect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_effect.h
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
PGESEffect  = ^GESEffect;
PGESEffectClass  = ^GESEffectClass;
PGESEffectPrivate  = ^GESEffectPrivate;
PGList  = ^GList;
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

{ was #define dname def_expr }
function GES_TYPE_EFFECT : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Effect, effect, EFFECT); }
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

(* Const before type ignored *)

function ges_effect_new(bin_description:Pgchar):PGESEffect;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_effect_class_register_rate_property(klass:PGESEffectClass; element_name:Pgchar; property_name:Pgchar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_EFFECT : longint; { return type might be wrong }
  begin
    GES_TYPE_EFFECT:=ges_effect_get_type;
  end;


end.
