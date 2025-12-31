
unit fribidi_bidi_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_bidi_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_bidi_types.h
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
PFriBidiCharType  = ^FriBidiCharType;
PFriBidiLevel  = ^FriBidiLevel;
PFriBidiParType  = ^FriBidiParType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-bidi-types.h - character bidi types
 *
 * Author:
 *   Behdad Esfahbod, 2001, 2002, 2004
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc.
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
{$ifndef _FRIBIDI_BIDI_TYPES_H}
{$define _FRIBIDI_BIDI_TYPES_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-begindecls.h"}
type
  PFriBidiLevel = ^TFriBidiLevel;
  TFriBidiLevel = char;
{ 
 * Define bit masks that bidi types are based on, each mask has
 * only one bit set.
  }
{ RTL mask better be the least significant bit.  }
{ Is right to left  }

const
  FRIBIDI_MASK_RTL = $00000001;  
{ Is arabic  }
  FRIBIDI_MASK_ARABIC = $00000002;  
{ Each char can be only one of the three following.  }
{ Is strong  }
  FRIBIDI_MASK_STRONG = $00000010;  
{ Is weak  }
  FRIBIDI_MASK_WEAK = $00000020;  
{ Is neutral  }
  FRIBIDI_MASK_NEUTRAL = $00000040;  
{ Is sentinel  }
  FRIBIDI_MASK_SENTINEL = $00000080;  
{ Sentinels are not valid chars, just identify the start/end of strings.  }
{ Each char can be only one of the six following.  }
{ Is letter: L, R, AL  }
  FRIBIDI_MASK_LETTER = $00000100;  
{ Is number: EN, AN  }
  FRIBIDI_MASK_NUMBER = $00000200;  
{ Is separator or terminator: ES, ET, CS  }
  FRIBIDI_MASK_NUMSEPTER = $00000400;  
{ Is space: BN, BS, SS, WS  }
  FRIBIDI_MASK_SPACE = $00000800;  
{ Is explicit mark: LRE, RLE, LRO, RLO, PDF  }
  FRIBIDI_MASK_EXPLICIT = $00001000;  
{ Is isolate mark: LRI, RLI, FSI, PDI  }
  FRIBIDI_MASK_ISOLATE = $00008000;  
{ Can be set only if FRIBIDI_MASK_SPACE is also set.  }
{ Is text separator: BS, SS  }
  FRIBIDI_MASK_SEPARATOR = $00002000;  
{ Can be set only if FRIBIDI_MASK_EXPLICIT is also set.  }
{ Is explicit override: LRO, RLO  }
  FRIBIDI_MASK_OVERRIDE = $00004000;  
{ Whether direction is determined by first strong  }
  FRIBIDI_MASK_FIRST = $02000000;  
{ The following exist to make types pairwise different, some of them can
 * be removed but are here because of efficiency (make queries faster).  }
  FRIBIDI_MASK_ES = $00010000;  
  FRIBIDI_MASK_ET = $00020000;  
  FRIBIDI_MASK_CS = $00040000;  
  FRIBIDI_MASK_NSM = $00080000;  
  FRIBIDI_MASK_BN = $00100000;  
  FRIBIDI_MASK_BS = $00200000;  
  FRIBIDI_MASK_SS = $00400000;  
  FRIBIDI_MASK_WS = $00800000;  
{ We reserve a single bit for user's private use: we will never use it.  }
  FRIBIDI_MASK_PRIVATE = $01000000;  
{
 * Define values for FriBidiCharType
  }
{ Strong types  }
{ Left-To-Right letter  }
  FRIBIDI_TYPE_LTR_VAL = FRIBIDI_MASK_STRONG or FRIBIDI_MASK_LETTER;  
{ Right-To-Left letter  }
  FRIBIDI_TYPE_RTL_VAL = (FRIBIDI_MASK_STRONG or FRIBIDI_MASK_LETTER) or FRIBIDI_MASK_RTL;  
{ Arabic Letter  }
  FRIBIDI_TYPE_AL_VAL = ((FRIBIDI_MASK_STRONG or FRIBIDI_MASK_LETTER) or FRIBIDI_MASK_RTL) or FRIBIDI_MASK_ARABIC;  
{ Left-to-Right Embedding  }
  FRIBIDI_TYPE_LRE_VAL = FRIBIDI_MASK_STRONG or FRIBIDI_MASK_EXPLICIT;  
{ Right-to-Left Embedding  }
  FRIBIDI_TYPE_RLE_VAL = (FRIBIDI_MASK_STRONG or FRIBIDI_MASK_EXPLICIT) or FRIBIDI_MASK_RTL;  
{ Left-to-Right Override  }
  FRIBIDI_TYPE_LRO_VAL = (FRIBIDI_MASK_STRONG or FRIBIDI_MASK_EXPLICIT) or FRIBIDI_MASK_OVERRIDE;  
{ Right-to-Left Override  }
  FRIBIDI_TYPE_RLO_VAL = ((FRIBIDI_MASK_STRONG or FRIBIDI_MASK_EXPLICIT) or FRIBIDI_MASK_RTL) or FRIBIDI_MASK_OVERRIDE;  
{ Weak types  }
{ Pop Directional Flag }
  FRIBIDI_TYPE_PDF_VAL = FRIBIDI_MASK_WEAK or FRIBIDI_MASK_EXPLICIT;  
{ European Numeral  }
  FRIBIDI_TYPE_EN_VAL = FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NUMBER;  
{ Arabic Numeral  }
  FRIBIDI_TYPE_AN_VAL = (FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NUMBER) or FRIBIDI_MASK_ARABIC;  
{ European number Separator  }
  FRIBIDI_TYPE_ES_VAL = (FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NUMSEPTER) or FRIBIDI_MASK_ES;  
{ European number Terminator  }
  FRIBIDI_TYPE_ET_VAL = (FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NUMSEPTER) or FRIBIDI_MASK_ET;  
{ Common Separator  }
  FRIBIDI_TYPE_CS_VAL = (FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NUMSEPTER) or FRIBIDI_MASK_CS;  
{ Non Spacing Mark  }
  FRIBIDI_TYPE_NSM_VAL = FRIBIDI_MASK_WEAK or FRIBIDI_MASK_NSM;  
{ Boundary Neutral  }
  FRIBIDI_TYPE_BN_VAL = (FRIBIDI_MASK_WEAK or FRIBIDI_MASK_SPACE) or FRIBIDI_MASK_BN;  
{ Neutral types  }
{ Block Separator  }
  FRIBIDI_TYPE_BS_VAL = ((FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_SPACE) or FRIBIDI_MASK_SEPARATOR) or FRIBIDI_MASK_BS;  
{ Segment Separator  }
  FRIBIDI_TYPE_SS_VAL = ((FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_SPACE) or FRIBIDI_MASK_SEPARATOR) or FRIBIDI_MASK_SS;  
{ WhiteSpace  }
  FRIBIDI_TYPE_WS_VAL = (FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_SPACE) or FRIBIDI_MASK_WS;  
{ Other Neutral  }
  FRIBIDI_TYPE_ON_VAL = FRIBIDI_MASK_NEUTRAL;  
{ The following are used in specifying paragraph direction only.  }
{ Weak Left-To-Right  }
  FRIBIDI_TYPE_WLTR_VAL = FRIBIDI_MASK_WEAK;  
{ Weak Right-To-Left  }
  FRIBIDI_TYPE_WRTL_VAL = FRIBIDI_MASK_WEAK or FRIBIDI_MASK_RTL;  
{ start or end of text (run list) SENTINEL.  Only used internally  }
  FRIBIDI_TYPE_SENTINEL = FRIBIDI_MASK_SENTINEL;  
{ Private types for applications.  More private types can be obtained by
 * summing up from this one.  }
  FRIBIDI_TYPE_PRIVATE = FRIBIDI_MASK_PRIVATE;  
{ New types in Unicode 6.3  }
{ Left-to-Right Isolate  }
  FRIBIDI_TYPE_LRI_VAL = FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_ISOLATE;  
{ Right-to-Left Isolate  }
  FRIBIDI_TYPE_RLI_VAL = (FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_ISOLATE) or FRIBIDI_MASK_RTL;  
{ First strong isolate  }
  FRIBIDI_TYPE_FSI_VAL = (FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_ISOLATE) or FRIBIDI_MASK_FIRST;  
{ Pop Directional Isolate }
  FRIBIDI_TYPE_PDI_VAL = (FRIBIDI_MASK_NEUTRAL or FRIBIDI_MASK_WEAK) or FRIBIDI_MASK_ISOLATE;  
{ Define Enums only if sizeof(int) == 4 (UTF-32), and not compiling C++.
 * The problem with C++ is that then casts between int32 and enum will fail!
  }
{$if defined(__FRIBIDI_DOC) || (FRIBIDI_SIZEOF_INT+0 == 4 && !defined(__cplusplus))}
{ Don't use this  }
type
  PFriBidiCharType = ^TFriBidiCharType;
  TFriBidiCharType =  Longint;
  Const
    _FRIBIDI_TYPE_SENTINEL = FRIBIDI_TYPE_SENTINEL;
;
{ Don't use this  }
type
  PFriBidiParType = ^TFriBidiParType;
  TFriBidiParType =  Longint;
  Const
    _FRIBIDI_PAR_SENTINEL = FRIBIDI_TYPE_SENTINEL;
;
{$else}
type
  PFriBidiCharType = ^TFriBidiCharType;
  TFriBidiCharType = Tuint32_t;

const
  FRIBIDI_TYPE_LTR = FRIBIDI_TYPE_LTR_VAL;  
  FRIBIDI_TYPE_RTL = FRIBIDI_TYPE_RTL_VAL;  
  FRIBIDI_TYPE_AL = FRIBIDI_TYPE_AL_VAL;  
  FRIBIDI_TYPE_EN = FRIBIDI_TYPE_EN_VAL;  
  FRIBIDI_TYPE_AN = FRIBIDI_TYPE_AN_VAL;  
  FRIBIDI_TYPE_ES = FRIBIDI_TYPE_ES_VAL;  
  FRIBIDI_TYPE_ET = FRIBIDI_TYPE_ET_VAL;  
  FRIBIDI_TYPE_CS = FRIBIDI_TYPE_CS_VAL;  
  FRIBIDI_TYPE_NSM = FRIBIDI_TYPE_NSM_VAL;  
  FRIBIDI_TYPE_BN = FRIBIDI_TYPE_BN_VAL;  
  FRIBIDI_TYPE_BS = FRIBIDI_TYPE_BS_VAL;  
  FRIBIDI_TYPE_SS = FRIBIDI_TYPE_SS_VAL;  
  FRIBIDI_TYPE_WS = FRIBIDI_TYPE_WS_VAL;  
  FRIBIDI_TYPE_ON = FRIBIDI_TYPE_ON_VAL;  
  FRIBIDI_TYPE_LRE = FRIBIDI_TYPE_LRE_VAL;  
  FRIBIDI_TYPE_RLE = FRIBIDI_TYPE_RLE_VAL;  
  FRIBIDI_TYPE_LRO = FRIBIDI_TYPE_LRO_VAL;  
  FRIBIDI_TYPE_RLO = FRIBIDI_TYPE_RLO_VAL;  
  FRIBIDI_TYPE_PDF = FRIBIDI_TYPE_PDF_VAL;  
  FRIBIDI_TYPE_LRI = FRIBIDI_TYPE_LRI_VAL;  
  FRIBIDI_TYPE_RLI = FRIBIDI_TYPE_RLI_VAL;  
  FRIBIDI_TYPE_FSI = FRIBIDI_TYPE_FSI_VAL;  
  FRIBIDI_TYPE_PDI = FRIBIDI_TYPE_PDI_VAL;  
type
  PFriBidiParType = ^TFriBidiParType;
  TFriBidiParType = Tuint32_t;

const
  FRIBIDI_PAR_LTR = FRIBIDI_TYPE_LTR_VAL;  
  FRIBIDI_PAR_RTL = FRIBIDI_TYPE_RTL_VAL;  
  FRIBIDI_PAR_ON = FRIBIDI_TYPE_ON_VAL;  
  FRIBIDI_PAR_WLTR = FRIBIDI_TYPE_WLTR_VAL;  
  FRIBIDI_PAR_WRTL = FRIBIDI_TYPE_WRTL_VAL;  
{$endif}
{ Please don't use these two type names, use FRIBIDI_PAR_* form instead.  }

const
  FRIBIDI_TYPE_WLTR = FRIBIDI_PAR_WLTR;  
  FRIBIDI_TYPE_WRTL = FRIBIDI_PAR_WRTL;  
{
 * Defining macros for needed queries, It is fully dependent on the 
 * implementation of FriBidiCharType.
  }
{ Is right-to-left level?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function FRIBIDI_LEVEL_IS_RTL(lev : longint) : Tlev;

{ Return the bidi type corresponding to the direction of the level number,
   FRIBIDI_TYPE_LTR for evens and FRIBIDI_TYPE_RTL for odds.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_LEVEL_TO_DIR(lev : longint) : longint;

{ Return the minimum level of the direction, 0 for FRIBIDI_TYPE_LTR and
   1 for FRIBIDI_TYPE_RTL and FRIBIDI_TYPE_AL.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_DIR_TO_LEVEL(dir : longint) : TFriBidiLevel;

{ Is right to left: RTL, AL, RLE, RLO?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_RTL(p : longint) : Tp;

{ Is arabic: AL, AN?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ARABIC(p : longint) : Tp;

{ Is strong?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_STRONG(p : longint) : Tp;

{ Is weak?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_WEAK(p : longint) : Tp;

{ Is neutral?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NEUTRAL(p : longint) : Tp;

{ Is sentinel?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SENTINEL(p : longint) : Tp;

{ Is letter: L, R, AL?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_LETTER(p : longint) : Tp;

{ Is number: EN, AN?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NUMBER(p : longint) : Tp;

{ Is number separator or terminator: ES, ET, CS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NUMBER_SEPARATOR_OR_TERMINATOR(p : longint) : Tp;

{ Is space: BN, BS, SS, WS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SPACE(p : longint) : Tp;

{ Is explicit mark: LRE, RLE, LRO, RLO, PDF?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT(p : longint) : Tp;

{ Is isolator  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ISOLATE(p : longint) : Tp;

{ Is text separator: BS, SS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SEPARATOR(p : longint) : Tp;

{ Is explicit override: LRO, RLO?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_OVERRIDE(p : longint) : Tp;

{ Some more:  }
{ Is left to right letter: LTR?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_LTR_LETTER(p : longint) : longint;

{ Is right to left letter: RTL, AL?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_RTL_LETTER(p : longint) : longint;

{ Is ES or CS: ES, CS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ES_OR_CS(p : longint) : Tp;

{ Is explicit or BN: LRE, RLE, LRO, RLO, PDF, BN?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN(p : longint) : Tp;

{ Is explicit or BN or NSM: LRE, RLE, LRO, RLO, PDF, BN, NSM?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN_OR_NSM(p : longint) : Tp;

{ Is explicit or BN or NSM: LRE, RLE, LRO, RLO, PDF, BN, NSM?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_ISOLATE_OR_BN_OR_NSM(p : longint) : Tp;

{ Is explicit or BN or WS: LRE, RLE, LRO, RLO, PDF, BN, WS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN_OR_WS(p : longint) : Tp;

{ Is explicit or separator or BN or WS: LRE, RLE, LRO, RLO, PDF, BS, SS, BN, WS?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_SEPARATOR_OR_BN_OR_WS(p : longint) : Tp;

{ Is private-use type for application?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_PRIVATE(p : longint) : Tp;

{ Define some conversions.  }
{ Change numbers to RTL: EN,AN -> RTL.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_CHANGE_NUMBER_TO_RTL(p : longint) : longint;

{ Override status of an explicit mark:
 * LRO,LRE->LTR, RLO,RLE->RTL, otherwise->ON.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_EXPLICIT_TO_OVERRIDE_DIR(p : longint) : longint;

{ Weaken type for paragraph fallback purposes:
 * LTR->WLTR, RTL->WRTL.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_WEAK_PARAGRAPH(p : longint) : longint;

{ Functions finally  }
{ fribidi_get_bidi_type - get character bidi type
 *
 * This function returns the bidi type of a character as defined in Table 3.7
 * Bidirectional Character Types of the Unicode Bidirectional Algorithm
 * available at
 * http://www.unicode.org/reports/tr9/#Bidirectional_Character_Types, using
 * data provided in file UnicodeData.txt of the Unicode Character Database
 * available at http://www.unicode.org/Public/UNIDATA/UnicodeData.txt.
 *
 * There are a few macros defined in fribidi-bidi-types.h for querying a bidi
 * type.
  }
{ input character  }
function fribidi_get_bidi_type(ch:TFriBidiChar):TFriBidiCharType;cdecl;external;
{ fribidi_get_bidi_types - get bidi types for an string of characters
 *
 * This function finds the bidi types of an string of characters.  See
 * fribidi_get_bidi_type() for more information about the bidi types returned
 * by this function.
  }
(* Const before type ignored *)
{ input string  }
(* Const before type ignored *)
{ input string length  }
{ output bidi types  }
procedure fribidi_get_bidi_types(str:PFriBidiChar; len:TFriBidiStrIndex; btypes:PFriBidiCharType);cdecl;external;
{ fribidi_get_bidi_type_name - get bidi type name
 *
 * This function returns the bidi type name of a character type.  The
 * returned string is a static string and should not be freed.
 *
 * The type names are the same as ones defined in Table 3.7 Bidirectional
 * Character Types of the Unicode Bidirectional Algorithm available at
 * http://www.unicode.org/reports/tr9/#Bidirectional_Character_Types, with a
 * few modifications: L->LTR, R->RTL, B->BS, S->SS.
  }
(* Const before type ignored *)
{ input bidi type  }
function fribidi_get_bidi_type_name(t:TFriBidiCharType):Pchar;cdecl;external;
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_BIDI_TYPES_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_LEVEL_IS_RTL(lev : longint) : Tlev;
begin
  FRIBIDI_LEVEL_IS_RTL:=Tlev(@(1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_LEVEL_TO_DIR(lev : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_LEVEL_IS_RTL(lev) then
    if_local1:=FRIBIDI_TYPE_RTL
  else
    if_local1:=FRIBIDI_TYPE_LTR;
  FRIBIDI_LEVEL_TO_DIR:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_DIR_TO_LEVEL(dir : longint) : TFriBidiLevel;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_IS_RTL(dir) then
    if_local1:=1
  else
    if_local1:=0;
  FRIBIDI_DIR_TO_LEVEL:=TFriBidiLevel(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_RTL(p : longint) : Tp;
begin
  FRIBIDI_IS_RTL:=Tp(@(FRIBIDI_MASK_RTL));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ARABIC(p : longint) : Tp;
begin
  FRIBIDI_IS_ARABIC:=Tp(@(FRIBIDI_MASK_ARABIC));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_STRONG(p : longint) : Tp;
begin
  FRIBIDI_IS_STRONG:=Tp(@(FRIBIDI_MASK_STRONG));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_WEAK(p : longint) : Tp;
begin
  FRIBIDI_IS_WEAK:=Tp(@(FRIBIDI_MASK_WEAK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NEUTRAL(p : longint) : Tp;
begin
  FRIBIDI_IS_NEUTRAL:=Tp(@(FRIBIDI_MASK_NEUTRAL));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SENTINEL(p : longint) : Tp;
begin
  FRIBIDI_IS_SENTINEL:=Tp(@(FRIBIDI_MASK_SENTINEL));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_LETTER(p : longint) : Tp;
begin
  FRIBIDI_IS_LETTER:=Tp(@(FRIBIDI_MASK_LETTER));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NUMBER(p : longint) : Tp;
begin
  FRIBIDI_IS_NUMBER:=Tp(@(FRIBIDI_MASK_NUMBER));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_NUMBER_SEPARATOR_OR_TERMINATOR(p : longint) : Tp;
begin
  FRIBIDI_IS_NUMBER_SEPARATOR_OR_TERMINATOR:=Tp(@(FRIBIDI_MASK_NUMSEPTER));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SPACE(p : longint) : Tp;
begin
  FRIBIDI_IS_SPACE:=Tp(@(FRIBIDI_MASK_SPACE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT:=Tp(@(FRIBIDI_MASK_EXPLICIT));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ISOLATE(p : longint) : Tp;
begin
  FRIBIDI_IS_ISOLATE:=Tp(@(FRIBIDI_MASK_ISOLATE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_SEPARATOR(p : longint) : Tp;
begin
  FRIBIDI_IS_SEPARATOR:=Tp(@(FRIBIDI_MASK_SEPARATOR));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_OVERRIDE(p : longint) : Tp;
begin
  FRIBIDI_IS_OVERRIDE:=Tp(@(FRIBIDI_MASK_OVERRIDE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_LTR_LETTER(p : longint) : longint;
begin
  FRIBIDI_IS_LTR_LETTER:=(Tp(@(FRIBIDI_MASK_LETTER or FRIBIDI_MASK_RTL)))=FRIBIDI_MASK_LETTER;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_RTL_LETTER(p : longint) : longint;
begin
  FRIBIDI_IS_RTL_LETTER:=(Tp(@(FRIBIDI_MASK_LETTER or FRIBIDI_MASK_RTL)))=(FRIBIDI_MASK_LETTER or FRIBIDI_MASK_RTL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_ES_OR_CS(p : longint) : Tp;
begin
  FRIBIDI_IS_ES_OR_CS:=Tp(@(FRIBIDI_MASK_ES or FRIBIDI_MASK_CS));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT_OR_BN:=Tp(@(FRIBIDI_MASK_EXPLICIT or FRIBIDI_MASK_BN));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN_OR_NSM(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT_OR_BN_OR_NSM:=Tp(@((FRIBIDI_MASK_EXPLICIT or FRIBIDI_MASK_BN) or FRIBIDI_MASK_NSM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_ISOLATE_OR_BN_OR_NSM(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT_OR_ISOLATE_OR_BN_OR_NSM:=Tp(@(((FRIBIDI_MASK_EXPLICIT or FRIBIDI_MASK_ISOLATE) or FRIBIDI_MASK_BN) or FRIBIDI_MASK_NSM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_BN_OR_WS(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT_OR_BN_OR_WS:=Tp(@((FRIBIDI_MASK_EXPLICIT or FRIBIDI_MASK_BN) or FRIBIDI_MASK_WS));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_EXPLICIT_OR_SEPARATOR_OR_BN_OR_WS(p : longint) : Tp;
begin
  FRIBIDI_IS_EXPLICIT_OR_SEPARATOR_OR_BN_OR_WS:=Tp(@(((FRIBIDI_MASK_EXPLICIT or FRIBIDI_MASK_SEPARATOR) or FRIBIDI_MASK_BN) or FRIBIDI_MASK_WS));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_PRIVATE(p : longint) : Tp;
begin
  FRIBIDI_IS_PRIVATE:=Tp(@(FRIBIDI_MASK_PRIVATE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_CHANGE_NUMBER_TO_RTL(p : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_IS_NUMBER(p) then
    if_local1:=FRIBIDI_TYPE_RTL
  else
    if_local1:=p;
  FRIBIDI_CHANGE_NUMBER_TO_RTL:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_EXPLICIT_TO_OVERRIDE_DIR(p : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_IS_OVERRIDE(p) then
    if_local1:=FRIBIDI_LEVEL_TO_DIR(FRIBIDI_DIR_TO_LEVEL(p))
  else
    if_local1:=FRIBIDI_TYPE_ON;
  FRIBIDI_EXPLICIT_TO_OVERRIDE_DIR:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_WEAK_PARAGRAPH(p : longint) : longint;
begin
  FRIBIDI_WEAK_PARAGRAPH:=FRIBIDI_PAR_WLTR or (Tp(@(FRIBIDI_MASK_RTL)));
end;


end.
