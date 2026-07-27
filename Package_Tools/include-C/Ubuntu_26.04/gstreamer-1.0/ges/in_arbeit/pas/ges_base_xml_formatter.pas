unit ges_base_xml_formatter;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer Editing Services
 *
 * Copyright (C) <2012> Thibault Saunier <thibault.saunier@collabora.com>
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
{$include "ges-formatter.h"}
(** unsupported pragma#pragma once*)
type

{GES_DECLARE_TYPE(BaseXmlFormatter, base_xml_formatter, BASE_XML_FORMATTER); }
{*
 * GESBaseXmlFormatter:
  }
{< public >  }
{ <private>  }
type
  PGESBaseXmlFormatter = ^TGESBaseXmlFormatter;
  TGESBaseXmlFormatter = record
      parent : TGESFormatter;
      priv : PGESBaseXmlFormatterPrivate;
      xmlcontent : Pgchar;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;

{*
 * GESBaseXmlFormatterClass:
  }
{ Should be overriden by subclasses  }
  PGESBaseXmlFormatterClass = ^TGESBaseXmlFormatterClass;
  TGESBaseXmlFormatterClass = record
      parent : TGESFormatterClass;
      content_parser : TGMarkupParser;
      save : function (formatter:PGESFormatter; timeline:PGESTimeline; error:PPGError):PGString;cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:55:30 ===

function GES_TYPE_BASE_XML_FORMATTER: TGType;
function GES_BASE_XML_FORMATTER(obj: Pointer): PGESBaseXmlFormatter;
function GES_IS_BASE_XML_FORMATTER(obj: Pointer): Tgboolean;
function GES_BASE_XML_FORMATTER_CLASS(klass: Pointer): PGESBaseXmlFormatterClass;
function GES_IS_BASE_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESBaseXmlFormatterClass;

implementation

function GES_TYPE_BASE_XML_FORMATTER: TGType;
begin
  Result := ges_base_xml_formatter_get_type;
end;

function GES_BASE_XML_FORMATTER(obj: Pointer): PGESBaseXmlFormatter;
begin
  Result := PGESBaseXmlFormatter(g_type_check_instance_cast(obj, GES_TYPE_BASE_XML_FORMATTER));
end;

function GES_IS_BASE_XML_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_XML_FORMATTER);
end;

function GES_BASE_XML_FORMATTER_CLASS(klass: Pointer): PGESBaseXmlFormatterClass;
begin
  Result := PGESBaseXmlFormatterClass(g_type_check_class_cast(klass, GES_TYPE_BASE_XML_FORMATTER));
end;

function GES_IS_BASE_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_XML_FORMATTER);
end;

function GES_BASE_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESBaseXmlFormatterClass;
begin
  Result := PGESBaseXmlFormatterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESBaseXmlFormatterPrivate = type Pointer

function ges_base_xml_formatter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
