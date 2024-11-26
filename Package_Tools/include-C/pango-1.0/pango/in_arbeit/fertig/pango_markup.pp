
unit pango_markup;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_markup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_markup.h
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
Pchar  = ^char;
PGError  = ^GError;
PGMarkupParseContext  = ^GMarkupParseContext;
Pgunichar  = ^gunichar;
PPangoAttrList  = ^PangoAttrList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-markup.h: Parser for attributed text
 *
 * Copyright (C) 2000 Red Hat Software
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
{$ifndef __PANGO_MARKUP_H__}
{$define __PANGO_MARKUP_H__}
{$include <pango/pango-attributes.h>}

function pango_markup_parser_new(accel_marker:Tgunichar):PGMarkupParseContext;cdecl;external;
function pango_markup_parser_finish(context:PGMarkupParseContext; attr_list:PPPangoAttrList; text:PPchar; accel_char:Pgunichar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_parse_markup(markup_text:Pchar; length:longint; accel_marker:Tgunichar; attr_list:PPPangoAttrList; text:PPchar; 
           accel_char:Pgunichar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __PANGO_MARKUP_H__  }

implementation


end.
