
unit ges_pitivi_formatter;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_pitivi_formatter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_pitivi_formatter.h
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
PGESPitiviFormatter  = ^GESPitiviFormatter;
PGESPitiviFormatterClass  = ^GESPitiviFormatterClass;
PGESPitiviFormatterPrivate  = ^GESPitiviFormatterPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services Pitivi Formatter
 * Copyright (C) 2011-2012 Mathieu Duponchelle <seeed@laposte.net>
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

{ was #define dname def_expr }
function GES_TYPE_PITIVI_FORMATTER : longint; { return type might be wrong }

{GES_DECLARE_TYPE (PitiviFormatter, pitivi_formatter, PITIVI_FORMATTER); }
{*
 * GESPitiviFormatter: (attributes doc.skip=true):
 *
 * Serializes a #GESTimeline to a file using the xptv Pitivi file format
  }
{< public >  }
{< private > }
{ Padding for API extension  }
type
  PGESPitiviFormatter = ^TGESPitiviFormatter;
  TGESPitiviFormatter = record
      parent : TGESFormatter;
      priv : PGESPitiviFormatterPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESPitiviFormatterClass: (attributes doc.skip=true):
  }
{< private > }
{ Padding for API extension  }
  PGESPitiviFormatterClass = ^TGESPitiviFormatterClass;
  TGESPitiviFormatterClass = record
      parent_class : TGESFormatterClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_pitivi_formatter_new:PGESPitiviFormatter;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_PITIVI_FORMATTER : longint; { return type might be wrong }
  begin
    GES_TYPE_PITIVI_FORMATTER:=ges_pitivi_formatter_get_type;
  end;


end.
