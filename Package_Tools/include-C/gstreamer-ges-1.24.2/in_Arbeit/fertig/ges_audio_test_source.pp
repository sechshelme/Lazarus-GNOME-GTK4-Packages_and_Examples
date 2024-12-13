
unit ges_audio_test_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_audio_test_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_audio_test_source.h
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
PGESAudioTestSource  = ^GESAudioTestSource;
PGESAudioTestSourceClass  = ^GESAudioTestSourceClass;
PGESAudioTestSourcePrivate  = ^GESAudioTestSourcePrivate;
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
{$include <ges/ges-audio-source.h>}

{ was #define dname def_expr }
function GES_TYPE_AUDIO_TEST_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (AudioTestSource, audio_test_source, AUDIO_TEST_SOURCE); }
{*
 * GESAudioTestSource:
 *
 * ### Children Properties
 *
 *   libs/GESAudioTestSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESAudioTestSource = ^TGESAudioTestSource;
  TGESAudioTestSource = record
      parent : TGESAudioSource;
      priv : PGESAudioTestSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESAudioTestSourceClass = ^TGESAudioTestSourceClass;
  TGESAudioTestSourceClass = record
      parent_class : TGESAudioSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_audio_test_source_set_freq(self:PGESAudioTestSource; freq:Tgdouble);cdecl;external;
procedure ges_audio_test_source_set_volume(self:PGESAudioTestSource; volume:Tgdouble);cdecl;external;
function ges_audio_test_source_get_freq(self:PGESAudioTestSource):Tdouble;cdecl;external;
function ges_audio_test_source_get_volume(self:PGESAudioTestSource):Tdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_AUDIO_TEST_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_AUDIO_TEST_SOURCE:=ges_audio_test_source_get_type;
  end;


end.
