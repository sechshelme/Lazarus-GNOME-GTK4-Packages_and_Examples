
unit acb_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from acb_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    acb_types.h
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
Pacb_mat_struct  = ^acb_mat_struct;
Pacb_mat_t  = ^acb_mat_t;
Pacb_poly_struct  = ^acb_poly_struct;
Pacb_poly_t  = ^acb_poly_t;
Pacb_ptr  = ^acb_ptr;
Pacb_srcptr  = ^acb_srcptr;
Pacb_struct  = ^acb_struct;
Pacb_t  = ^acb_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2023 Albin Ahlbäck

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
type
  Pacb_struct = ^Tacb_struct;
  Tacb_struct = record
      real : Tarb_struct;
      imag : Tarb_struct;
    end;

  Pacb_t = ^Tacb_t;
  Tacb_t = array[0..0] of Tacb_struct;

  Pacb_ptr = ^Tacb_ptr;
  Tacb_ptr = Pacb_struct;
(* Const before type ignored *)

  Pacb_srcptr = ^Tacb_srcptr;
  Tacb_srcptr = Pacb_struct;

  Pacb_mat_struct = ^Tacb_mat_struct;
  Tacb_mat_struct = record
      entries : Tacb_ptr;
      r : Tslong;
      c : Tslong;
      rows : Pacb_ptr;
    end;

  Pacb_mat_t = ^Tacb_mat_t;
  Tacb_mat_t = array[0..0] of Tacb_mat_struct;

  Pacb_poly_struct = ^Tacb_poly_struct;
  Tacb_poly_struct = record
      coeffs : Tacb_ptr;
      alloc : Tslong;
      length : Tslong;
    end;

  Pacb_poly_t = ^Tacb_poly_t;
  Tacb_poly_t = array[0..0] of Tacb_poly_struct;
{$endif}
{ ACB_TYPES_H  }

implementation


end.
