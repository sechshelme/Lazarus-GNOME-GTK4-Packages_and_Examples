
unit fribidi_char_sets;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_char_sets.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_char_sets.h
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
PFriBidiChar  = ^FriBidiChar;
PFriBidiCharSet  = ^FriBidiCharSet;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-char-sets.h - character set conversion routines
 *
 * Authors:
 *   Behdad Esfahbod, 2001, 2002, 2004
 *   Dov Grobgeld, 1999, 2000
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc
 * Copyright (C) 2001,2002 Behdad Esfahbod
 * Copyright (C) 1999,2000 Dov Grobgeld
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library, in a file named COPYING; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA
 * 
 * For licensing issues, contact <fribidi.license@gmail.com>.
  }
{$ifndef _FRIBIDI_CHAR_SETS_H}
{$define _FRIBIDI_CHAR_SETS_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-begindecls.h"}
type
  PFriBidiCharSet = ^TFriBidiCharSet;
  TFriBidiCharSet =  Longint;
  Const
    _FRIBIDI_CHAR_SET_NOT_FOUND = 0;
    _FRIBIDI_CHAR_SETS_NUM_PLUS_ONE = 1;
;
  FRIBIDI_CHAR_SET_NOT_FOUND = _FRIBIDI_CHAR_SET_NOT_FOUND;  
  FRIBIDI_CHAR_SETS_NUM = _FRIBIDI_CHAR_SETS_NUM_PLUS_ONE-1;  
{ fribidi_charset_to_unicode - convert string to Unicode
 *
 * This function converts an string from a character set, to a Unicode string.
 *
 * Returns: The length of the new string.
  }
{ character set to convert from  }
(* Const before type ignored *)
{ input string encoded in char_set  }
{ input string length  }
{ output Unicode string  }

function fribidi_charset_to_unicode(char_set:TFriBidiCharSet; s:Pchar; len:TFriBidiStrIndex; us:PFriBidiChar):TFriBidiStrIndex;cdecl;external;
{ fribidi_unicode_to_charset - convert string from Unicode
 *
 * This function converts a Unicode string to an string in another character
 * set.  It also null-terminates the output string.
 *
 * Returns: The length of the new string.
  }
{ character set to convert to  }
(* Const before type ignored *)
{ input Unicode string  }
{ input string length  }
{ output string encoded in char_set  }
function fribidi_unicode_to_charset(char_set:TFriBidiCharSet; us:PFriBidiChar; len:TFriBidiStrIndex; s:Pchar):TFriBidiStrIndex;cdecl;external;
{ fribidi_parse_charset - parse character set name
 *
 * Returns: The character set named s, or FRIBIDI_CHAR_SET_NOT_FOUND if the
 * character set is not available.
  }
(* Const before type ignored *)
{ input name of the character set  }
function fribidi_parse_charset(s:Pchar):TFriBidiCharSet;cdecl;external;
(* Const before type ignored *)
function fribidi_char_set_name(char_set:TFriBidiCharSet):Pchar;cdecl;external;
(* Const before type ignored *)
function fribidi_char_set_title(char_set:TFriBidiCharSet):Pchar;cdecl;external;
(* Const before type ignored *)
function fribidi_char_set_desc(char_set:TFriBidiCharSet):Pchar;cdecl;external;
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_CHAR_SETS_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation


end.
