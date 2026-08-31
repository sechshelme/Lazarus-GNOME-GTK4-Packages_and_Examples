
unit d_vec;
interface

{
  Automatically converted by H2Pas 1.0.0 from d_vec.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    d_vec.h
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
Pdouble  = ^double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2014 Abhinav Baid

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{  Memory management  ****************************************************** }

function _d_vec_init(len:Tslong):Pdouble;cdecl;external;
procedure _d_vec_clear(vec:Pdouble);cdecl;external;
{  Randomisation  ********************************************************** }
procedure _d_vec_randtest(f:Pdouble; state:Tflint_rand_t; len:Tslong; minexp:Tslong; maxexp:Tslong);cdecl;external;
{  Assignment and basic manipulation  ************************************** }
(* Const before type ignored *)
procedure _d_vec_set(vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external;
procedure _d_vec_zero(vec:Pdouble; len:Tslong);cdecl;external;
{  Comparison  ************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function _d_vec_equal(vec1:Pdouble; vec2:Pdouble; len:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _d_vec_approx_equal(vec1:Pdouble; vec2:Pdouble; len:Tslong; eps:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function _d_vec_is_zero(vec:Pdouble; len:Tslong):longint;cdecl;external;
(* Const before type ignored *)
function _d_vec_is_approx_zero(vec:Pdouble; len:Tslong; eps:Tdouble):longint;cdecl;external;
{  Addition  *************************************************************** }
(* Const before type ignored *)
(* Const before type ignored *)
procedure _d_vec_add(res:Pdouble; vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _d_vec_sub(res:Pdouble; vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external;
{  Dot product and norm  ************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function _d_vec_dot(vec1:Pdouble; vec2:Pdouble; len2:Tslong):Tdouble;cdecl;external;
(* Const before type ignored *)
function _d_vec_norm(vec:Pdouble; len:Tslong):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _d_vec_dot_heuristic(vec1:Pdouble; vec2:Pdouble; len2:Tslong; err:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _d_vec_dot_thrice(vec1:Pdouble; vec2:Pdouble; len2:Tslong; err:Pdouble):Tdouble;cdecl;external;
{$endif}

implementation


end.
