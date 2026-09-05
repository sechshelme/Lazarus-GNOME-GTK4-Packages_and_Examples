{$IFDEF read_interface}


{
    Copyright (C) 2021 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
type
  Pdi_t = ^Tdi_t;
  Tdi_t = record
      a : Tdouble;
      b : Tdouble;
    end;

function di_interval(a:Tdouble; b:Tdouble):Tdi_t;cdecl;external libflint;
function _di_below(x:Tdouble):Tdouble;cdecl;external libflint;
function _di_above(x:Tdouble):Tdouble;cdecl;external libflint;
function di_neg(x:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_add(x:Tdi_t; y:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_sub(x:Tdi_t; y:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_mul(x:Tdi_t; y:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_sqr(x:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_div(x:Tdi_t; y:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_add_d(x:Tdi_t; y:Tdouble):Tdi_t;cdecl;external libflint;
function di_fast_sub_d(x:Tdi_t; y:Tdouble):Tdi_t;cdecl;external libflint;
function di_fast_mul_d(x:Tdi_t; y:Tdouble):Tdi_t;cdecl;external libflint;
function di_fast_div_d(x:Tdi_t; y:Tdouble):Tdi_t;cdecl;external libflint;
function di_fast_log_nonnegative(x:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_mid(x:Tdi_t):Tdi_t;cdecl;external libflint;
function di_fast_ubound_radius(x:Tdi_t):Tdouble;cdecl;external libflint;
procedure di_print(x:Tdi_t);cdecl;external libflint;
function arb_get_di(x:Tarb_t):Tdi_t;cdecl;external libflint;
procedure arb_set_di(res:Tarb_t; x:Tdi_t; prec:Tslong);cdecl;external libflint;
function d_randtest2(state:Tflint_rand_t):Tdouble;cdecl;external libflint;
function di_randtest(state:Tflint_rand_t):Tdi_t;cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
