
unit gsl_minmax;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_minmax.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_minmax.h
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


{ gsl_minmax.h
 * 
 * Copyright (C) 2008 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_MINMAX_H__}
{$define __GSL_MINMAX_H__}
{$include <gsl/gsl_inline.h>}
{ Define MAX and MIN macros/functions if they don't exist.  }
{ plain old macros for general use  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MAX(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MIN(a,b : longint) : longint;

{ function versions of the above, in case they are needed  }
function gsl_max(a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
function gsl_min(a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
{ inline-friendly strongly typed versions  }
{$endif}
{ __GSL_POW_INT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MAX(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  GSL_MAX:=a>(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MIN(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  GSL_MIN:=a<(if_local1);
end;


end.
