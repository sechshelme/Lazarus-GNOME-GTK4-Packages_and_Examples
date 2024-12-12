
unit ges_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_types.h
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
PGESFrameNumber  = ^GESFrameNumber;
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
{*
 * SECTION:gestypes
 * @title: GES Types
 * @short_description: GStreamer Editing Services data types
 *
 * GStreamer Editing Services data types
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}
{$include <ges/ges-prelude.h>}
{*
 * GES_PADDING: (attributes doc.skip=true)
  }

const
  GES_PADDING = 4;  
{*
 * GES_PADDING_LARGE: (attributes doc.skip=true)
  }
  GES_PADDING_LARGE = 20;  
{*
 * GESFrameNumber:
 *
 * A datatype to hold a frame number.
 *
 * Since: 1.18
  }
type
  PGESFrameNumber = ^TGESFrameNumber;
  TGESFrameNumber = Tgint64;
{*
 * GES_FRAME_NUMBER_NONE: (value 9223372036854775807) (type GESFrameNumber)
 *
 * Constant to define an undefined frame number
  }

{ was #define dname def_expr }
function GES_FRAME_NUMBER_NONE : Tgint64;  

{*
 * GES_FRAME_NUMBER_IS_VALID:
 * Tests if a given GESFrameNumber represents a valid frame
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_FRAME_NUMBER_IS_VALID(frames : longint) : longint;

{*
 * GES_TYPE_FRAME_NUMBER:
 *
 * The #GType of a #GESFrameNumber.
  }
const
  GES_TYPE_FRAME_NUMBER = G_TYPE_UINT64;  
{ Type definitions  }
type

implementation

{ was #define dname def_expr }
function GES_FRAME_NUMBER_NONE : Tgint64;
  begin
    GES_FRAME_NUMBER_NONE:=Tgint64(9223372036854775807);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_FRAME_NUMBER_IS_VALID(frames : longint) : longint;
begin
  GES_FRAME_NUMBER_IS_VALID:=(TGESFrameNumber(frames))<>GES_FRAME_NUMBER_NONE;
end;


end.
