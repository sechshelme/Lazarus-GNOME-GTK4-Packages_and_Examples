unit double_extras;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }

const
  D_BITS = 53;  
  D_EPS = 2.2204460492503130808e-16;  
  D_INF = HUGE_VAL;  
  D_NAN = HUGE_VAL-HUGE_VAL;  

function d_randtest(state:Tflint_rand_t):Tdouble;cdecl;external libflint;
function d_randtest_signed(state:Tflint_rand_t; minexp:Tslong; maxexp:Tslong):Tdouble;cdecl;external libflint;
function d_randtest_special(state:Tflint_rand_t; minexp:Tslong; maxexp:Tslong):Tdouble;cdecl;external libflint;
function d_polyval(poly:Pdouble; len:longint; x:Tdouble):Tdouble;cdecl;external libflint;
function d_lambertw(x:Tdouble):Tdouble;cdecl;external libflint;
function d_is_nan(x:Tdouble):longint;cdecl;external libflint;
function d_log2(x:Tdouble):Tdouble;cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:46 ===


implementation



end.
