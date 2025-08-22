
unit gsl_test;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_test.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_test.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ err/gsl_test.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_TEST_H__}
{$define __GSL_TEST_H__}
(* Const before type ignored *)

procedure gsl_test(status:longint; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test(status:longint; test_description:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gsl_test_rel(result:Tdouble; expected:Tdouble; relative_error:Tdouble; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test_rel(result:Tdouble; expected:Tdouble; relative_error:Tdouble; test_description:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gsl_test_abs(result:Tdouble; expected:Tdouble; absolute_error:Tdouble; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test_abs(result:Tdouble; expected:Tdouble; absolute_error:Tdouble; test_description:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gsl_test_factor(result:Tdouble; expected:Tdouble; factor:Tdouble; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test_factor(result:Tdouble; expected:Tdouble; factor:Tdouble; test_description:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gsl_test_int(result:longint; expected:longint; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test_int(result:longint; expected:longint; test_description:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_test_str(result:Pchar; expected:Pchar; test_description:Pchar; args:array of const);cdecl;external;
procedure gsl_test_str(result:Pchar; expected:Pchar; test_description:Pchar);cdecl;external;
procedure gsl_test_verbose(verbose:longint);cdecl;external;
function gsl_test_summary:longint;cdecl;external;
{$endif}
{ __GSL_TEST_H__  }

implementation


end.
