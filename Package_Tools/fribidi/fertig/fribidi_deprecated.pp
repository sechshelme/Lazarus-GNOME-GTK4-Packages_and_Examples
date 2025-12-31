
unit fribidi_deprecated;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_deprecated.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_deprecated.h
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
PFriBidiCharType  = ^FriBidiCharType;
PFriBidiLevel  = ^FriBidiLevel;
PFriBidiParType  = ^FriBidiParType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-deprecated.h - Deprecated interfaces
 *
 * Author:
 *   Behdad Esfahbod, 2004, 2005
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc
 * Copyright (C) 2004, 2005 Behdad Esfahbod
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
{$ifndef _FRIBIDI_DEPRECATED_H}
{$define _FRIBIDI_DEPRECATED_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-bidi-types.h"}
{$include "fribidi-begindecls.h"}
{ fribidi_mirroring_status - get current mirroring status
 *
 * This function is deprecated and only used with other deprecated functions.
  }
{FRIBIDI_GNUC_DEPRECATED }
function fribidi_mirroring_status:Tfribidi_boolean;cdecl;external;
{ fribidi_set_mirroring - set mirroring on or off
 *
 * This function is used to turn character mirroring on or off.
 * Character mirroring is the act of replacing a mirrorable glyph
 * (character), eg. left parenthesis, with the matching glyph, 
 * eg. right parenthesis, in a right-to-left resolved context.
 * If your rendering engine does mirroring itself, you may want to 
 * turn it off here.
 *
 * This flag is on by default.
 * This function is deprecated and only used with other deprecated functions.
 *
 * Returns: the new mirroring status.
  }
{ new state to set  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_set_mirroring(state:Tfribidi_boolean):Tfribidi_boolean;cdecl;external;
{ fribidi_reorder_nsm_status - get current marks reordering status
 *
 * This function is deprecated and only used with other deprecated functions.
  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_reorder_nsm_status:Tfribidi_boolean;cdecl;external;
{ fribidi_set_reorder_nsm - set marks reordering on or off
 *
 * This function is used to turn non-spacing marks reordering on or
 * off.  Reordering non-spacing marks is the act of placing non-spacing
 * marks (bidi class NSM) after their base character in a right-to-left
 * resolved context.  If your rendering engine expects non-spacing marks
 * always after the base character in the memory representation of the
 * visual string, you need this option on.  An example of where people
 * may need it off is when rendering in the console when non-spacing
 * marks cannot be applied on top of the base character.
 *
 * This flag is on by default.
 * This function is deprecated and only used with other deprecated functions.
 *
 * Returns: the new marks reordering status.
  }
{ new state to set  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_set_reorder_nsm(state:Tfribidi_boolean):Tfribidi_boolean;cdecl;external;
{ fribidi_log2vis_get_embedding_levels - get embedding levels
 *
 * Deprecated. Replaced by fribidi_get_par_embedding_levels_ex.
  }
(* Const before type ignored *)
{ input list of bidi types as returned by
					   fribidi_get_bidi_types()  }
(* Const before type ignored *)
{ input string length of the paragraph  }
{ requested and resolved paragraph
				 * base direction  }
{ output list of embedding levels  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_log2vis_get_embedding_levels(bidi_types:PFriBidiCharType; len:TFriBidiStrIndex; pbase_dir:PFriBidiParType; embedding_levels:PFriBidiLevel):TFriBidiLevel;cdecl;external;
{ fribidi_get_type - get character bidi type
 *
 * Deprecated. Replaced by fribidi_get_bidi_type.
  }
{ input character  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_get_type(ch:TFriBidiChar):TFriBidiCharType;cdecl;external;
{ fribidi_get_type_internal - get character bidi type
 *
 * Deprecated. Replaced by fribidi_get_bidi_type.
  }
{ input character  }
{FRIBIDI_GNUC_DEPRECATED }function fribidi_get_type_internal(ch:TFriBidiChar):TFriBidiCharType;cdecl;external;
{ fribidi_get_par_embedding_levels - get bidi embedding levels of a paragraph
 *
 * Deprecated interface to fribidi_get_par_embedding_levels_ex(). Refer to
 * it for documentation.
  }
(* Const before type ignored *)
{ input list of bidi types as returned by
					   fribidi_get_bidi_types()  }
(* Const before type ignored *)
{ input string length of the paragraph  }
{ requested and resolved paragraph
				 * base direction  }
{ output list of embedding levels  }
function fribidi_get_par_embedding_levels(bidi_types:PFriBidiCharType; len:TFriBidiStrIndex; pbase_dir:PFriBidiParType; embedding_levels:PFriBidiLevel):TFriBidiLevel;cdecl;external;
const
  UNI_MAX_BIDI_LEVEL = FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL;  
  UNI_LRM = FRIBIDI_CHAR_LRM;  
  UNI_RLM = FRIBIDI_CHAR_RLM;  
  UNI_LRE = FRIBIDI_CHAR_LRE;  
  UNI_RLE = FRIBIDI_CHAR_RLE;  
  UNI_LRO = FRIBIDI_CHAR_LRO;  
  UNI_RLO = FRIBIDI_CHAR_RLO;  
  UNI_LS = FRIBIDI_CHAR_LS;  
  UNI_PS = FRIBIDI_CHAR_PS;  
  UNI_ZWNJ = FRIBIDI_CHAR_ZWNJ;  
  UNI_ZWJ = FRIBIDI_CHAR_ZWJ;  
  UNI_HEBREW_ALEF = FRIBIDI_CHAR_HEBREW_ALEF;  
  UNI_ARABIC_ALEF = FRIBIDI_CHAR_ARABIC_ALEF;  
  UNI_ARABIC_ZERO = FRIBIDI_CHAR_ARABIC_ZERO;  
  UNI_FARSI_ZERO = FRIBIDI_CHAR_PERSIAN_ZERO;  
  FRIBIDI_TYPE_WL = FRIBIDI_PAR_WLTR;  
  FRIBIDI_TYPE_WR = FRIBIDI_PAR_WRTL;  
  FRIBIDI_TYPE_L = FRIBIDI_PAR_LTR;  
  FRIBIDI_TYPE_R = FRIBIDI_PAR_RTL;  
  FRIBIDI_TYPE_N = FRIBIDI_PAR_ON;  
  FRIBIDI_TYPE_B = FRIBIDI_TYPE_BS;  
  FRIBIDI_TYPE_S = FRIBIDI_TYPE_SS;  
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_DEPRECATED_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation


end.
