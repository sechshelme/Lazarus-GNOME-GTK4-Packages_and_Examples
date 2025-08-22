
unit gsl_sf_result;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_result.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_result.h
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
Pgsl_sf_result  = ^gsl_sf_result;
Pgsl_sf_result_e10  = ^gsl_sf_result_e10;
Pgsl_sf_result_e10_struct  = ^gsl_sf_result_e10_struct;
Pgsl_sf_result_struct  = ^gsl_sf_result_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_result.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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
{ Author:  G. Jungman  }
{$ifndef __GSL_SF_RESULT_H__}
{$define __GSL_SF_RESULT_H__}
type
  Pgsl_sf_result_struct = ^Tgsl_sf_result_struct;
  Tgsl_sf_result_struct = record
      val : Tdouble;
      err : Tdouble;
    end;

  Tgsl_sf_result_struct = Tgsl_sf_result;
  Pgsl_sf_result_e10_struct = ^Tgsl_sf_result_e10_struct;
  Tgsl_sf_result_e10_struct = record
      val : Tdouble;
      err : Tdouble;
      e10 : longint;
    end;

  Tgsl_sf_result_e10_struct = Tgsl_sf_result_e10;
(* Const before type ignored *)

function gsl_sf_result_smash_e(re:Pgsl_sf_result_e10; r:Pgsl_sf_result):longint;cdecl;external;
{$endif}
{ __GSL_SF_RESULT_H__  }

implementation


end.
