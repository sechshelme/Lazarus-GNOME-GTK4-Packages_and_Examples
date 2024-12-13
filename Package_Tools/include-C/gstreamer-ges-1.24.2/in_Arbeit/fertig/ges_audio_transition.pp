
unit ges_audio_transition;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_audio_transition.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_audio_transition.h
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
PGESAudioTransition  = ^GESAudioTransition;
PGESAudioTransitionClass  = ^GESAudioTransitionClass;
PGESAudioTransitionPrivate  = ^GESAudioTransitionPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
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
{$include <ges/ges-types.h>}
{$include <ges/ges-transition.h>}

{ was #define dname def_expr }
function GES_TYPE_AUDIO_TRANSITION : longint; { return type might be wrong }

{GES_DECLARE_TYPE (AudioTransition, audio_transition, AUDIO_TRANSITION); }
{*
 * GESAudioTransition:
 *
  }
{< private > }
{ Padding for API extension  }
type
  PGESAudioTransition = ^TGESAudioTransition;
  TGESAudioTransition = record
      parent : TGESTransition;
      priv : PGESAudioTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ Padding for API extension  }
  PGESAudioTransitionClass = ^TGESAudioTransitionClass;
  TGESAudioTransitionClass = record
      parent_class : TGESTransitionClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_audio_transition_new:PGESAudioTransition;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_AUDIO_TRANSITION : longint; { return type might be wrong }
  begin
    GES_TYPE_AUDIO_TRANSITION:=ges_audio_transition_get_type;
  end;


end.
