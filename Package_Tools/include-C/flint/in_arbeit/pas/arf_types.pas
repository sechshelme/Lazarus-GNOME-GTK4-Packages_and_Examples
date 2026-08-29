unit arf_types;

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
{$ifndef ARF_TYPES_H}
{$define ARF_TYPES_H}
{$include "flint.h"}
{ C++ extern C conditionnal removed }
{ Note: may also be hardcoded in a few places.  }

const
  ARF_NOPTR_LIMBS = 2;  
type
  Pmantissa_noptr_struct = ^Tmantissa_noptr_struct;
  Tmantissa_noptr_struct = record
      d : array[0..(ARF_NOPTR_LIMBS)-1] of Tmp_limb_t;
    end;

  Pmantissa_ptr_struct = ^Tmantissa_ptr_struct;
  Tmantissa_ptr_struct = record
      alloc : Tmp_size_t;
      d : Tmp_ptr;
    end;

  Pmantissa_struct = ^Tmantissa_struct;
  Tmantissa_struct = record
      case longint of
        0 : ( noptr : Tmantissa_noptr_struct );
        1 : ( ptr : Tmantissa_ptr_struct );
      end;

  Parf_struct = ^Tarf_struct;
  Tarf_struct = record
      exp : Tfmpz;
      size : Tmp_size_t;
      d : Tmantissa_struct;
    end;

  Parf_t = ^Tarf_t;
  Tarf_t = array[0..0] of Tarf_struct;

  Parf_ptr = ^Tarf_ptr;
  Tarf_ptr = Parf_struct;

  Parf_srcptr = ^Tarf_srcptr;
  Tarf_srcptr = Parf_struct;

  Parf_interval_struct = ^Tarf_interval_struct;
  Tarf_interval_struct = record
      a : Tarf_struct;
      b : Tarf_struct;
    end;

  Parf_interval_t = ^Tarf_interval_t;
  Tarf_interval_t = array[0..0] of Tarf_interval_struct;

  Parf_interval_ptr = ^Tarf_interval_ptr;
  Tarf_interval_ptr = Parf_interval_struct;

  Parf_interval_srcptr = ^Tarf_interval_srcptr;
  Tarf_interval_srcptr = Parf_interval_struct;
{$endif}
{ ARF_TYPES_H  }

// === Konventiert am: 29-8-26 19:59:02 ===


implementation



end.
