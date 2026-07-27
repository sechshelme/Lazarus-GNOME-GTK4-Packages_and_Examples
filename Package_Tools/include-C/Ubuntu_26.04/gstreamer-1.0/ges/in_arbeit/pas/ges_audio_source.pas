unit ges_audio_source;

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
{$include <gst/gst.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track-element.h>}
{$include <ges/ges-source.h>}

{GES_DECLARE_TYPE(AudioSource, audio_source, AUDIO_SOURCE); }
{*
 * GESAudioSource:
 *
 * Base class for audio sources
  }
{< private > }
{ Padding for API extension  }
type
  PGESAudioSource = ^TGESAudioSource;
  TGESAudioSource = record
      parent : TGESSource;
      priv : PGESAudioSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESAudioSourceClass:
  }
{< private > }
{< public > }
{*
   * GESAudioSource::create_element:
   * @object: The #GESTrackElement
   *
   * Returns: (transfer floating): the #GstElement that the underlying nleobject
   * controls.
   *
   * Deprecated: 1.20: Use #GESSourceClass::create_element instead.
    }
{< private > }
{ Padding for API extension  }
  PGESAudioSourceClass = ^TGESAudioSourceClass;
  TGESAudioSourceClass = record
      parent_class : TGESSourceClass;
      create_source : function (object:PGESTrackElement):PGstElement;cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:48:59 ===

function GES_TYPE_AUDIO_SOURCE: TGType;
function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;

implementation

function GES_TYPE_AUDIO_SOURCE: TGType;
begin
  Result := ges_audio_source_get_type;
end;

function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
begin
  Result := PGESAudioSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESAudioSourcePrivate = type Pointer

function ges_audio_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
