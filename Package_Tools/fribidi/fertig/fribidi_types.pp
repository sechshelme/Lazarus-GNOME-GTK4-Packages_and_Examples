
unit fribidi_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_types.h
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
Pfribidi_boolean  = ^fribidi_boolean;
PFriBidiBracketType  = ^FriBidiBracketType;
PFriBidiChar  = ^FriBidiChar;
PFriBidiStrIndex  = ^FriBidiStrIndex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-types.h - define data types for the rest of the library
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
{$ifndef _FRIBIDI_TYPES_H}
{$define _FRIBIDI_TYPES_H}
{$include "fribidi-common.h"}
{$include "fribidi-begindecls.h"}
type
  Pfribidi_boolean = ^Tfribidi_boolean;
  Tfribidi_boolean = longint;

  PFriBidiChar = ^TFriBidiChar;
  TFriBidiChar = Tuint32_t;

  PFriBidiStrIndex = ^TFriBidiStrIndex;
  TFriBidiStrIndex = longint;
{ The MSB is used to indicate an opening bracket  }

  PFriBidiBracketType = ^TFriBidiBracketType;
  TFriBidiBracketType = TFriBidiChar;
{ Use FRIBIDI_NO_BRACKET for assigning to a non-bracket  }

const
  FRIBIDI_NO_BRACKET = 0;  
{ A few macros for working with bits  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function FRIBIDI_TEST_BITS(x,mask : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_INCLUDE_BITS(x,mask : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_EXCLUDE_BITS(x,mask : longint) : Tx;

{xxxxx #define FRIBIDI_SET_BITS(x, mask)	((x) |= (mask)) }
{ xxxxxxxxxx #define FRIBIDI_UNSET_BITS(x, mask)	((x) &= ~(mask)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_ADJUST_BITS(x,mask,cond : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_ADJUST_AND_TEST_BITS(x,mask,cond : longint) : longint;

{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_TYPES_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_TEST_BITS(x,mask : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if Tx(@(mask)) then
    if_local1:=1
  else
    if_local1:=0;
  FRIBIDI_TEST_BITS:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_INCLUDE_BITS(x,mask : longint) : longint;
begin
  FRIBIDI_INCLUDE_BITS:=x or mask;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FRIBIDI_EXCLUDE_BITS(x,mask : longint) : Tx;
begin
  FRIBIDI_EXCLUDE_BITS:=Tx(@( not (mask)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_ADJUST_BITS(x,mask,cond : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if cond then
    if_local1:=mask
  else
    if_local1:=0;
  FRIBIDI_ADJUST_BITS:=x:=((Tx(@( not (mask)))) or (if_local1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FRIBIDI_ADJUST_AND_TEST_BITS(x,mask,cond : longint) : longint;
begin
  FRIBIDI_ADJUST_AND_TEST_BITS:=FRIBIDI_TEST_BITS(FRIBIDI_ADJUST_BITS(x,mask,cond),mask);
end;


end.
