
unit acf_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from acf_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    acf_types.h
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
Pacf_ptr  = ^acf_ptr;
Pacf_srcptr  = ^acf_srcptr;
Pacf_struct  = ^acf_struct;
Pacf_t  = ^acf_t;
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
{$ifndef ACF_TYPES_H}
{$define ACF_TYPES_H}
{$include "arf_types.h"}
{ C++ extern C conditionnal removed }
type
  Pacf_struct = ^Tacf_struct;
  Tacf_struct = record
      real : Tarf_struct;
      imag : Tarf_struct;
    end;

  Pacf_t = ^Tacf_t;
  Tacf_t = array[0..0] of Tacf_struct;

  Pacf_ptr = ^Tacf_ptr;
  Tacf_ptr = Pacf_struct;
(* Const before type ignored *)

  Pacf_srcptr = ^Tacf_srcptr;
  Tacf_srcptr = Pacf_struct;
{$endif}
{ ACF_TYPES_H  }

implementation


end.
