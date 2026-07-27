unit ges_audio_uri_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
type

{GES_DECLARE_TYPE(AudioUriSource, audio_uri_source, AUDIO_URI_SOURCE); }
{*
 * GESAudioUriSource:
 *
 * ### Children Properties
 *
 *   libs/GESVideoUriSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESAudioUriSource = ^TGESAudioUriSource;
  TGESAudioUriSource = record
      parent : TGESAudioSource;
      uri : Pgchar;
      priv : PGESUriSource;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESAudioUriSourceClass = ^TGESAudioUriSourceClass;
  TGESAudioUriSourceClass = record
      parent_class : TGESAudioSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:48:15 ===

function GES_TYPE_AUDIO_URI_SOURCE: TGType;
function GES_AUDIO_URI_SOURCE(obj: Pointer): PGESAudioUriSource;
function GES_IS_AUDIO_URI_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_URI_SOURCE_CLASS(klass: Pointer): PGESAudioUriSourceClass;
function GES_IS_AUDIO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESAudioUriSourceClass;

implementation

function GES_TYPE_AUDIO_URI_SOURCE: TGType;
begin
  Result := ges_audio_uri_source_get_type;
end;

function GES_AUDIO_URI_SOURCE(obj: Pointer): PGESAudioUriSource;
begin
  Result := PGESAudioUriSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_URI_SOURCE));
end;

function GES_IS_AUDIO_URI_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_URI_SOURCE);
end;

function GES_AUDIO_URI_SOURCE_CLASS(klass: Pointer): PGESAudioUriSourceClass;
begin
  Result := PGESAudioUriSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_URI_SOURCE));
end;

function GES_IS_AUDIO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_URI_SOURCE);
end;

function GES_AUDIO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESAudioUriSourceClass;
begin
  Result := PGESAudioUriSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESAudioUriSourcePrivate = type Pointer

function ges_audio_uri_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
