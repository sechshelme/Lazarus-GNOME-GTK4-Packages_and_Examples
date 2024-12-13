
unit ges_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_source.h
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
PGESSource  = ^GESSource;
PGESSourceClass  = ^GESSourceClass;
PGESSourcePrivate  = ^GESSourcePrivate;
PGstElement  = ^GstElement;
PGstPad  = ^GstPad;
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

{ was #define dname def_expr }
function GES_TYPE_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Source, source, SOURCE); }
{*
 * GESSource:
 *
 * Base class for single-media sources
  }
{< private > }
{ Padding for API extension  }
type
  PGESSource = ^TGESSource;
  TGESSource = record
      parent : TGESTrackElement;
      priv : PGESSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESSourceClass:
  }
{< private > }
{*
   * GESSourceClass::select_pad:
   * @source: The @source for which to check if @pad should be used or not
   * @pad: The pad to check
   *
   * Check whether @pad should be exposed/used.
   *
   * Returns: %TRUE if @pad should be used %FALSE otherwise.
   *
   * Since: 1.20
    }
{*
   * GESSourceClass::create_source:
   * @source: The #GESAudioSource
   *
   * Creates the GstElement to put in the source topbin. Other elements will be
   * queued, like a volume. In the case of a AudioUriSource, for example, the
   * subclass will return a decodebin, and we will append a volume.
   *
   * Returns: (transfer floating): The source element to use.
   *
   * Since: 1.20
    }
{ Padding for API extension  }
  PGESSourceClass = ^TGESSourceClass;
  TGESSourceClass = record
      parent_class : TGESTrackElementClass;
      select_pad : function (source:PGESSource; pad:PGstPad):Tgboolean;cdecl;
      create_source : function (source:PGESSource):PGstElement;cdecl;
      _ges_reserved : array[0..(GES_PADDING-2)-1] of Tgpointer;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_SOURCE:=ges_source_get_type;
  end;


end.
