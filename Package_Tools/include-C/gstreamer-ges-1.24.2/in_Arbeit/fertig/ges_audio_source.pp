
unit ges_audio_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_audio_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_audio_source.h
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
PGESAudioSource  = ^GESAudioSource;
PGESAudioSourceClass  = ^GESAudioSourceClass;
PGESAudioSourcePrivate  = ^GESAudioSourcePrivate;
PGESTrackElement  = ^GESTrackElement;
PGstElement  = ^GstElement;
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

{ was #define dname def_expr }
function GES_TYPE_AUDIO_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (AudioSource, audio_source, AUDIO_SOURCE); }
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


implementation

{ was #define dname def_expr }
function GES_TYPE_AUDIO_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_AUDIO_SOURCE:=ges_audio_source_get_type;
  end;


end.
