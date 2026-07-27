unit ges_audio_test_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(AudioTestSource, audio_test_source, AUDIO_TEST_SOURCE); }
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


procedure ges_audio_test_source_set_freq(self:PGESAudioTestSource; freq:Tgdouble);cdecl;external libges;
procedure ges_audio_test_source_set_volume(self:PGESAudioTestSource; volume:Tgdouble);cdecl;external libges;
function ges_audio_test_source_get_freq(self:PGESAudioTestSource):Tdouble;cdecl;external libges;
function ges_audio_test_source_get_volume(self:PGESAudioTestSource):Tdouble;cdecl;external libges;

// === Konventiert am: 27-7-26 19:48:36 ===

function GES_TYPE_AUDIO_TEST_SOURCE: TGType;
function GES_AUDIO_TEST_SOURCE(obj: Pointer): PGESAudioTestSource;
function GES_IS_AUDIO_TEST_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): PGESAudioTestSourceClass;
function GES_IS_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESAudioTestSourceClass;

implementation

function GES_TYPE_AUDIO_TEST_SOURCE: TGType;
begin
  Result := ges_audio_test_source_get_type;
end;

function GES_AUDIO_TEST_SOURCE(obj: Pointer): PGESAudioTestSource;
begin
  Result := PGESAudioTestSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TEST_SOURCE));
end;

function GES_IS_AUDIO_TEST_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TEST_SOURCE);
end;

function GES_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): PGESAudioTestSourceClass;
begin
  Result := PGESAudioTestSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TEST_SOURCE));
end;

function GES_IS_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TEST_SOURCE);
end;

function GES_AUDIO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESAudioTestSourceClass;
begin
  Result := PGESAudioTestSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESAudioTestSourcePrivate = type Pointer

function ges_audio_test_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
