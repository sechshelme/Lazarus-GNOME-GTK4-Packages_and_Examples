unit bernoulli;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef BERNOULLI_H}
{$define BERNOULLI_H}
{$include <math.h>}
{$include "arith.h"}
{$include "arb_types.h"}
{ C++ extern C conditionnal removed }
  var
    bernoulli_cache_num : Tslong;cvar;external libflint;
    bernoulli_cache : Pfmpq;cvar;external libflint;

procedure bernoulli_cache_compute(n:Tslong);cdecl;external libflint;
{xxxxxxxxx
static __inline__ slong bernoulli_denom_size(slong n)

    return 0.5 * 1.4427 * log(n) * pow(n, 1.066 / log(log(n)));


static __inline__ slong bernoulli_zeta_terms(ulong s, slong prec)

    slong N;
    N = pow(2.0, (prec + 1.0) / (s - 1.0));
    N += ((N % 2) == 0);
    return N;


static __inline__ slong bernoulli_power_prec(slong i, ulong s1, slong wp)

    slong p = wp - s1 * log(i) * 1.44269504088896341;
    return FLINT_MAX(p, 10);
;

static __inline__ slong bernoulli_global_prec(ulong nmax)

    return arith_bernoulli_number_size(nmax) + bernoulli_denom_size(nmax);
 }
{ avoid potential numerical problems for very small n  }
const
  BERNOULLI_REV_MIN = 32;  
type
  Pbernoulli_rev_struct = ^Tbernoulli_rev_struct;
  Tbernoulli_rev_struct = record
      alloc : Tslong;
      prec : Tslong;
      max_power : Tslong;
      powers : Pfmpz;
      pow_error : Tfmpz_t;
      prefactor : Tarb_t;
      two_pi_squared : Tarb_t;
      n : Tulong;
    end;

  Pbernoulli_rev_t = ^Tbernoulli_rev_t;
  Tbernoulli_rev_t = array[0..0] of Tbernoulli_rev_struct;

procedure bernoulli_rev_init(iter:Tbernoulli_rev_t; nmax:Tulong);cdecl;external libflint;
procedure bernoulli_rev_next(numer:Tfmpz_t; denom:Tfmpz_t; iter:Tbernoulli_rev_t);cdecl;external libflint;
procedure bernoulli_rev_clear(iter:Tbernoulli_rev_t);cdecl;external libflint;
procedure bernoulli_fmpq_vec_no_cache(res:Pfmpq; a:Tulong; num:Tslong);cdecl;external libflint;
function bernoulli_bound_2exp_si(n:Tulong):Tslong;cdecl;external libflint;
function bernoulli_mod_p_harvey(k:Tulong; p:Tulong):Tulong;cdecl;external libflint;
procedure _bernoulli_fmpq_ui_multi_mod(num:Tfmpz_t; den:Tfmpz_t; n:Tulong; alpha:Tdouble);cdecl;external libflint;
procedure _bernoulli_fmpq_ui_zeta(num:Tfmpz_t; den:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure _bernoulli_fmpq_ui(num:Tfmpz_t; den:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure bernoulli_fmpq_ui(b:Tfmpq_t; n:Tulong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 19:58:56 ===


implementation



end.
