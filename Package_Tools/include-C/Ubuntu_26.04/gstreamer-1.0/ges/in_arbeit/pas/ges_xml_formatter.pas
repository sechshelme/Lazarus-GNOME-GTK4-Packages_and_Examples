unit ges_xml_formatter;

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
(** unsupported pragma#pragma once*)
{$include "ges-base-xml-formatter.h"}

{GES_DECLARE_TYPE(XmlFormatter, xml_formatter, XML_FORMATTER); }
type
  PGESXmlFormatter = ^TGESXmlFormatter;
  TGESXmlFormatter = record
      parent : TGESBaseXmlFormatter;
      priv : PGESXmlFormatterPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

  PGESXmlFormatterClass = ^TGESXmlFormatterClass;
  TGESXmlFormatterClass = record
      parent : TGESBaseXmlFormatterClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:21:51 ===

function GES_TYPE_XML_FORMATTER: TGType;
function GES_XML_FORMATTER(obj: Pointer): PGESXmlFormatter;
function GES_IS_XML_FORMATTER(obj: Pointer): Tgboolean;
function GES_XML_FORMATTER_CLASS(klass: Pointer): PGESXmlFormatterClass;
function GES_IS_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESXmlFormatterClass;

implementation

function GES_TYPE_XML_FORMATTER: TGType;
begin
  Result := ges_xml_formatter_get_type;
end;

function GES_XML_FORMATTER(obj: Pointer): PGESXmlFormatter;
begin
  Result := PGESXmlFormatter(g_type_check_instance_cast(obj, GES_TYPE_XML_FORMATTER));
end;

function GES_IS_XML_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_XML_FORMATTER);
end;

function GES_XML_FORMATTER_CLASS(klass: Pointer): PGESXmlFormatterClass;
begin
  Result := PGESXmlFormatterClass(g_type_check_class_cast(klass, GES_TYPE_XML_FORMATTER));
end;

function GES_IS_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_XML_FORMATTER);
end;

function GES_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESXmlFormatterClass;
begin
  Result := PGESXmlFormatterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESXmlFormatterPrivate = type Pointer

function ges_xml_formatter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
