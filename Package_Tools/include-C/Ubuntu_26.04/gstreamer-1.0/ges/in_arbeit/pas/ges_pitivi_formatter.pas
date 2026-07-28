unit ges_pitivi_formatter;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(PitiviFormatter, pitivi_formatter, PITIVI_FORMATTER); }
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


function ges_pitivi_formatter_new:PGESPitiviFormatter;cdecl;external libges;

// === Konventiert am: 28-7-26 13:05:55 ===

function GES_TYPE_PITIVI_FORMATTER: TGType;
function GES_PITIVI_FORMATTER(obj: Pointer): PGESPitiviFormatter;
function GES_IS_PITIVI_FORMATTER(obj: Pointer): Tgboolean;
function GES_PITIVI_FORMATTER_CLASS(klass: Pointer): PGESPitiviFormatterClass;
function GES_IS_PITIVI_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_PITIVI_FORMATTER_GET_CLASS(obj: Pointer): PGESPitiviFormatterClass;

implementation

function GES_TYPE_PITIVI_FORMATTER: TGType;
begin
  Result := ges_pitivi_formatter_get_type;
end;

function GES_PITIVI_FORMATTER(obj: Pointer): PGESPitiviFormatter;
begin
  Result := PGESPitiviFormatter(g_type_check_instance_cast(obj, GES_TYPE_PITIVI_FORMATTER));
end;

function GES_IS_PITIVI_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_PITIVI_FORMATTER);
end;

function GES_PITIVI_FORMATTER_CLASS(klass: Pointer): PGESPitiviFormatterClass;
begin
  Result := PGESPitiviFormatterClass(g_type_check_class_cast(klass, GES_TYPE_PITIVI_FORMATTER));
end;

function GES_IS_PITIVI_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_PITIVI_FORMATTER);
end;

function GES_PITIVI_FORMATTER_GET_CLASS(obj: Pointer): PGESPitiviFormatterClass;
begin
  Result := PGESPitiviFormatterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESPitiviFormatterPrivate = type Pointer

function ges_pitivi_formatter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
