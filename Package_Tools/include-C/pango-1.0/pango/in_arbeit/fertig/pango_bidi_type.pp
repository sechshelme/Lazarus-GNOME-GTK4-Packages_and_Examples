
unit pango_bidi_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_bidi_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_bidi_type.h
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
Pgunichar  = ^gunichar;
PPangoBidiType  = ^PangoBidiType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-bidi-type.h: Bidirectional Character Types
 *
 * Copyright (C) 2008 Jürg Billeter <j@bitron.ch>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_BIDI_TYPE_H__}
{$define __PANGO_BIDI_TYPE_H__}
{$include <glib.h>}
{$include <pango/pango-version-macros.h>}
{$include <pango/pango-direction.h>}
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoBidiType:
 * @PANGO_BIDI_TYPE_L: Left-to-Right
 * @PANGO_BIDI_TYPE_LRE: Left-to-Right Embedding
 * @PANGO_BIDI_TYPE_LRO: Left-to-Right Override
 * @PANGO_BIDI_TYPE_R: Right-to-Left
 * @PANGO_BIDI_TYPE_AL: Right-to-Left Arabic
 * @PANGO_BIDI_TYPE_RLE: Right-to-Left Embedding
 * @PANGO_BIDI_TYPE_RLO: Right-to-Left Override
 * @PANGO_BIDI_TYPE_PDF: Pop Directional Format
 * @PANGO_BIDI_TYPE_EN: European Number
 * @PANGO_BIDI_TYPE_ES: European Number Separator
 * @PANGO_BIDI_TYPE_ET: European Number Terminator
 * @PANGO_BIDI_TYPE_AN: Arabic Number
 * @PANGO_BIDI_TYPE_CS: Common Number Separator
 * @PANGO_BIDI_TYPE_NSM: Nonspacing Mark
 * @PANGO_BIDI_TYPE_BN: Boundary Neutral
 * @PANGO_BIDI_TYPE_B: Paragraph Separator
 * @PANGO_BIDI_TYPE_S: Segment Separator
 * @PANGO_BIDI_TYPE_WS: Whitespace
 * @PANGO_BIDI_TYPE_ON: Other Neutrals
 * @PANGO_BIDI_TYPE_LRI: Left-to-Right isolate. Since 1.48.6
 * @PANGO_BIDI_TYPE_RLI: Right-to-Left isolate. Since 1.48.6
 * @PANGO_BIDI_TYPE_FSI: First strong isolate. Since 1.48.6
 * @PANGO_BIDI_TYPE_PDI: Pop directional isolate. Since 1.48.6
 *
 * `PangoBidiType` represents the bidirectional character
 * type of a Unicode character.
 *
 * The values in this enumeration are specified by the
 * [Unicode bidirectional algorithm](http://www.unicode.org/reports/tr9/).
 *
 * Since: 1.22
 * Deprecated: 1.44: Use fribidi for this information
 * }
{ Strong types  }
{ Weak types  }
{ Neutral types  }
{ Explicit formatting  }
type
  PPangoBidiType = ^TPangoBidiType;
  TPangoBidiType =  Longint;
  Const
    PANGO_BIDI_TYPE_L = 0;
    PANGO_BIDI_TYPE_LRE = 1;
    PANGO_BIDI_TYPE_LRO = 2;
    PANGO_BIDI_TYPE_R = 3;
    PANGO_BIDI_TYPE_AL = 4;
    PANGO_BIDI_TYPE_RLE = 5;
    PANGO_BIDI_TYPE_RLO = 6;
    PANGO_BIDI_TYPE_PDF = 7;
    PANGO_BIDI_TYPE_EN = 8;
    PANGO_BIDI_TYPE_ES = 9;
    PANGO_BIDI_TYPE_ET = 10;
    PANGO_BIDI_TYPE_AN = 11;
    PANGO_BIDI_TYPE_CS = 12;
    PANGO_BIDI_TYPE_NSM = 13;
    PANGO_BIDI_TYPE_BN = 14;
    PANGO_BIDI_TYPE_B = 15;
    PANGO_BIDI_TYPE_S = 16;
    PANGO_BIDI_TYPE_WS = 17;
    PANGO_BIDI_TYPE_ON = 18;
    PANGO_BIDI_TYPE_LRI = 19;
    PANGO_BIDI_TYPE_RLI = 20;
    PANGO_BIDI_TYPE_FSI = 21;
    PANGO_BIDI_TYPE_PDI = 22;
;

function pango_bidi_type_for_unichar(ch:Tgunichar):TPangoBidiType;cdecl;external;
function pango_unichar_direction(ch:Tgunichar):TPangoDirection;cdecl;external;
(* Const before type ignored *)
function pango_find_base_dir(text:Pgchar; length:Tgint):TPangoDirection;cdecl;external;
function pango_get_mirror_char(ch:Tgunichar; mirrored_ch:Pgunichar):Tgboolean;cdecl;external;
{$endif}
{$endif}
{ __PANGO_BIDI_TYPE_H__  }

implementation


end.
