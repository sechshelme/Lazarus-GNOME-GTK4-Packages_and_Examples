
unit ges_source_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_source_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_source_clip.h
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
PGESSourceClip  = ^GESSourceClip;
PGESSourceClipClass  = ^GESSourceClipClass;
PGESSourceClipPrivate  = ^GESSourceClipPrivate;
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
{$include <ges/ges-clip.h>}
{$include <ges/ges-enums.h>}

{ was #define dname def_expr }
function GES_TYPE_SOURCE_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (SourceClip, source_clip, SOURCE_CLIP); }
{*
 * GESSourceClip:
 *
 * Base class for sources of a #GESLayer
  }
{< private > }
{ Padding for API extension  }
type
  PGESSourceClip = ^TGESSourceClip;
  TGESSourceClip = record
      parent : TGESClip;
      priv : PGESSourceClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESSourceClipClass:
  }
{< private > }
{ Padding for API extension  }
  PGESSourceClipClass = ^TGESSourceClipClass;
  TGESSourceClipClass = record
      parent_class : TGESClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_SOURCE_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_SOURCE_CLIP:=ges_source_clip_get_type;
  end;


end.
