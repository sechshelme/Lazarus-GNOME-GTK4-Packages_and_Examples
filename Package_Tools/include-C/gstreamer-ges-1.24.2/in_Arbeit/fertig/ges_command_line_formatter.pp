
unit ges_command_line_formatter;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_command_line_formatter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_command_line_formatter.h
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
Pgchar  = ^gchar;
PGESCommandLineFormatter  = ^GESCommandLineFormatter;
PGESCommandLineFormatterClass  = ^GESCommandLineFormatterClass;
PGESCommandLineFormatterPrivate  = ^GESCommandLineFormatterPrivate;
PGESTimeline  = ^GESTimeline;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 *
 * Copyright (C) <2015> Thibault Saunier <tsaunier@gnome.org>
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "ges-formatter.h"}
type

{ was #define dname def_expr }
function GES_TYPE_COMMAND_LINE_FORMATTER : longint; { return type might be wrong }

{GES_DECLARE_TYPE (CommandLineFormatter, command_line_formatter, COMMAND_LINE_FORMATTER); }
type
  PGESCommandLineFormatterClass = ^TGESCommandLineFormatterClass;
  TGESCommandLineFormatterClass = record
      parent_class : TGESFormatterClass;
    end;

  PGESCommandLineFormatter = ^TGESCommandLineFormatter;
  TGESCommandLineFormatter = record
      parent_instance : TGESFormatter;
      priv : PGESCommandLineFormatterPrivate;
    end;


function ges_command_line_formatter_get_help(nargs:Tgint; commands:PPgchar):Pgchar;cdecl;external;
function ges_command_line_formatter_get_timeline_uri(timeline:PGESTimeline):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_COMMAND_LINE_FORMATTER : longint; { return type might be wrong }
  begin
    GES_TYPE_COMMAND_LINE_FORMATTER:=ges_command_line_formatter_get_type;
  end;


end.
