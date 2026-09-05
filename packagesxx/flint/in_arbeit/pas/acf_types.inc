{$IFDEF read_interface}


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

  Pacf_srcptr = ^Tacf_srcptr;
  Tacf_srcptr = Pacf_struct;
{$endif}
{ ACF_TYPES_H  }

// === Konventiert am: 29-8-26 17:30:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
