
unit ges_effect_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_effect_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_effect_clip.h
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
PGESEffectClip  = ^GESEffectClip;
PGESEffectClipClass  = ^GESEffectClipClass;
PGESEffectClipPrivate  = ^GESEffectClipPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2011 Thibault Saunier <thibault.saunier@collabora.co.uk>
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

{ was #define dname def_expr }
function GES_TYPE_EFFECT_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (EffectClip, effect_clip, EFFECT_CLIP); }
{*
 * GESEffectClip:
  }
{< private > }
{ Padding for API extension  }
type
  PGESEffectClip = ^TGESEffectClip;
  TGESEffectClip = record
      parent : TGESBaseEffectClip;
      priv : PGESEffectClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESEffectClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESEffectClipClass = ^TGESEffectClipClass;
  TGESEffectClipClass = record
      parent_class : TGESBaseEffectClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function ges_effect_clip_new(video_bin_description:Pgchar; audio_bin_description:Pgchar):PGESEffectClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_EFFECT_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_EFFECT_CLIP:=ges_effect_clip_get_type;
  end;


end.
