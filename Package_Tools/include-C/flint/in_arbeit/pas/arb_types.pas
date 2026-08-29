unit arb_types;

interface

uses
  fp_flint;

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
{$ifndef ARB_TYPES_H}
{$define ARB_TYPES_H}
{$include "arf_types.h"}
{ C++ extern C conditionnal removed }
type
  Pmag_struct = ^Tmag_struct;
  Tmag_struct = record
      exp : Tfmpz;
      man : Tmp_limb_t;
    end;

  Pmag_t = ^Tmag_t;
  Tmag_t = array[0..0] of Tmag_struct;

  Pmag_ptr = ^Tmag_ptr;
  Tmag_ptr = Pmag_struct;

  Pmag_srcptr = ^Tmag_srcptr;
  Tmag_srcptr = Pmag_struct;

  Parb_struct = ^Tarb_struct;
  Tarb_struct = record
      mid : Tarf_struct;
      rad : Tmag_struct;
    end;

  Parb_t = ^Tarb_t;
  Tarb_t = array[0..0] of Tarb_struct;

  Parb_ptr = ^Tarb_ptr;
  Tarb_ptr = Parb_struct;

  Parb_srcptr = ^Tarb_srcptr;
  Tarb_srcptr = Parb_struct;

  Parb_mat_struct = ^Tarb_mat_struct;
  Tarb_mat_struct = record
      entries : Tarb_ptr;
      r : Tslong;
      c : Tslong;
      rows : Parb_ptr;
    end;

  Parb_mat_t = ^Tarb_mat_t;
  Tarb_mat_t = array[0..0] of Tarb_mat_struct;

  Parb_poly_struct = ^Tarb_poly_struct;
  Tarb_poly_struct = record
      coeffs : Tarb_ptr;
      alloc : Tslong;
      length : Tslong;
    end;

  Parb_poly_t = ^Tarb_poly_t;
  Tarb_poly_t = array[0..0] of Tarb_poly_struct;
{$endif}
{ ARB_TYPES_H  }

// === Konventiert am: 29-8-26 17:30:34 ===


implementation



end.
