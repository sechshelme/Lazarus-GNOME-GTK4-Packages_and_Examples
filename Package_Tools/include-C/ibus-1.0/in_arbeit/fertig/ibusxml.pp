
unit ibusxml;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusxml.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusxml.h
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
PGList  = ^GList;
PGString  = ^GString;
PIBusXML  = ^IBusXML;
PXMLNode  = ^XMLNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ bus - The Input Bus
 * Copyright (C) 2008-2015 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2015 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_XML_H__}
{$define __IBUS_XML_H__}
{*
 * SECTION: ibusxml
 * @short_description: XML handling functions for IBus.
 * @stability: Stable
 *
 * IBusXML lists data structure and handling function for XML in IBus.
  }
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function IBUS_TYPE_XML : longint; { return type might be wrong }

{*
 * IBusXML:
 * @name: Name of XML tag.
 * @text: Text enclosed by XML start tag and end tag. i.e. <tag>text</tag>.
 * @attributes: Attributes of the XML node.
 * @sub_nodes: Children node of this XML node.
 *
 * A data type representing an XML node.
  }
type
  PIBusXML = ^TIBusXML;
  TIBusXML = record
      name : Pgchar;
      text : Pgchar;
      attributes : ^Pgchar;
      sub_nodes : PGList;
    end;

const
  XMLNode = IBusXML;  

function ibus_xml_get_type:TGType;cdecl;external;
{*
 * ibus_xml_copy:
 * @node: Root node of an XML tree.
 *
 * Creates a copy of @node, which should be freed with
 * ibus_xml_free(). Primarily used by language bindings,
 * not that useful otherwise (since @node can just be copied
 * by assignment in C).
 *
 * Returns: the newly allocated #IBusXML, which should
 *          be freed with ibus_xml_free(), or %NULL
 *          if @node was %NULL.
 * }
(* Const before type ignored *)
function ibus_xml_copy(node:PXMLNode):PXMLNode;cdecl;external;
{*
 * ibus_xml_parse_file:
 * @name: File name to be parsed.
 *
 * Parse an XML file and return a corresponding XML tree.
 *
 * Returns: Root node of parsed XML tree.
  }
(* Const before type ignored *)
function ibus_xml_parse_file(name:Pgchar):PXMLNode;cdecl;external;
{*
 * ibus_xml_parse_buffer:
 * @buffer: Buffer to be parsed.
 *
 * Parse a string buffer which contains an XML-formatted string,
 * and return a corresponding XML tree.
 *
 * Returns: Root node of parsed XML tree.
  }
(* Const before type ignored *)
function ibus_xml_parse_buffer(buffer:Pgchar):PXMLNode;cdecl;external;
{*
 * ibus_xml_free:
 * @node: Root node of an XML tree.
 *
 * Free an XML tree.
  }
procedure ibus_xml_free(node:PXMLNode);cdecl;external;
{*
 * ibus_xml_output:
 * @node: Root node of an XML tree.
 * @output: GString which stores the output.
 *
 * Output an XML tree to a GString.
  }
(* Const before type ignored *)
procedure ibus_xml_output(node:PXMLNode; output:PGString);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_XML : longint; { return type might be wrong }
  begin
    IBUS_TYPE_XML:=ibus_xml_get_type;
  end;


end.
