unit ges_command_line_formatter;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(CommandLineFormatter, command_line_formatter, COMMAND_LINE_FORMATTER); }
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


function ges_command_line_formatter_get_help(nargs:Tgint; commands:PPgchar):Pgchar;cdecl;external libges;
function ges_command_line_formatter_get_timeline_uri(timeline:PGESTimeline):Pgchar;cdecl;external libges;

// === Konventiert am: 27-7-26 19:55:17 ===

function GES_TYPE_COMMAND_LINE_FORMATTER: TGType;
function GES_COMMAND_LINE_FORMATTER(obj: Pointer): PGESCommandLineFormatter;
function GES_IS_COMMAND_LINE_FORMATTER(obj: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): PGESCommandLineFormatterClass;
function GES_IS_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_GET_CLASS(obj: Pointer): PGESCommandLineFormatterClass;

implementation

function GES_TYPE_COMMAND_LINE_FORMATTER: TGType;
begin
  Result := ges_command_line_formatter_get_type;
end;

function GES_COMMAND_LINE_FORMATTER(obj: Pointer): PGESCommandLineFormatter;
begin
  Result := PGESCommandLineFormatter(g_type_check_instance_cast(obj, GES_TYPE_COMMAND_LINE_FORMATTER));
end;

function GES_IS_COMMAND_LINE_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_COMMAND_LINE_FORMATTER);
end;

function GES_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): PGESCommandLineFormatterClass;
begin
  Result := PGESCommandLineFormatterClass(g_type_check_class_cast(klass, GES_TYPE_COMMAND_LINE_FORMATTER));
end;

function GES_IS_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_COMMAND_LINE_FORMATTER);
end;

function GES_COMMAND_LINE_FORMATTER_GET_CLASS(obj: Pointer): PGESCommandLineFormatterClass;
begin
  Result := PGESCommandLineFormatterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESCommandLineFormatterPrivate = type Pointer

function ges_command_line_formatter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
