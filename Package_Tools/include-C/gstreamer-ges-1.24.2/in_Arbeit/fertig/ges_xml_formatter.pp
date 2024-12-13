
unit ges_xml_formatter;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_xml_formatter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_xml_formatter.h
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
PGESXmlFormatter  = ^GESXmlFormatter;
PGESXmlFormatterClass  = ^GESXmlFormatterClass;
PGESXmlFormatterPrivate  = ^GESXmlFormatterPrivate;
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

{ was #define dname def_expr }
function GES_TYPE_XML_FORMATTER : longint; { return type might be wrong }

{GES_DECLARE_TYPE (XmlFormatter, xml_formatter, XML_FORMATTER); }
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


implementation

{ was #define dname def_expr }
function GES_TYPE_XML_FORMATTER : longint; { return type might be wrong }
  begin
    GES_TYPE_XML_FORMATTER:=ges_xml_formatter_get_type;
  end;


end.
