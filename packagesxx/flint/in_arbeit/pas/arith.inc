{$IFDEF read_interface}


{
    Copyright (C) 2010-2012 Fredrik Johansson

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{ Various arithmetic functions ********************************************* }

const
  arith_primorial = fmpz_primorial;  

procedure _arith_harmonic_number(num:Tfmpz_t; den:Tfmpz_t; n:Tslong);cdecl;external libflint;
procedure arith_harmonic_number(x:Tfmpq_t; n:Tslong);cdecl;external libflint;
procedure arith_ramanujan_tau(res:Tfmpz_t; n:Tfmpz_t);cdecl;external libflint;
procedure arith_ramanujan_tau_series(res:Tfmpz_poly_t; n:Tslong);cdecl;external libflint;
procedure arith_divisors(res:Tfmpz_poly_t; n:Tfmpz_t);cdecl;external libflint;
const
  arith_divisor_sigma = fmpz_divisor_sigma;  
  arith_moebius_mu = fmpz_moebius_mu;  
  arith_euler_phi = fmpz_euler_phi;  
{ Stirling numbers ********************************************************* }

procedure arith_stirling_number_1u(s:Tfmpz_t; n:Tulong; k:Tulong);cdecl;external libflint;
procedure arith_stirling_number_1(s:Tfmpz_t; n:Tulong; k:Tulong);cdecl;external libflint;
procedure arith_stirling_number_2(s:Tfmpz_t; n:Tulong; k:Tulong);cdecl;external libflint;
procedure arith_stirling_number_1u_vec(row:Pfmpz; n:Tulong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_number_1_vec(row:Pfmpz; n:Tulong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_number_2_vec(row:Pfmpz; n:Tulong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_number_1u_vec_next(row:Pfmpz; prev:Pfmpz; n:Tslong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_number_1_vec_next(row:Pfmpz; prev:Pfmpz; n:Tslong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_number_2_vec_next(row:Pfmpz; prev:Pfmpz; n:Tslong; klen:Tslong);cdecl;external libflint;
procedure arith_stirling_matrix_1u(mat:Tfmpz_mat_t);cdecl;external libflint;
procedure arith_stirling_matrix_1(mat:Tfmpz_mat_t);cdecl;external libflint;
procedure arith_stirling_matrix_2(mat:Tfmpz_mat_t);cdecl;external libflint;
{ Bell numbers ************************************************************* }
const
  BELL_NUMBER_TAB_SIZE = 26;  
  var
    bell_number_tab : Pmp_limb_t;cvar;external libflint;

function arith_bell_number_size(n:Tulong):Tdouble;cdecl;external libflint;
procedure arith_bell_number(b:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure arith_bell_number_dobinski(res:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure arith_bell_number_multi_mod(res:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure arith_bell_number_vec(b:Pfmpz; n:Tslong);cdecl;external libflint;
procedure arith_bell_number_vec_recursive(b:Pfmpz; n:Tslong);cdecl;external libflint;
procedure arith_bell_number_vec_multi_mod(b:Pfmpz; n:Tslong);cdecl;external libflint;
function arith_bell_number_nmod(n:Tulong; mod:Tnmod_t):Tmp_limb_t;cdecl;external libflint;
procedure arith_bell_number_nmod_vec(b:Tmp_ptr; n:Tslong; mod:Tnmod_t);cdecl;external libflint;
procedure arith_bell_number_nmod_vec_recursive(b:Tmp_ptr; n:Tslong; mod:Tnmod_t);cdecl;external libflint;
function arith_bell_number_nmod_vec_series(b:Tmp_ptr; n:Tslong; mod:Tnmod_t):longint;cdecl;external libflint;
procedure arith_bell_number_nmod_vec_ogf(res:Tmp_ptr; len:Tslong; mod:Tnmod_t);cdecl;external libflint;
{ Euler numbers ************************************************************ }
const
  SMALL_EULER_LIMIT = 25;  
{ xxxxxxxxxxxxx
static const mp_limb_t euler_number_small[] = 
    UWORD(1), UWORD(1), UWORD(5), UWORD(61), UWORD(1385), UWORD(50521), UWORD(2702765),
    UWORD(199360981),
    UWORD(19391512145), UWORD(2404879675441), UWORD(370371188237525),
    UWORD(69348874393137901), UWORD(15514534163557086905)
#endif
 }

function arith_euler_number_size(n:Tulong):Tdouble;cdecl;external libflint;
procedure arith_euler_number_vec(res:Pfmpz; n:Tslong);cdecl;external libflint;
procedure arith_euler_number(res:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure arith_euler_polynomial(poly:Tfmpq_poly_t; n:Tulong);cdecl;external libflint;
{ Bernoulli numbers ******************************************************** }
const
  BERNOULLI_SMALL_NUMER_LIMIT = 35;  
{ xxxxxxxxxxxxx
static const slong _bernoulli_numer_small[] = 
    WORD(1), WORD(1), WORD(-1), WORD(1), WORD(-1), WORD(5), WORD(-691), WORD(7), WORD(-3617), WORD(43867), WORD(-174611), WORD(854513),
    WORD(-236364091), WORD(8553103),
#if FLINT64
    WORD(-23749461029), WORD(8615841276005), WORD(-7709321041217), WORD(2577687858367)
#endif
 }

procedure _arith_bernoulli_number(num:Tfmpz_t; den:Tfmpz_t; n:Tulong);cdecl;external libflint;
procedure arith_bernoulli_number(x:Tfmpq_t; n:Tulong);cdecl;external libflint;
procedure _arith_bernoulli_number_vec(num:Pfmpz; den:Pfmpz; n:Tslong);cdecl;external libflint;
procedure arith_bernoulli_number_vec(num:Pfmpq; n:Tslong);cdecl;external libflint;
procedure arith_bernoulli_number_denom(den:Tfmpz_t; n:Tulong);cdecl;external libflint;
function arith_bernoulli_number_size(n:Tulong):Tdouble;cdecl;external libflint;
procedure arith_bernoulli_polynomial(poly:Tfmpq_poly_t; n:Tulong);cdecl;external libflint;
procedure _arith_bernoulli_number_vec_multi_mod(num:Pfmpz; den:Pfmpz; n:Tslong);cdecl;external libflint;
procedure _arith_bernoulli_number_vec_recursive(num:Pfmpz; den:Pfmpz; n:Tslong);cdecl;external libflint;
{ Landau function ********************************************************** }
procedure arith_landau_function_vec(res:Pfmpz; len:Tslong);cdecl;external libflint;
{ Dedekind sums ************************************************************ }
{ Exponential sums ********************************************************* }
type
  Ptrig_prod_struct = ^Ttrig_prod_struct;
  Ttrig_prod_struct = record
      n : longint;
      prefactor : longint;
      sqrt_p : Tmp_limb_t;
      sqrt_q : Tmp_limb_t;
      cos_p : array[0..(FLINT_BITS)-1] of Tmp_limb_signed_t;
      cos_q : array[0..(FLINT_BITS)-1] of Tmp_limb_t;
    end;

  Ptrig_prod_t = ^Ttrig_prod_t;
  Ttrig_prod_t = array[0..0] of Ttrig_prod_struct;

procedure trig_prod_init(sum:Ttrig_prod_t);cdecl;external libflint;
procedure arith_hrr_expsum_factored(prod:Ttrig_prod_t; k:Tmp_limb_t; n:Tmp_limb_t);cdecl;external libflint;
{ Number of partitions ***************************************************** }
  var
    partitions_lookup : array[0..127] of dword;cvar;external libflint;

procedure arith_number_of_partitions_nmod_vec(res:Tmp_ptr; len:Tslong; mod:Tnmod_t);cdecl;external libflint;
procedure arith_number_of_partitions_vec(res:Pfmpz; len:Tslong);cdecl;external libflint;
procedure arith_number_of_partitions(x:Tfmpz_t; n:Tulong);cdecl;external libflint;
{ Number of sums of squares representations ******************************** }
procedure arith_sum_of_squares(r:Tfmpz_t; k:Tulong; n:Tfmpz_t);cdecl;external libflint;
procedure arith_sum_of_squares_vec(r:Pfmpz; k:Tulong; n:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 19:58:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
