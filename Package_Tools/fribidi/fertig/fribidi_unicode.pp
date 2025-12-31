
unit fribidi_unicode;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_unicode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_unicode.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-unicode.h - general Unicode definitions
 *
 * Author:
 *   Behdad Esfahbod, 2001, 2002, 2004
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc
 * Copyright (C) 2001,2002 Behdad Esfahbod
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
{$ifndef _FRIBIDI_UNICODE_H}
{$define _FRIBIDI_UNICODE_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-begindecls.h"}
{ We do not support surrogates yet  }

{ was #define dname def_expr }
function FRIBIDI_UNICODE_CHARS : longint; { return type might be wrong }

{ Unicode version - FRIBIDI_UNICODE_VERSION  }
{$ifdef DONT_HAVE_FRIBIDI_UNICODE_VERSION_H}
const
  FRIBIDI_UNICODE_VERSION = 'unknown';  
{$else}
{ !DONT_HAVE_FRIBIDI_UNICODE_VERSION_H  }
{$include "fribidi-unicode-version.h"}
{$endif}
{ !DONT_HAVE_FRIBIDI_UNICODE_VERSION_H  }
{ An string containing the version the Unicode standard implemented,
 * in the form of "x.y.z", or "unknown".  }
(* error 
FRIBIDI_ENTRY FRIBIDI_EXTERN const char *fribidi_unicode_version;
 in declarator_list *)
{ Unicode Bidirectional Algorithm definitions:  }
{ Number of types defined in the bidi algorithm  }

const
  FRIBIDI_BIDI_NUM_TYPES = 19;  
{ The maximum embedding level value assigned by explicit marks  }
  FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL = 125;  
{ The maximum *number* of different resolved embedding levels: 0-126  }
  FRIBIDI_BIDI_MAX_RESOLVED_LEVELS = 127;  
{ The maximum *number* of nested brackets: 0-63  }
  FRIBIDI_BIDI_MAX_NESTED_BRACKET_PAIRS = 63;  
{ A few Unicode characters:  }
{ Bidirectional marks  }
  FRIBIDI_CHAR_LRM = $200E;  
  FRIBIDI_CHAR_RLM = $200F;  
  FRIBIDI_CHAR_LRE = $202A;  
  FRIBIDI_CHAR_RLE = $202B;  
  FRIBIDI_CHAR_PDF = $202C;  
  FRIBIDI_CHAR_LRO = $202D;  
  FRIBIDI_CHAR_RLO = $202E;  
  FRIBIDI_CHAR_LRI = $2066;  
  FRIBIDI_CHAR_RLI = $2067;  
  FRIBIDI_CHAR_FSI = $2068;  
  FRIBIDI_CHAR_PDI = $2069;  
{ Line and Paragraph Separators  }
  FRIBIDI_CHAR_LS = $2028;  
  FRIBIDI_CHAR_PS = $2029;  
{ Arabic Joining marks  }
  FRIBIDI_CHAR_ZWNJ = $200C;  
  FRIBIDI_CHAR_ZWJ = $200D;  
{ Hebrew and Arabic  }
  FRIBIDI_CHAR_HEBREW_ALEF = $05D0;  
  FRIBIDI_CHAR_ARABIC_ALEF = $0627;  
  FRIBIDI_CHAR_ARABIC_ZERO = $0660;  
  FRIBIDI_CHAR_PERSIAN_ZERO = $06F0;  
{ Misc  }
  FRIBIDI_CHAR_ZWNBSP = $FEFF;  
{ Char we place for a deleted slot, to delete later  }
  FRIBIDI_CHAR_FILL = FRIBIDI_CHAR_ZWNBSP;  
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_UNICODE_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation

{ was #define dname def_expr }
function FRIBIDI_UNICODE_CHARS : longint; { return type might be wrong }
  var
     if_local1 : longint;
  (* result types are not known *)
  begin
    if 4 then
      if_local1:=$110000
    else
      if_local1:=$FFFE;
    FRIBIDI_UNICODE_CHARS:=(sizeof(FriBidiChar))>=(if_local1);
  end;


end.
