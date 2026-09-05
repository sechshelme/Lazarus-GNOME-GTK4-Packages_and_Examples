{$IFDEF read_interface}


{
    Copyright (C) 2017 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ARB_FMPZ_POLY_H}
{$define ARB_FMPZ_POLY_H}
{$include "fmpz_poly.h"}
{$include "acb_types.h"}
{ C++ extern C conditionnal removed }

const
  ARB_FMPZ_POLY_ROOTS_VERBOSE = 1;  

procedure _arb_fmpz_poly_evaluate_acb_horner(res:Tacb_t; f:Pfmpz; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_acb_horner(res:Tacb_t; f:Tfmpz_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_fmpz_poly_evaluate_acb_rectangular(res:Tacb_t; f:Pfmpz; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_acb_rectangular(res:Tacb_t; f:Tfmpz_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_fmpz_poly_evaluate_acb(res:Tacb_t; f:Pfmpz; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_acb(res:Tacb_t; f:Tfmpz_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_fmpz_poly_evaluate_arb_horner(res:Tarb_t; f:Pfmpz; len:Tslong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_arb_horner(res:Tarb_t; f:Tfmpz_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_fmpz_poly_evaluate_arb_rectangular(res:Tarb_t; f:Pfmpz; len:Tslong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_arb_rectangular(res:Tarb_t; f:Tfmpz_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_fmpz_poly_evaluate_arb(res:Tarb_t; f:Pfmpz; len:Tslong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_evaluate_arb(res:Tarb_t; f:Tfmpz_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_deflate(result:Tfmpz_poly_t; input:Tfmpz_poly_t; deflation:Tulong);cdecl;external libflint;
function arb_fmpz_poly_deflation(input:Tfmpz_poly_t):Tulong;cdecl;external libflint;
procedure arb_fmpz_poly_complex_roots(roots:Tacb_ptr; poly:Tfmpz_poly_t; flags:longint; target_prec:Tslong);cdecl;external libflint;
procedure arb_fmpz_poly_cos_minpoly(res:Tfmpz_poly_t; n:Tulong);cdecl;external libflint;
procedure arb_fmpz_poly_gauss_period_minpoly(res:Tfmpz_poly_t; q:Tulong; n:Tulong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 17:30:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
