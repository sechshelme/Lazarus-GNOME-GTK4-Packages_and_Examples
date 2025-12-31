
unit fribidi_joining_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_joining_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_joining_types.h
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
PFriBidiArabicProp  = ^FriBidiArabicProp;
PFriBidiChar  = ^FriBidiChar;
PFriBidiJoiningType  = ^FriBidiJoiningType;
PFriBidiJoiningTypeEnum  = ^FriBidiJoiningTypeEnum;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-joining-types.h - character joining types
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
{$ifndef _FRIBIDI_JOINING_TYPES_H}
{$define _FRIBIDI_JOINING_TYPES_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-begindecls.h"}
{ 
 * Define bit masks that joining types are based on, each mask has
 * only one bit set.
  }
{ May join to right  }

const
  FRIBIDI_MASK_JOINS_RIGHT = $01;  
{ May join to right  }
  FRIBIDI_MASK_JOINS_LEFT = $02;  
{ May Arabic shape  }
  FRIBIDI_MASK_ARAB_SHAPES = $04;  
{ Is transparent  }
  FRIBIDI_MASK_TRANSPARENT = $08;  
{ Is ignored  }
  FRIBIDI_MASK_IGNORED = $10;  
{ Is ligatured  }
  FRIBIDI_MASK_LIGATURED = $20;  
{
 * Define values for FriBidiJoiningType
  }
{ nUn-joining  }
  FRIBIDI_JOINING_TYPE_U_VAL = 0;  
{ Right-joining  }
  FRIBIDI_JOINING_TYPE_R_VAL = FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_ARAB_SHAPES;  
{ Dual-joining  }
  FRIBIDI_JOINING_TYPE_D_VAL = (FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT) or FRIBIDI_MASK_ARAB_SHAPES;  
{ join-Causing  }
  FRIBIDI_JOINING_TYPE_C_VAL = FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT;  
{ Left-joining  }
  FRIBIDI_JOINING_TYPE_L_VAL = FRIBIDI_MASK_JOINS_LEFT or FRIBIDI_MASK_ARAB_SHAPES;  
{ Transparent  }
  FRIBIDI_JOINING_TYPE_T_VAL = FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_ARAB_SHAPES;  
{ iGnored  }
  FRIBIDI_JOINING_TYPE_G_VAL = FRIBIDI_MASK_IGNORED;  
{ Don't use this  }
type
  TFriBidiJoiningTypeEnum =  Longint;
  Const
    _FRIBIDI_JOINING_TYPE_JUNK = 0;

type
  PFriBidiJoiningType = ^TFriBidiJoiningType;
  TFriBidiJoiningType = Tuint8_t;
{ FriBidiArabicProp is essentially the same type as FriBidiJoiningType, but
 * not limited to the few values returned by fribidi_get_joining_type.  }

  PFriBidiArabicProp = ^TFriBidiArabicProp;
  TFriBidiArabicProp = Tuint8_t;
{
 * The equivalent of JoiningType values for ArabicProp
  }
{ Primary Arabic Joining Classes (Table 8-2)  }
{ nUn-joining  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function FRIBIDI_IS_JOINING_TYPE_U(p : longint) : longint;

{ Right-joining  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_R(p : longint) : longint;

{ Dual-joining  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_D(p : longint) : longint;

{ join-Causing  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_C(p : longint) : longint;

{ Left-joining  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_L(p : longint) : longint;

{ Transparent  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_T(p : longint) : longint;

{ iGnored  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_G(p : longint) : longint;

{ and for Derived Arabic Joining Classes (Table 8-3)  }
{ Right join-Causing  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_RC(p : longint) : longint;

{ Left join-Causing  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_LC(p : longint) : longint;

{
 * Defining macros for needed queries, It is fully dependent on the 
 * implementation of FriBidiJoiningType.
  }
{ Joins to right: R, D, C?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOINS_RIGHT(p : longint) : Tp;

{ Joins to left: L, D, C?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOINS_LEFT(p : longint) : Tp;

{ May shape: R, D, L, T?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_ARAB_SHAPES(p : longint) : Tp;

{ Is skipped in joining: T, G?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_JOIN_SKIPPED(p : longint) : Tp;

{ Is base that will be shaped: R, D, L?  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOIN_BASE_SHAPES(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_JOINS_PRECEDING_MASK(level : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_JOINS_FOLLOWING_MASK(level : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOIN_SHAPE(p : longint) : Tp;

{ Functions finally  }
{ fribidi_get_joining_type - get character joining type
 *
 * This function returns the joining type of a character as defined in Table
 * 8-2 Primary Arabic Joining Classes of the Unicode standard available at
 * http://www.unicode.org/versions/Unicode4.0.0/ch08.pdf#G7462, using data
 * provided in file ArabicShaping.txt and UnicodeData.txt of the Unicode
 * Character Database available at
 * http://www.unicode.org/Public/UNIDATA/ArabicShaping.txt and
 * http://www.unicode.org/Public/UNIDATA/UnicodeData.txt. 
 *
 * There are a few macros defined in fribidi-joining-types.h for querying a
 * joining type.
  }
{ input character  }
function fribidi_get_joining_type(ch:TFriBidiChar):TFriBidiJoiningType;cdecl;external;
{ fribidi_get_joining_types - get joining types for an string of characters
 *
 * This function finds the joining types of an string of characters.  See
 * fribidi_get_joining_type for more information about the joining types
 * returned by this function.
  }
(* Const before type ignored *)
{ input string  }
(* Const before type ignored *)
{ input string length  }
{ output joining types  }
procedure fribidi_get_joining_types(str:PFriBidiChar; len:TFriBidiStrIndex; jtypes:PFriBidiJoiningType);cdecl;external;
{ fribidi_get_joining_type_name - get joining type name
 *
 * This function returns the joining type name of a joining type.  The
 * returned string is a static string and should not be freed.
 *
 * The type names are the same as ones defined in Table 8-2  Primary Arabic
 * Joining Classes of the Unicode standard available at
 * http://www.unicode.org/versions/Unicode4.0.0/ch08.pdf#G7462.
  }
(* Const before type ignored *)
{ input joining type  }
function fribidi_get_joining_type_name(j:TFriBidiJoiningType):Pchar;cdecl;external;
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_JOINING_TYPES_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_U(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_U:=0=(Tp(@(((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT) or FRIBIDI_MASK_JOINS_LEFT)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_R(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_R:=FRIBIDI_MASK_JOINS_RIGHT=(Tp(@(((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT) or FRIBIDI_MASK_JOINS_LEFT)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_D(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_D:=((FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT) or FRIBIDI_MASK_ARAB_SHAPES)=(Tp(@((((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT) or FRIBIDI_MASK_JOINS_LEFT) or FRIBIDI_MASK_ARAB_SHAPES)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_C(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_C:=(FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT)=(Tp(@((((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT) or FRIBIDI_MASK_JOINS_LEFT) or FRIBIDI_MASK_ARAB_SHAPES)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_L(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_L:=FRIBIDI_MASK_JOINS_LEFT=(Tp(@(((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT) or FRIBIDI_MASK_JOINS_LEFT)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_T(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_T:=FRIBIDI_MASK_TRANSPARENT=(Tp(@(FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_G(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_G:=FRIBIDI_MASK_IGNORED=(Tp(@(FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_RC(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_RC:=FRIBIDI_MASK_JOINS_RIGHT=(Tp(@((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_RIGHT)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOINING_TYPE_LC(p : longint) : longint;
begin
  FRIBIDI_IS_JOINING_TYPE_LC:=FRIBIDI_MASK_JOINS_LEFT=(Tp(@((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_JOINS_LEFT)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOINS_RIGHT(p : longint) : Tp;
begin
  FRIBIDI_JOINS_RIGHT:=Tp(@(FRIBIDI_MASK_JOINS_RIGHT));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOINS_LEFT(p : longint) : Tp;
begin
  FRIBIDI_JOINS_LEFT:=Tp(@(FRIBIDI_MASK_JOINS_LEFT));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_ARAB_SHAPES(p : longint) : Tp;
begin
  FRIBIDI_ARAB_SHAPES:=Tp(@(FRIBIDI_MASK_ARAB_SHAPES));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_IS_JOIN_SKIPPED(p : longint) : Tp;
begin
  FRIBIDI_IS_JOIN_SKIPPED:=Tp(@(FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_IS_JOIN_BASE_SHAPES(p : longint) : longint;
begin
  FRIBIDI_IS_JOIN_BASE_SHAPES:=FRIBIDI_MASK_ARAB_SHAPES=(Tp(@((FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED) or FRIBIDI_MASK_ARAB_SHAPES)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_JOINS_PRECEDING_MASK(level : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_LEVEL_IS_RTL(level) then
    if_local1:=FRIBIDI_MASK_JOINS_RIGHT
  else
    if_local1:=FRIBIDI_MASK_JOINS_LEFT;
  FRIBIDI_JOINS_PRECEDING_MASK:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_JOINS_FOLLOWING_MASK(level : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if FRIBIDI_LEVEL_IS_RTL(level) then
    if_local1:=FRIBIDI_MASK_JOINS_LEFT
  else
    if_local1:=FRIBIDI_MASK_JOINS_RIGHT;
  FRIBIDI_JOINS_FOLLOWING_MASK:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_JOIN_SHAPE(p : longint) : Tp;
begin
  FRIBIDI_JOIN_SHAPE:=Tp(@(FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT));
end;


end.
